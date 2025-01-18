
import java.nio.IntBuffer;
class GUI {
  GUI() {
     startB = new Button(width/2,height/2,100,30,"testing..");
     playbtn1 = new Button(int(width/2-7*fontSize/2),int(height/3.4),10,10,"play With cpu");
    blur = loadShader("blur.glsl"); 
    px = new int[15];
    py = new int[15];
    for (int i=0;i<15;i++) {
     px[i] =0;
     py[i]=0;
    }
    
  initCubeMap();
  }
  boolean playing=false;
  
 

  PShader blur;
  Button startB,playbtn1;
  int page=0;
  int px[]={0},py[]={0};
  
  void draw() {
    background(0);
    
  
    if (page==0) {
      //drawCubeMap();  
      drawScene();
      stroke(255,255,255,200);
      fill(255,255,255,200);
      
    } else 
    startB.draw();
  }
  void myBox(int w,int zf) {
    stroke(255);
     line(0,0,0,w,0,0);
     line(0,0,0,0,w,0);
     line(w,0,0,w,w,0);
     line(0,w,0,w,w,0);
     
//z
stroke(255,255,255,50);
     line(0,0,0,0,0,-w*zf);

     line(w,0,0,w,0,-w*zf);
     line(w,w,-w*zf,w,w,-w*zf);
     line(0,w,0,0,w,-w*zf);
     line(w,w,0,w,w,-w*zf);
     line(0,0,-w*zf,w,0,-w*zf);
     line(w,0,-w*zf,w,w,-w*zf);
     line(0,0,-w*zf,0,w,-w*zf);
     line(0,w,-w*zf,w,w,-w*zf);
     
  }
void drawMenuBox() {
  int boxwidth = width-width/3;
  int boxheight = height-height/3;
  int w = height/30;
  pushMatrix();
    translate(width/6,height/6,0);
    for (int i=0;i<((boxwidth/w)*(boxheight/w));i++){
     fill(0,0,0,100);
     stroke(255,255,255,150);
     pushMatrix();
       translate((i%(boxwidth/w))*w,int((i/(boxwidth/w))*w),0);
       myBox(w,6);
     popMatrix();
    }
  popMatrix();
}
void drawScene() {  
  background(0);
  
  
       for (int i=0;i<15;i++) {  
         if (((px[i]>width/6) && (px[i]<(width-width/6))) && ((py[i]>height/6) && (py[i]<(height-height/6)))) {
            fill(0,0,0,0);
            
         } else fill(255,255,255,100+i*10);
      
      stroke(255,255,255,100+i*10);
         ellipse(px[i],py[i],10+i*1.1,10+i*1.1);
         
         if (i>0) {
           px[i-1] = px[i];
           py[i-1] = py[i];
         } 
         if (i==14) {
           
           px[i] = mouseX;
           py[i]=mouseY;
         }
       }
       fill(150,140,140);
       drawMenuBox();
       if (playbtn1.draw()) {
        page=1;
        playing=true;
       }
     //  rect(width/6,height/6,width-width/3,height-height/3);
}
PShader cubemapShader;
PShape domeSphere;

IntBuffer fbo;
IntBuffer rbo;
IntBuffer envMapTextureID;

int envMapSize = 1024;   

void initCubeMap() {
  sphereDetail(50);
  domeSphere = createShape(SPHERE, height/2.0f);
  domeSphere.rotateX(HALF_PI);
  domeSphere.setStroke(false);

  PGL pgl = beginPGL();

  envMapTextureID = IntBuffer.allocate(1);
  pgl.genTextures(1, envMapTextureID);
  pgl.bindTexture(PGL.TEXTURE_CUBE_MAP, envMapTextureID.get(0));
  pgl.texParameteri(PGL.TEXTURE_CUBE_MAP, PGL.TEXTURE_WRAP_S, PGL.CLAMP_TO_EDGE);
  pgl.texParameteri(PGL.TEXTURE_CUBE_MAP, PGL.TEXTURE_WRAP_T, PGL.CLAMP_TO_EDGE);
  pgl.texParameteri(PGL.TEXTURE_CUBE_MAP, PGL.TEXTURE_WRAP_R, PGL.CLAMP_TO_EDGE);
  pgl.texParameteri(PGL.TEXTURE_CUBE_MAP, PGL.TEXTURE_MIN_FILTER, PGL.NEAREST);
  pgl.texParameteri(PGL.TEXTURE_CUBE_MAP, PGL.TEXTURE_MAG_FILTER, PGL.NEAREST);
  for (int i = PGL.TEXTURE_CUBE_MAP_POSITIVE_X; i < PGL.TEXTURE_CUBE_MAP_POSITIVE_X + 6; i++) {
    pgl.texImage2D(i, 0, PGL.RGBA8, envMapSize, envMapSize, 0, PGL.RGBA, PGL.UNSIGNED_BYTE, null);
  }

  // Init fbo, rbo
  fbo = IntBuffer.allocate(1);
  rbo = IntBuffer.allocate(1);
  pgl.genFramebuffers(1, fbo);
  pgl.bindFramebuffer(PGL.FRAMEBUFFER, fbo.get(0));
  pgl.framebufferTexture2D(PGL.FRAMEBUFFER, PGL.COLOR_ATTACHMENT0, PGL.TEXTURE_CUBE_MAP_POSITIVE_X, envMapTextureID.get(0), 0);

  pgl.genRenderbuffers(1, rbo);
  pgl.bindRenderbuffer(PGL.RENDERBUFFER, rbo.get(0));
  pgl.renderbufferStorage(PGL.RENDERBUFFER, PGL.DEPTH_COMPONENT24, envMapSize, envMapSize);

  // Attach depth buffer to FBO
  pgl.framebufferRenderbuffer(PGL.FRAMEBUFFER, PGL.DEPTH_ATTACHMENT, PGL.RENDERBUFFER, rbo.get(0));    

  endPGL();

  // Load cubemap shader.
  cubemapShader = loadShader("cubemapfrag.glsl", "cubemapvert.glsl");
  cubemapShader.set("cubemap", 1);
}

void drawCubeMap() {
  PGL pgl = beginPGL();
  pgl.activeTexture(PGL.TEXTURE1);
  pgl.enable(PGL.TEXTURE_CUBE_MAP);  
  pgl.bindTexture(PGL.TEXTURE_CUBE_MAP, envMapTextureID.get(0));     
  regenerateEnvMap(pgl);
  endPGL();
  
  drawDomeMaster();
  
  pgl.bindTexture(PGL.TEXTURE_CUBE_MAP, 0);
}

void drawDomeMaster() {
  camera();
  ortho();
  resetMatrix();
  shader(cubemapShader);
  shape(domeSphere);
  resetShader();
}

// Called to regenerate the envmap
void regenerateEnvMap(PGL pgl) {    
  // bind fbo
  pgl.bindFramebuffer(PGL.FRAMEBUFFER, fbo.get(0));

  // generate 6 views from origin(0, 0, 0)
  pgl.viewport(0, 0, envMapSize, envMapSize);    
  perspective(90.0f * DEG_TO_RAD, 1.0f, 1.0f, 1025.0f);  
  for (int face = PGL.TEXTURE_CUBE_MAP_POSITIVE_X; face < 
                  PGL.TEXTURE_CUBE_MAP_NEGATIVE_Z; face++) {
    resetMatrix();

    if (face == PGL.TEXTURE_CUBE_MAP_POSITIVE_X) {
      camera(0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f);
    } else if (face == PGL.TEXTURE_CUBE_MAP_NEGATIVE_X) {
      camera(0.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f);
    } else if (face == PGL.TEXTURE_CUBE_MAP_POSITIVE_Y) {
      camera(0.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, -1.0f);  
    } else if (face == PGL.TEXTURE_CUBE_MAP_NEGATIVE_Y) {
      camera(0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f);
    } else if (face == PGL.TEXTURE_CUBE_MAP_POSITIVE_Z) {
      camera(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, -1.0f, 0.0f);    
    }
    
    scale(-1, 1,-1);
    translate(-width * 0.5f, -height * 0.5f, -500);

    pgl.framebufferTexture2D(PGL.FRAMEBUFFER, PGL.COLOR_ATTACHMENT0, face, envMapTextureID.get(0), 0);

    drawScene(); // Draw objects in the scene
    flush(); // Make sure that the geometry in the scene is pushed to the GPU    
    noLights();  // Disabling lights to avoid adding many times
    pgl.framebufferTexture2D(PGL.FRAMEBUFFER, PGL.COLOR_ATTACHMENT0, face, 0, 0);
  }
}

}

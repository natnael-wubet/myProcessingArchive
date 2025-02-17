void setup() {
  size(640,360,P3D);
  fill(255,255,255,40);
  textSize(8);
  textFont( createFont("Ani", 16));
  sceneA = new SceneA();
}

PFont f;
SceneA sceneA;
boolean isDragging = false;

float mx=0,my=0,pmx=0,pmy=0;
void mouseDragged() {
  isDragging = true;
}
void mouseReleased(){
  isDragging = false;
}

// A boolean to track whether we are recording are not
boolean recording = false;
void draw() {
  background(0);
  pushMatrix();
  // Change height of the camera with mouseY
  camera(-mx,-my, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
         
  if (isDragging) {
    if (mouseX != pmx) {
      mx += mouseX-pmx;
    }
    if (mouseY != pmy) {
      my += mouseY-pmy;
    }
    
//    mx += (mouseX-mx)/width;
  //  my += (mouseY-my)/height;
    stroke(255);
    
    //ellipse(mx-width/2,my-height/2,5,5);
  }
  
      pmy = mouseY;
      pmx = mouseX;  
  drawAxis();
  drawGrid();
  sceneA.draw();
  pushMatrix();
  translate(0,0,0);
  fill(255,255,255,40);
  //box(50);
  popMatrix();
  popMatrix();
  forRecording();
}

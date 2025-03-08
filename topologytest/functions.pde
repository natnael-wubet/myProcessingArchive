
void drawAxis() {
  stroke(255,0,0);
  line(-width*2,0,0,width*2,0,0);
  stroke(0,255,0);
  line(0,0,-width*2,0,0,width*2);
  stroke(0,0,255);
  line(0,-height*2,0,0,height*2,0);
  
}
int gridSize =40;
void drawGrid() {
  strokeWeight(.7);
  stroke(255,255,255,100);
  for (int i=-100;i<=100;i++){
    
    line(-width*2,0,i*gridSize,width*2,0,i*gridSize);
    line(i*gridSize,0,-width*2,i*gridSize,0,width*2);
  }
  strokeWeight(1);
}
void drawArrow(float x,float y,float z, float dx, float dy, float dz) {
  pushMatrix();
  line(x,y,z,x+dx,y+dy,z+dz);
  translate(0,0,z+dz);
  ellipse(x+dx,y+dy,3,3);
  popMatrix();
}


void cam() {
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
 
}

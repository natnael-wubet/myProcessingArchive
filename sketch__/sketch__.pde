void setup() {
//s   size(500,500); 
  fullScreen(P3D);
  stroke(#ffffff);
  strokeWeight(1);
}

float t = 7;
float o=5;
void keyPressed() {
  println(key,o,t);
  if (key=='a') {
    o+=.1;
  } else if (key=='s') {
    o-=.1;
  } else if (key=='d') {
    t+=.1;
  } else if (key=='f') {
    t-=.1;
  }
}
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
 // drawAxis();
  //drawGrid();
  rec(t,10);
  popMatrix();
}

boolean isDragging = false;

float mx=0,my=0,pmx=0,pmy=0;
void mouseDragged() {
  isDragging = true;
}
void mouseReleased(){
  isDragging = false;
}

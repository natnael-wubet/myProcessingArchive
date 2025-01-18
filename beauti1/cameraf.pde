
boolean isDragging = false;

float mx=0,my=0,pmx=0,pmy=0;
void mouseDragged() {
  isDragging = true;
}
void mouseReleased(){
  isDragging = false;
}
void cameraf() {
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

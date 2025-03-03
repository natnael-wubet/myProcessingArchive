void setup() {
  size(500,500,P3D);
  stroke(255,155,155,100);
  strokeWeight(2);
}
float rotx=0,roty=0, rotz=0;
boolean dragging=false;
void mouseDragged() {
  dragging = true;
}
void mouseReleased() {
  dragging = false;
}
void draw() {
  if (dragging) {
    rotx = float(mouseY)/(height/4);
    roty = float(mouseX)/(width/4);
  }
  background(0);
  for (float i =0;i<1500;i++) {
    float f = (i+frameCount);
    float x = sin(f/40)*(100);
    float y = cos(f/10)*(100);
    pushMatrix();
    translate(width/1.5,height/2);
   
  rotateX(rotx);
  rotateY(roty);
    rotateZ(i/4);
    translate(-50,-50);
    
    rotate(PI/4);
    line(-x,-y,100,100);
    point(-x+5,-y+5);
    point(99,99);
    //line(width/10+x/2,-y/2,-x/2,y/2);
    popMatrix();  
  }
  
    pushMatrix();
    translate(width/1.5,height/2);
   
  rotateX(rotx);
  rotateY(roty);
  
  //  translate(-50,-50);
    fill(0,0,0,200);
    noStroke();
    sphere(20);
    stroke(255,100,100,100);
    popMatrix();
}

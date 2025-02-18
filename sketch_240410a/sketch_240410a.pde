/*

jusr making this to replicate arts from "math is art" video

*/

void setup(){
  size(1100,700);
  strokeWeight(1);
  stroke(255,100);
  noFill();
}
void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2,height/2);
  drawer2();
  popMatrix();
  
}

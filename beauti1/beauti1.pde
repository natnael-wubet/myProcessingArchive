void setup() {
  size(500,500,P3D);
  stroke(255);
  strokeWeight(1);
}
void draw() {
  background(0);
  //
  translate(width/2,height/2,0);
  cameraf();
  float offset = float(frameCount)/10;
  for (float i=offset;i<offset+50;i+=.1) {
   // line(f1(i*10),f2(i*10),f1(i*10),f3(i*10),f4(i*10),f4(i));
    point(f1(i*ampx),f2(i*ampy),f1(i*ampz));
   // point(f3(i*ampx2),f4(i*ampy2),f4(i*ampz2));
  }
}

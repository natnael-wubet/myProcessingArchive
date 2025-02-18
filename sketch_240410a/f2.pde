
float r2(float t) {
  return sqrt(t);
}
void drawer2() {
  rotate(-frameCount);
  for (float i=0;i<100;i+=.1) {
    float t = i+(float(frameCount)/100);
    rotate(0.1);
    
    ellipse(r2(t)*20,0,10,5);
   // line(0,0,r(t),0);
  }
}

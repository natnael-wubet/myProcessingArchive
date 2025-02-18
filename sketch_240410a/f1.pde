
float r(float t) {
  return exp(t/9);
}
void drawer() {
  rotate(-frameCount);
  for (float i=0;i<100;i+=.1) {
    float t = i+(float(frameCount)/100);
    rotate(0.1);
    
    ellipse(r(t),0,20,10);
   // line(0,0,r(t),0);
  }
}

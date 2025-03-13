float funA(float x) {
  return sin(x/30)*30;
}
int powof(float x){
  return (int(x<0)*-2) + 1;
}
float funB(float x) {
  //x=x/100;
  if (int(x/30)%2 != 0) {
    stroke(0,255,0);
    return (powof(x)*30)-(x%30);
  }
  else {
    stroke(255,0,0);
    return (x%30);
  }
  //return 1/(1-x);
}
float funC(float x){
  float a = funA(x);
  float b = funB(x);
  return (a*b)/mouseX;
}
float funD(float x){
  float a = funA(x);
  float b = funB(x);
  return (a+b)/mouseY;
}

float[] convoluted(float a[],float b[]) {
  float res[] = new float[a.length];
  for (int i=0;i<res.length;i++) {
    res[i]=0;
    for (int j=0;j<res.length;j++) {
      res[i]+=a[i]*b[j];
    }
    res[i] = (res[i]*(mouseX/10))/res.length;
  }
  return res;
}

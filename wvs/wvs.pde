void setup() {
  size(500,500);
  stroke(255);
  strokeWeight(1);
}
float freq = 20;
float ps = 10;
void mousePressed() {
  ps+=1;
}
float wave(float x,float p) {
  return cos((freq+x)*p)*30;
}
void draw() {
  background(0);
  float init = float(frameCount)/1;
  translate(0,height/2);
  for (float i=init;i<width+init;i++){
   
     
      float y=0;
    for(float p=0;p<ps;p++){
      y+=wave(i/10,p/10);
      point(i-init,wave(i/10,p/10));
    }
    y = y/ps;
    point(i-init,-150+y);
    //point(
  }
}

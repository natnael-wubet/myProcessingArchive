void setup() {
  fullScreen();
  //size(1000,500);
  stroke(255);
  strokeWeight(1);
}
float z=0;
float rx(float x){
  return (width/2) + (x*(width/2));
}
float ry(float y){
  return (height/2) + (y*(height/2));
}
float rc(float c) {
  return (192 + (c*63))%255;
}
color col(float i, float z){
  return color(
    rc(cos(i/(z/10))),
    rc(sin(i/2)),
    rc(cos(z/(i/10))),200
    );
}
void draw() {
 // z+=.1;
  background(0);
  for (float i=z;i<width+z;i+=.1){
    float x = rx(sin(i/2));
    float y = ry(cos(i/(z/10)));
    stroke(col(i,z));
//   stroke(color(100,100,100));
    point(x,y);
    
  }
  rect(40,height-40,map(mouseX,0,width,40,width-40),height-80);
  z+=.1;//mouseX/30;
//  z++;
}
float sig(float x,float l) {
  if (x<l)return x;
  if (int(x/l)%2==1) return l-(x%l);
  return x%l;
}

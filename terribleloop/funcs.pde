void f(float x) {
  rotate(x);
  float len=(width/8)+(sin(cos(x))*(width/8));
  line(0,0,len,0);
}
float lm(float x,float l){
  if (x>l)return l;
  return x;
}
void tree(float i,float len) {
  if (i<=.5)return;
  strokeWeight(i);
  
  stroke(
    128+lm(i*10,128),
    128-lm(i*10,128),
    0
  );
  line(0,0,0,(i*len));
  
  pushMatrix();
  translate(0,(i*len));
  rotate(PI/10);
  tree(
    i-1,
    len
  );
  popMatrix();
  
  pushMatrix();
  
  translate(0,(i*len));
  rotate(-(PI/10));
  tree(
    i-1,
    len
  );
  popMatrix();
}

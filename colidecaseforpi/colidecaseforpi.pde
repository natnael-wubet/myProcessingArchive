void setup() {
  fullScreen();
  a=new ColObj(80,80,0,0);
  b=new ColObj(90,120,300,0);
  b.dx=-1;
  a.dx=2;
  
}
ColObj a;
ColObj b;
void draw() {
  background(0);
  translate(width/10,height/2);
  a.draw(b);
  b.draw(a);
  
  
  
}

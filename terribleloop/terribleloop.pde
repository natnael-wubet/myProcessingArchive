void setup() {
  fullScreen();
  stroke(255,255,255,100);
  fill(255);
}
void drawAxis() {
  stroke(0,255,0);
  line(0,height/2,width,height/2);
  stroke(255,0,0);
  line(width/2,0,width/2,height);

  stroke(255,255,255,100);
}
float oset =.1;
void draw() {
  background(0);
  
  rect(40,height-90,map(mouseX,0,width,40,width-40),10);
  //drawAxis();
  
  text(1+oset,100,100);
  translate(width/2,height-(height/20));
  //ellipse(0,0,50,50);
  //for (float i=oset;i<(PI*2)+oset;i+=.01){
    //pushMatrix();
    //f(i);
    //popMatrix();
  //}
  pushMatrix();
 rotate(PI);
  tree(1+oset,10);
  popMatrix();
  oset=float(mouseX)/100;
}

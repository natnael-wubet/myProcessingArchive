void drawAxis() {
  stroke(255,0,0);
  line(-width*2,0,0,width*2,0,0);
  stroke(0,255,0);
  line(0,0,-width*2,0,0,width*2);
  stroke(0,0,255);
  line(0,-height*2,0,0,height*2,0);
  
}
int gridSize =40;
void drawGrid() {
  strokeWeight(.7);
  stroke(255,255,255,100);
  for (int i=-100;i<=100;i++){
    
    line(-width*2,0,i*gridSize,width*2,0,i*gridSize);
    line(i*gridSize,0,-width*2,i*gridSize,0,width*2);
  }
  strokeWeight(1);
}


void rec(float i,int scale) {
  if (i<1) return;
  
  strokeWeight(i*3);
  stroke(i*100,255-i*100,(frameCount%255)*i*o,150);
  line(0,0,0,-(i*scale));
  
  pushMatrix();
  translate(0,-(i*scale));
  rotateZ(PI/o);
  rec(i-1,scale);
  popMatrix();
  
  pushMatrix();
  translate(0,-(i*scale));
  rotateZ(-PI/o);
  rec(i-1,scale);
  popMatrix();
  
  
  
  pushMatrix();
  translate(0,-(i*scale));
  rotateX(PI/o);
  rec(i-1,scale);
  popMatrix();
  
  
  pushMatrix();
  translate(0,-(i*scale));
  rotateX(-PI/o);
  rec(i-1,scale);
  popMatrix();
}

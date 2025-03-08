void setup() {
  size(500,500,P3D);  
  stroke(255);
  noFill();
}
float sz = 500;
float[] p1(float i) {
  float ret[]= {sin(i/fsin)*(sz/2),cos(i/fcos)*(sz/2)};
  return ret;
}
float q=0;
void draw() {
  background(0);
  
  drawGrid();
  drawAxis();
    cam();
  q++;
  //translate(width/2,height/2);
  stroke(255);
//ellipse(0,0,80,80);
  rotateX(PI/2);
  for(float i=0;i<2000;i+=.3){
    float tmp[] =p1((i)/10);
    point(tmp[0],tmp[1]);
    
    float tmp2[] =p1((100+i)/10);
    float diffx = (tmp[0]+tmp2[0])/2;
    float diffy = (tmp[1]+tmp2[1])/2;
    
    float dist = sqrt(pow(diffx,2)+pow(diffy,2));
    //float dist = (abs(tmp[0]-diffx)+abs(tmp[1]-diffy));
    point(diffx,diffy,dist);
   // line(diffx,diffy,0,diffx,diffy,abs(tmp[0]-diffx));
  }
  for(float i=0;i<1;i++){
    float tmp[] =p1((i+q)/10);
    ellipse(tmp[0],tmp[1],5,5);
    float tmp2[] =p1((100+i+q)/10);
    ellipse(tmp2[0],tmp2[1],5,5);
    line(tmp[0],tmp[1],tmp2[0],tmp2[1]);
    float diffx = (tmp[0]+tmp2[0])/2;
    float diffy = (tmp[1]+tmp2[1])/2;


    float dist = sqrt(pow(diffx,2)+pow(diffy,2));
    line(diffx,diffy,0,diffx,diffy,dist);
    
    ellipse(
      (tmp[0]+tmp2[0])/2,
      
      (tmp[1]+tmp2[1])/2,
      5,5);
    
  }
}

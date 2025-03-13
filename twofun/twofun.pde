void setup() {
  size(500,500);
  stroke(255);
  fora = new float[width];
  forb = new float[width];
  res= new float[width];
  
  for (int i=0;i<width;i++) {
     fora[i]=0;
     forb[i]=0;
     res[i]=0;
     
  }
}
float fora[],forb[],res[];
void draw(){
  background(0);
  stroke(255);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
  for (float i=-width/2;i<width/2;i++){
    fora[int(i+width/2)]=funA(i);
    forb[int(i+width/2)]=funB(i);
    
    point(i+width/2,height/2-res[int(i+width/2)]);
    
    //point(i+width/2,height/2-funB(i));
    //point(i+width/2,height/2-funA(i));
    
    //point(i+width/2,height/2+funB(i)*100);
    //point(i+width/2,(height/2)-funC(i));
    //point(i+width/2,(height/2)-funD(i));
  }
  res = convoluted(fora,forb);
}

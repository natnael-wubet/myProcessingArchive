class Dice {
  Dice() {
    
  
  
  }
  int len = 20;
  int face = 1;
  int faces[] = {1,2,3,4,5,6};
  int counter(int direction) {
     if (direction==1){
       face = (face+1)%4;
       
       
     
   }
   return 0;
  }
  void drawAxis() {
   stroke(#ff0000);
   line(-width*1.5,0,0,width*1.5,0,0);
   stroke(#00ff00);
   line(0,0,-width*1.5,0,0,width*1.5);
   stroke(#0000ff);
   line(0,-height*1.5,0,0,height*1.5,0);
   
  }
  void die() {
   drawAxis();
    box(len);
    // face 1
    pushMatrix();
    translate(-len/2,-len/2,len/2);
    ellipse(len/2,len/2,len/4,len/4);
    popMatrix();
    // face 2
    pushMatrix();
    rotateY(-PI/2);
    translate(-len/2,-len/2,len/2);
    
    ellipse(len/3,len/5,len/5,len/5);
    ellipse(len-len/3,len-len/5,len/5,len/5);
    popMatrix();
    // face 3
    pushMatrix();
    rotateY(-PI);
    translate(-len/2,-len/2,len/2);
    
    ellipse(len/4,len/5,len/5,len/5);
    ellipse(len/2,len/2,len/5,len/5);
    ellipse(len-len/4,len-len/5,len/5,len/5);
    
    popMatrix();
    // face 4
    pushMatrix();
    rotateY(PI/2);
    translate(-len/2,-len/2,len/2);
    
    ellipse(len/4,len/5,len/5,len/5);
    ellipse(len-len/4,len/5,len/5,len/5);
    
    ellipse(len/4,len-len/5,len/5,len/5);
    
    ellipse(len-len/4,len-len/5,len/5,len/5);
    
    
    popMatrix();
    // face 5
    pushMatrix();
    rotateX(PI/2);
    translate(-len/2,-len/2,len/2);
    
    ellipse(len/2,len/2,len/5,len/5);    
    ellipse(len/4,len/5,len/5,len/5);
    ellipse(len-len/4,len/5,len/5,len/5);
    
    ellipse(len/4,len-len/5,len/5,len/5);
    
    ellipse(len-len/4,len-len/5,len/5,len/5);
    
    
    popMatrix();
    // face 6
    pushMatrix();
    rotateX(-PI/2);
    translate(-len/2,-len/2,len/2);
    
    ellipse(len/4,len/6,len/5,len/5);
    
    ellipse(len/4,len/2,len/5,len/5);
    
    ellipse(len/4,len-len/6,len/5,len/5);
    
    ellipse(len-len/4,len/6,len/5,len/5);
    
    ellipse(len-len/4,len/2,len/5,len/5);
    
    ellipse(len-len/4,len-len/6,len/5,len/5);
    
    popMatrix();
  }
  int prediction=1;
  void toss(){
    ruler.playerEvent = 1;
    tossNum[0]=float(int(random(0,4)));
    tossNum[1]=float(int(random(0,4)));
    
    orientation[0] = 0.0;
    orientation[1] = 0.0;
     prediction=int(tossNum[0]+1);
    
    if (tossNum[1]==1) prediction = 5;
    else if (tossNum[1]==3) prediction = 6;
    else if (tossNum[1] == 2){
      if (tossNum[0] == 0) prediction = 3;
      else if (tossNum[0] == 1) prediction = 4;
      else if (tossNum[0] == 2) prediction = 1;
      else prediction = 2;
    } 
    println("tossings: ",tossNum[0],tossNum[1]);
    println("prediction: ",prediction);
    tossing = true;
  }
  float tossNum[] = {0,0};
  
  float orientation[] = {0.0,0.0};
  boolean flipflop = true;
  boolean tossing=false;
  void draw(){
      pushMatrix();
      translate(width/2,height-height/6,0);
    if (tossing) {
      if (flipflop) {
      if (orientation[0]<tossNum[0])orientation[0]+=.25;
      rotateY(orientation[0]*(PI/2));
      } else {
      rotateX(orientation[1]*(PI/2));
      if (orientation[1]<tossNum[1])orientation[1]+=.25;
      }
      flipflop = !flipflop;
      if ((orientation[0] == tossNum[0]) && (orientation[1] == tossNum[1]))tossing=false;
     // println("rand",tossNum[0],tossNum[1]);
      die();
      
    } else {
      
//     rotateY((2*PI)*(float(mouseX)/float(width)));
  //    rotateX((2*PI)*(float(mouseY)/float(height)));
      
      rotateY(tossNum[0]*(PI/2));
      if (tossNum[0]%2 ==0)  {
       if (tossNum[0] == 0) 
        rotateX(-tossNum[1]*(PI/2));
       else  rotateX(tossNum[1]*(PI/2));
      }else if (tossNum[0] == 1)rotateZ(-tossNum[1]*(PI/2));
      else rotateZ(tossNum[1]*(PI/2));
      
      
      
      die();
      
    }
    
      popMatrix();
  }
}

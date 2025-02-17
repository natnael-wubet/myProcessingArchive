class Person {
  Person(float locx,float locy,float locz) {
    x=locx;
    y=locy;
    z=locz;
  }
  float x,y,z,len = 60;
  
  void draw() {
    pushMatrix();
    translate(x,y,z);
    fill(255);
    // legs
    
    ellipse(-len/18,-len/35,len/15,len/20); // left foot
    ellipse(len/8,-len/35,len/15,len/20); // right foot
    translate(-len/50,-len/40,0);
    // left lower leg
    pushMatrix();
    translate(0,-len/10,0);
    rotateZ(PI/14);
    ellipse(0,0,len/20,len/5); // left lower leg
    popMatrix();
    //right lower leg
    pushMatrix();
    translate(len/10,-len/10,0);
    rotateZ(-PI/14);
    ellipse(0,0,len/20,len/5); // right lower leg
    popMatrix();
    
    //torso
    pushMatrix();
    translate(0,-len/5,0);
    ellipse(len/22,-len/12,len/7,len/4);
    popMatrix();
    //head
    pushMatrix();
    translate(len/22,-len/5-len/4,0);
    ellipse(0,-len/42,len/15,len/10);
    popMatrix();
    
    // shoulder
    pushMatrix();
    translate(len/22,-len/2.6,0);
    
    ellipse(0,0,len/7,len/20); // left lower leg
    popMatrix();
    
    // left hand
    pushMatrix();
    translate(-len/17,-len/5-len/10,0);
    rotateZ(PI/8);
    ellipse(0,0,len/25,len/6); // left lower leg
    popMatrix();
    
    
    // left hand
    pushMatrix();
    translate(len/6.8,-len/5-len/10,0);
    rotateZ(-PI/8);
    ellipse(0,0,len/25,len/6); // left lower leg
    popMatrix();
    
    
    popMatrix();
  }
}

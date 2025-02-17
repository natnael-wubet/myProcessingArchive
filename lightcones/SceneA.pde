class SceneA {
  SceneA() {
    personA = new Person(100,0,100);
    clock1 = new BounceClock(10,0,50,30);  
    ballA = new CollisionShape(0,0,40,10,11, 10,0);
    ballA.sc = color(255,110,110);
    ballA.fc = color(255,200,200,50);
    ballB = new CollisionShape(80,0,40,10,10,10,0);
    ballB.dx =-.2;
    ballB.sc = color(150,255,250);
    ballB.fc = color(200,255,200,50);
    ballA.z = 0;
	//for drawF
	ballB.y-=80;
  }
  CollisionShape ballA,ballB;
  BounceClock clock1;
  Person personA;
  void drawA(){
    ballA.collide(ballB);
    ballB.collide(ballA);
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();
  }
  void drawB(){
    pushMatrix();
    translate(0,0,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,10);
    translate(0,-10,10);
    text("(0,0,0)",0,0);
    sphere(.6);
    popMatrix();
    ballA.collide(ballB);
    ballB.collide(ballA);
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();
  }
  void drawC(){
    pushMatrix();
    translate(0,0,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,0,0)",0,0);
    sphere(.6);
    popMatrix();
    
    pushMatrix();
    translate(0,0,40);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,-10,0,-10,-10);
    translate(0,-10,-10);
    text("(0,0,1)",0,0);
    sphere(.6);
    popMatrix();
    //ballA.collide(ballB);
    //ballB.collide(ballA);
    if (ballB.x <0) ballB.dx = 0;
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();
  }
  void drawD(){
    pushMatrix();
    translate(0,0,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,0,0)",0,0);
    sphere(.6);
    popMatrix();
    
    pushMatrix();
    translate(40,0,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(1,0,0)",0,0);
    sphere(.6);
    popMatrix();
    //ballA.collide(ballB);
    //ballB.collide(ballA);
    ballB.dx=0;
    ballB.x = 40;
    ballB.z=0;
    if (ballB.x <0) ballB.dx = 0;
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();
  }
  
  void drawE(){
    pushMatrix();
    translate(0,0,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,0,0)",0,0);
    sphere(.6);
    popMatrix();
    
    pushMatrix();
    translate(0,-40,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,1,0)",0,0);
    sphere(.6);
    popMatrix();
    //ballA.collide(ballB);
    //ballB.collide(ballA);
    ballB.dx=0;
    ballB.x = 0;
    ballB.y = -40;
    
    ballB.z=0;
    if (ballB.x <0) ballB.dx = 0;
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();3
  }
  
  
  void drawF(){
    ballB.z=0;
    ballA.collide(ballB);
    ballB.collide(ballA);
    ballA.draw();
    ballB.draw();
    
    //personA.draw();
    //clock1.draw();
  }
  void draw(){
    pushMatrix();
    translate(0,0,0);
    pushMatrix();
    translate(0,-120,1);
    
    text("Pauli's exclusion principle",0,0);
    popMatrix();
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,0,0)",0,0);
    sphere(.6);
    popMatrix();
    
    pushMatrix();
    translate(0,ballB.y-10,0);
    fill(255,255,0);
    stroke(255,255,0);
    line(0,0,0,0,-10,0);
    translate(0,-10,0);
    text("(0,"+str(ballB.y/40)+",0)",0,0);
    sphere(.6);
    popMatrix();
    //ballA.collide(ballB);
    //ballB.collide(ballA);
    ballB.dx=0;
    ballB.x = 0;
    //ballB.y = -40;
    
    ballB.z=0;
    if (ballB.x <0) ballB.dx = 0;
    
  lights();
  
    ballA.draw();
    ballB.draw();
	
	strokeWeight(3);
	line(
		ballA.x-15, ballA.y, ballA.z,
		ballB.x-15, ballB.y, ballB.z);
	strokeWeight(1);
    //personA.draw();
    //clock1.draw();3
  }
  
}

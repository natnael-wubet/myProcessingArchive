void setup() {
 //fullScreen();
 
  size(640, 360, P3D);
 scene = new Video();
 scene.setup();
}
Video scene;
String output = "/home/n/toutput/frames####.png";
boolean recording = false;

void draw() {
  
  background(0);
  pushMatrix();
   
   translate(0,0,-10);
   scene.draw();
   popMatrix();
   
  pushMatrix();
   translate(0,-50,50);
  if (recording) {
    saveFrame(output);
  }
  
  // Let's draw some stuff to tell us what is happening
  // It's important to note that none of this will show up in the
  // rendered files b/c it is drawn *after* saveFrame()
  textAlign(CENTER);
  fill(255);
  rect(0,height-70,width,100);
  
  fill(10);
  if (!recording) {
    text("Press r to start recording.", width/2, height-24);
  } 
  else {
    text("Press r to stop recording.", width/2, height-24);
  }
   stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
   stroke(255,0,0);
  }
  ellipse(width/2, height-48, 16, 16);
  popMatrix();
  fill(255);
}
void keyPressed() {
  
  // If we press r, start or stop recording!
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}

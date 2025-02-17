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


void forRecording() {
  if (recording) {
    saveFrame("/home/n/codedvid/scene07/frames####.png");
  }
   
  // Let's draw some stuff to tell us what is happening
  // It's important to note that none of this will show up in the
  // rendered files b/c it is drawn *after* saveFrame()
  textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Press r to start recording.", width/2, height-24);
  } 
  else {
    text("Press r to stop recording.", width/2, height-24);
  }
  
  // A red dot for when we are recording
  stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16); 
}
void lights() {
  pointLight(150, 100, 0, // Color
             200, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(0, 102, 255, // Color
                   1, 0, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
            0, 40, 200, // Position
            0, -0.5, -0.5, // Direction
            PI / 2, 2); // Angle, concentration
   
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
   directionalLight(204, 204, 204, -dirX, -dirY, -1); 
   
}
void keyPressed() {
  
  // If we press r, start or stop recording!
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}

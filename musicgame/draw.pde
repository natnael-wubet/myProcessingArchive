void draw() {
  
  background(0);

  // Draw debug graph in the background
  drawDebug();

  // If a beat is currently detected, light up the indicator
  if (beatDetector.isBeat()) {
    fill(255);
  } else {
    fill(0);
  }
  
  stroke(255);
  strokeWeight(1);
  rect(20, 20, 15, 15);
  
  fill(255);
  textAlign(LEFT, TOP);
  text("BEAT DETECTED", 40, 20);
}

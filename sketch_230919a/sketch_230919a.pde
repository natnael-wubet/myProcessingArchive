void setup() {
  size(400,400); 
  waveA = new Wave(33);
  stroke(255);
  strokeWeight(3);
}
Wave waveA;
void draw() {
  background(0); 
  waveA.draw();
}

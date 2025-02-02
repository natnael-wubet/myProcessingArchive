void setup(){
   size(400, 200);
  background(255);

  sample = new SoundFile(this, "Victory.mp3");
  sample.loop();
  
  beatDetector = new BeatDetector(this);
  beatDetector.input(sample);
  
  // The sensitivity determines how long the detector will wait after detecting
  // a beat to detect the next one.
  beatDetector.sensitivity(140);
}

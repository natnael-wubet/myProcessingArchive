class Wave {
   float waveLength;
   float time;
   float Energy;
   float plankConstant = 1.657;
   private float frequency(float Energy) {
     return Energy/plankConstant;
   }
   private float angularFrequency(float frequency) {
     return 2*PI*frequency; 
   }
   private float k(float waveLength) {
     return (2*PI)/waveLength;
   }
   
   Wave(int x) {
     Energy = .1;
     time = 0;
     waveLength = 5;
   }
   void draw() {
     for (float i = 0.1;i<100;i+=0.01){
       
       float y=acos((i+time)*k(waveLength) - ((time+i)*angularFrequency(frequency(Energy))));
       point(i*2,y+height/2); 
       
       float testy = acos(i);
       println(y,k(waveLength),angularFrequency(frequency(Energy)));
       point(i,testy+height/2);
     }
   }
}

class Map {
  Map() {
    mapLength  = 30;
  }
  int mapLength;
  void draw() {
    stroke(#000000);
    translate(40,40,0);
    for (int i=0;i<13;i++){
      for (int j =0;j<13;j++) {
        pushMatrix();
        translate(i*mapLength,j*mapLength,0);
        
         if (i == 6) {
            if ((j > 0) && (j<6)) {
              fill(#00ff00);
            } else if ((j < 12) && (j>=7)) fill(#0000ff); 
            else fill(#ffffff);
         } 
         if (j == 6) {
            if ((i > 0) && (i<6)) {
              fill(#ff0000);
            } else if ((i < 12) && (i>=7)) fill(#ffff00); 
            else fill(#ffffff);
         }
         if ((i!=6) && (j!=6)) {
           if ((i==1) && (j==5)) fill(#ff0000);
           else if ((i==7) && (j==1)) fill(#00ff00);
           else if ((i==11) && (j==7)) fill(#ffff00);
           else if ((i==5) && (j==11)) fill(#0000ff);
           else fill(#ffffff);
         }
        box(mapLength,mapLength,mapLength);
        popMatrix();
      }
    }
    color colors[] = {#ff0000,#00ff00,#0000ff,#ffff00};
    fill(#ffffff);
    for (int i=0;i<4;i++){
      pushMatrix();
      translate((2+(i%2)*8)*mapLength,(2+(i/2)*8)*mapLength,1);
      stroke(colors[i]);
      box(5*mapLength,5*mapLength,mapLength);
      for (int j=0;j<4;j++) {
        pushMatrix();  
        translate((-1+(j%2)*2)*mapLength,(-1+(j/2)*2)*mapLength,1);
        box(mapLength);
        popMatrix();  
      }
      popMatrix();
    }
    
    stroke(#000000);
  }
}

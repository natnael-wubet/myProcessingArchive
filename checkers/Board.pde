class Board{
  float gridsize=0;
  Board(){
      gridsize = float(min(width,height))/10;
  }
  void draw(){
    for (int i=0;i<8;i++){
      for (int j=0;j<8;j++){
        fill(100+155*((i+j)%2),60+195*((i+j)%2),255*((i+j)%2));
        rect(i*gridsize,j*gridsize,gridsize,gridsize);
        
      }
    }
  }
  
}

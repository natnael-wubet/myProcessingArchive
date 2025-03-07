class Player{
  int id=0;
  float s=0;
  int poses[][]; // nodes, xy
  Player(int id_){
    id =id_;
    poses=new int[12][2];
    s=board.gridsize*0.5;
    for (int i=0;i<12;i++){
      poses[i]=new int[2];
      poses[i][0] = i%4;
      poses[i][1] = i/4;
    }
  }
  void draw() {
     for (int i=0;i<12;i++){
       fill(id*255,60,255-id*255);
       float x = poses[i][0] * board.gridsize*2 +(board.gridsize*int(poses[i][1]%2!=id)) +s;
       float y = poses[i][1] * board.gridsize +s;
       if(id==1) {
         y=8*board.gridsize -y;
         
       }
       ellipse(x,y,s,s);
     }
  }
}

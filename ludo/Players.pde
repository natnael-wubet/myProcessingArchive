class Players {
  Players(int id_,int mapl) {
    id = id_;
    mapLength = mapl;
    player = new Player[4];
    for (int i=0;i<player.length;i++) {
      player[i] = new Player(i,id_); 
    }
  }
  
  int id,mapLength,onField =0;
  Player player[];
    color colors[] = {#ff0000,#00ff00,#0000ff,#ffff00};
  private class Player {
    Player(int id_,int parent_id) {
      pid = parent_id;
      id = id_;
      out = false;
    }
    int id,pos=0,pid;
    
    boolean out;
    void draw() {
      if (!out) {
      pushMatrix();
      translate((2+(pid%2)*8)*mapLength,(2+(pid/2)*8)*mapLength,1+mapLength/3);
        pushMatrix();
        translate((-1+(id%2)*2)*mapLength,(-1+(id/2)*2)*mapLength,1+mapLength/3);
    
    
        sphere(mapLength/3);
        if (pid == ruler.nowPlaying) {
          pushMatrix();
          translate(-mapLength/2 ,-mapLength/2 ,mapLength/4);
          myBox(mapLength,2,.3);
          popMatrix();
        }
        popMatrix();
        popMatrix();
      
      }
    }
  }
  void draw() {
    
    
    stroke(colors[id]);
      if (id == ruler.nowPlaying) {
        pushMatrix();
        
      translate(mapLength/2+ (6*mapLength)*(id%2),mapLength/2+ (6*mapLength)*(id/2),mapLength);
        translate((-1+(id%2)*2)*mapLength,(-1+(id/2)*2)*mapLength,0);
        myBox(5*mapLength,.3,.7);
        popMatrix();
        sphereDetail(8);
      } else sphereDetail(3);
    stroke(colors[id]);
    for (int i=0;i<player.length;i++) {
      
      player[i].draw();
    }
  }
  
  void myBox(int w,float zf,float st) {
    strokeWeight(st);
    
     line(0,0,0,w,0,0);
     line(0,0,0,0,w,0);
     line(w,0,0,w,w,0);
     line(0,w,0,w,w,0);
     //z
     
     line(0,0,0,0,0,-w*zf);

     line(w,0,0,w,0,-w*zf);
     line(w,w,-w*zf,w,w,-w*zf);
     line(0,w,0,0,w,-w*zf);
     line(w,w,0,w,w,-w*zf);
     line(0,0,-w*zf,w,0,-w*zf);
     line(w,0,-w*zf,w,w,-w*zf);
     line(0,0,-w*zf,0,w,-w*zf);
     line(0,w,-w*zf,w,w,-w*zf);
     strokeWeight(1);
  }
} 

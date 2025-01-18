class Ruler {
  Ruler () {
    
  }
  public int playerEvent=0; // 0 for can toss, 1 for tossed and waiting to select, 2 for movments, 
  public int nowPlaying = 0;
  
  void draw() {
    if (playerEvent == 1) {
     if (players[nowPlaying].onField ==0){
      if (dice.prediction == 6) {
        playerEvent = 2;
      } else {
         playerEvent = 0;
         nowPlaying = (nowPlaying+1)%4;
      }
     }
    }
  }
}

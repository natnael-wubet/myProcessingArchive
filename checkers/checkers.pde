 void setup(){
   size(600,600);
   board = new Board();
   player1=new Player(0);
   player2=new Player(1);
   
 }
 
 
 void draw(){
   
   background(0);
   translate(board.gridsize,board.gridsize);
   board.draw();
   player1.draw();
   player2.draw();
 }
 
 

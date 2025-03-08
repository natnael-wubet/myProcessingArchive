void setup() {
 size(500,500); 
  game=new GameBoard();
}
GameBoard game;
void draw() {
  background(0);
  game.draw();
}

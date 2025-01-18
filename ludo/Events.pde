
void mousePressed(){
 println("pressed, tossing...");
 if (ruler.playerEvent == 0)dice.toss();  
 clicked = true;
}

void mouseReleased() {
  clicked = false;
  mouseDragging= false;

while (true) {
 int tmp =  int(random(0,10));
 if (tmp != draggingrand) {
  draggingrand=tmp;
  break;
 }
}
}
int draggingrand=0;
boolean mouseDragging = false;
void mouseDragged() {
mouseDragging=true;
}

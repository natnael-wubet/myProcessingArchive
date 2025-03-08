boolean isDragging = false;

float mx=0,my=0,pmx=0,pmy=0;
void mouseDragged() {
  isDragging = true;
}
void mouseReleased(){
  isDragging = false;
}
float fcos=1,fsin=1;
void keyPressed() {
  
  if ((key=='a')&(fcos>1)) fcos -=.1;
  else if (key=='s') fcos +=.1;
  else if ((key=='q')&(fsin>1)) fsin -=.1;
  
  else if (key=='w') fsin +=.1;
  println(fsin,fcos);
}

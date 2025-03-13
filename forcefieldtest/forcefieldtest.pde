void setup() {
  size(500,500);
  arrowDistance = 10;
  arrows = new float[int(width/arrowDistance)*int(height/arrowDistance)][2];
  for (int i=0;i<arrows.length;i++) {
    arrows[i][0] = 0;
    arrows[i][1] = 0;
//    arrows[i][2] = 0;
  //  arrows[i][3] = 0;
  }
  stroke(255);
}

float arrows[][],
  arrowDistance;
void draw() {
  background(0);
  int wid = int(width/arrowDistance);
  int hei = int(height/arrowDistance);
  for (int i=0;i<arrows.length;i++){
    float x = int(arrowDistance*(i%wid));
    float y = int(arrowDistance*int(i/wid));
    float x2 = x+arrows[i][0];
    float y2 = y+arrows[i][1];
    point(x,y);
    
    line(x,y,x2,y2);
    float diffx = abs(width-abs(mouseX-x)/4)/width;
    float diffy = abs(height-abs(mouseY-y)/4)/height;
    arrows[i][0] = (1+(-2*int(mouseX>x)))*(diffx*(arrowDistance/2));
    arrows[i][1] = (1+(-2*int(mouseY>y)))*(diffy*(arrowDistance/2));
  }
}


void setup(){
  size(600,600,P3D);
  map = new Map();
  
  sphereDetail(5);
  players = new Players[4];
  for (int i=0;i<players.length;i++) {
    players[i] = new Players(i,map.mapLength); 
  }
  dice = new Dice();
  gui = new GUI();
  
//  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  textSize(fontSize);
  ruler = new Ruler();
}
int fontSize=20;
Ruler ruler;
GUI gui;
Dice dice;
Map map;
Players players[];
void draw() {
  
  if (gui.playing) {
 ruler.draw();   
    background(55);
    pushMatrix();
    if (mouseDragging) {
      
      translate(width/2,height/2,0);
      rotateX(-float(mouseY)/float(height));
      rotateY(float(mouseX)/float(width));
      println("draged");
      translate(-width/2,-height/2,0);
      pushMatrix();
      translate(width/2,height/12,-30);
      rotateY(PI);
      
      stroke(0);
      String txts[] = {
       "hail to u too",
       "not what it looks like",
       "just play ur game",
       "this is private group",
       "pass the juice",
       "it is just a considence",
       
       "he is coming back",
       
       "u belong here?",
      };
      fill(200);
      rect(-10,-fontSize/1.5,textWidth(txts[draggingrand%txts.length])+20,fontSize*1.5);
      fill(0);
      translate(0,0,2);
      text(txts[draggingrand%txts.length],0,0);
      popMatrix();
    }
    map.draw();
    dice.draw();
    
    for (int i=0;i<players.length;i++) {
      players[i].draw();
      
    }  
    popMatrix();
  } else 
  gui.draw();

}

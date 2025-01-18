class Button {
  Button(int _x,int _y, int _w, int _h,String _word) {
    x=_x;
    y=_y;
    paddingx=_w;
    paddingy=_h;
    w=_word.length()*fontSize/2 + _w*2;
    h=fontSize + _h*2;
    word=_word;
  }
  int x,y,w,h,paddingx,paddingy;
  String word;
  boolean draw() {
    pushMatrix();
    boolean hovering =  (mouseX>x) && (mouseX<(x+w)) && (mouseY>y) &&(mouseY<(y+h));
    
    translate(0,0,50);
    
    if (hovering) {
      fill(255);
    } else {
       //translate(x,y,0); 
      fill(200);
    }
    
    rect(x,y,w,h);
    translate(0,0,1);
    fill(0);
    float tw= textWidth(word);
    
    text(word,x+(w/2-tw/2),y+(h/2+(fontSize/4)));
    popMatrix();
    boolean ret= hovering&&clicked;
    if (clicked)clicked=false;
    return ret;
  }
}
boolean clicked = false;

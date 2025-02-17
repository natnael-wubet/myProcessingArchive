class Photon {

  Photon(float _x,float _y,float _z) {
    x= _x;
    y=_y;
    z=_z;
    c = color(255,0,0);
  }
  color c;
  float dx=1,dy=1,dz=0,x,y,z;
  
  void drawWave(){ 
    
  }
  void draw() {
    stroke(c);
    strokeWeight(2);
    point(x,y,z);
    
    strokeWeight(1);
    stroke(255);
    x+=dx;
    y+=dy;
    z+=dz;
  }
}

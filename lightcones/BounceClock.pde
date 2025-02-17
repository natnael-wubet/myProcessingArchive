class BounceClock {
  BounceClock(float _x,float _y,float _z,float h) {
    
    z=_z;
    x=_x;
    y=_y;
    clockHeight=h;
    photon = new Photon(x,y,z);
    photon.dx = 0;
  }
  float clockHeight,x,y,z;
  Photon photon;
  void draw() {
    if ((photon.y < y-clockHeight) ||(photon.y > y)) photon.dy *=-1;
    pushMatrix();
    translate(x,y-clockHeight/2,z);
    noFill();
    box(clockHeight);
    popMatrix();
    photon.draw();
  }
  
}

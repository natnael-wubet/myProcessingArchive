class ColObj {
  float mass=1,x=0,y=0,dx=1,dy=0;
  int w=0,h=0;
  ColObj(int _w,int _h,float ix, float iy) {
    w=_w;
    h=_h;
    x=ix;
    y=iy;
    mass=float(w+h)/2;
    
  }
  void oneInject(ColObj o){
    objs= new ColObj[1];
    objs[0] = o;
  }
  ColObj objs[];
  void go() {
    x+=dx;
    y+=dy;
    
  }
  int dif(float a,float b){
    return int((a<0 && b>0) || (a>0 && b<0))*-2 + 1;
  }
  int valo(float x){
    return int(x<0)*-2 +1;
  }
  boolean draw(ColObj tmp) {
    rect(x,y,w,h);
    
      if (
        ((x+w) > (tmp.x)) &&
        ((x) < (tmp.x+tmp.w))
      ) {
           if (
             ((y+h) > (tmp.y)) &&
             ((y) < (tmp.y+tmp.h))
           ) {
             
             float totalMass = tmp.mass+ mass;
             float tmpx = valo(dx)*((dx+tmp.dx)*(mass/totalMass));
             float tmppx = valo(tmp.dx)*((dx+tmp.dx) * (tmp.dx/totalMass));
             
             println(dx,tmp.dx,tmpx,tmppx,w,h);
             tmpx = tmpx * dif(dx,tmp.dx);
             tmppx = tmppx * dif(dx,tmp.dx);
             tmp.dx = tmpx;
             dx= tmppx;
             println(dx,tmp.dx,w,h);
             tmp.go();
             go();
             return true;
             
           }
        }
    
    go();
    return false;
  }
}

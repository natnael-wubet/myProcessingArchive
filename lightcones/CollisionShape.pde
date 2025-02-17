class CollisionShape {
  CollisionShape(float _x,float _y,float _z,float _w,float _h,float _d,int _type) {
	//from vim    
	x=_x;
	y=_y;
	z=_z;
	w=_w;
	h=_h;
	d=_d;
	type=_type;
  mass = (w+h+d)/3;
  fc = color(255,255,255,10);
  sc = color(255,255,255,200);
  
}
  color fc,sc;
  float x,y,z,w,h,d,dx=0,dy=0,dz=0,mass=0;
  int type=1;
  int isnegative(float x) {
    return (int(x<0) * -2 )+1;
  }
  void collide(CollisionShape tar) {
    if ((x+w > tar.x-tar.w) && (x-w < tar.x+tar.w)) {
      if ((y+h > tar.y-tar.h) && (y-h < tar.y+tar.h)) {
        float diffx = tar.x-x;
        float diffy = tar.y-y;
        
          float totalmass = mass+tar.mass;
          float mymassperc = (mass*100)/totalmass;
          
          float tarmassperc = (tar.mass*100)/totalmass;
          
          float tmptardx = ((dx+tar.dx)*(mymassperc/100));
          float tmpdx = ((dx+tar.dx)*(tarmassperc/100));
          if (mass>tar.mass) {
            
          }
          
          tar.dx =tmptardx; 
          println(isnegative(mass-tar.mass),mass,tar.mass,tmpdx);
          dx = isnegative(mass-tar.mass)*tmpdx;//(isnegative(mass-tar.mass)*-1)*((dx+tar.dx)*(tarmassperc/100));
          x+=dx;
          tar.x +=tar.dx;
          //dx = tmpdx;
          /*
        if (diffx >0) {
          //x=tar.x-(tar.w+w);
        }
        else if (diffx<0) x=tar.x+(tar.w+w);
        */
        
      }
    }
  }
  void draw() {
    pushMatrix();
	translate(x,y,z);
  x+=dx;
  y+=dy;
  z+=dy;
  fill(fc);
  stroke(sc);
	if (type==0){
		sphere(w);

	}
	popMatrix();
  }
}

class Node {
  float money = 0;
  int layer=0;
  int number =0;
  int s=10;
  Node(int l,int n){
    money = 100;
    layer=l;
    number=n;
  }
  void draw() {
    fill(money*2.5);
    pushMatrix();
    translate(s*number+10,s*layer+10);
    ellipse(0,0,s,s);
    popMatrix();
  }
}

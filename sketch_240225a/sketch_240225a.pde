void setup(){
  size(500,500);
  fill(255);
  nodes = new Node[10];
  for (int i=0;i<60;i++){
    for (int j=0;j<i+1;j++){
      if (i+j<nodes.length) {
        
    println(i+(j+1),i,j,nodes.length);
        nodes[i+j] = new Node(i,j);
      }
    }
    //nodes[i] = new Node(); 
  }
}
Node nodes[];
void draw(){
  background(0);
  for (int i=0;i<nodes.length;i++) {
    //println(i,nodes[i].s);
    nodes[i].draw();
  }
}

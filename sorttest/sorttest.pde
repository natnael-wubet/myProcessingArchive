void setup() {
  size(500,500);
  print(width,height);
  
  input = new int[width];
  for (int i=0;i<input.length;i++) {
    input[i] = int(random(0,height));
  }
  stroke(255);
}
int input[];
void draw() {
  background(0);
  for (int i=0;i<input.length;i++) {
    line(i,height,i,height-input[i]);
    
  }
  input = sorta(input);
}


int[] sorta(int in[]) {
  int out[] = new int[in.length];
  if (in.length<0) return in;
  for (int i=0;i<in.length;i++){
    if (i >0) {
      out[i-1] = min(in[i-1],in[i]);
    }
  }
  
  return out;
}

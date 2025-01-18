
float amp = 100,
  ampx=1,ampy=1,ampz=1,
  ampx2=1,ampy2=1,ampz2=1;
void keyPressed() {
  if (key == 'q') ampx+=1;
  else if (key == 'w') ampx-=1;
  
  else if (key == 'e') ampy+=1;
  else if (key == 'r') ampy-=1;
  
  else if (key == 't') ampz+=1;
  else if (key == 'y') ampz-=1;
  
  else if (key == 'a') ampx2+=1;
  else if (key == 's') ampx2-=1;
  
  else if (key == 'd') ampy2+=1;
  else if (key == 'f') ampy2-=1;
  
  else if (key == 'g') ampz2+=1;
  else if (key == 'h') ampz2-=1;
  
  print("\n\t| ampx: ",ampx);
  print("\t| ampy: ",ampy);
  print("\t| ampz: ",ampz);
  
  print("\n\t| ampx2: ",ampx2);
  print("\t| ampy2: ",ampy2);
  print("\t| ampz2: ",ampz2);
  
  
}

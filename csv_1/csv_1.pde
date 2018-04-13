void setup(){
  size(500,500);
}
int state;
  Table puntos;
void draw(){
  if (state==0){
   puntos=loadTable ("table.csv");
   state=1;
}
  puntos();
  
}
void puntos(){
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (puntos.getInt(j, i)==1) {
        stroke(145, 47, 86);
        strokeWeight(15);
        point(i*50+50, j*50+50);
      }else if(puntos.getInt(j, i)==2) {
         stroke(0, 0, 0);
        strokeWeight(15);
        point(i*50+50, j*50+50);
      }
    }
  }
}

public void mousePressed() {
  println( puntos.getInt((mouseY-25)/50, (mouseX-25)/50));
 if (puntos.getInt((mouseY-25)/50, (mouseX-25)/50)==1) {
 puntos.setInt((mouseY-25)/50, (mouseX-25)/50,2);
  saveTable(puntos, "new.csv");
 }
 println( puntos.getInt((mouseY-25)/50, (mouseX-25)/50));
}

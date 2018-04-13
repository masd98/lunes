void setup() {
  size(500, 500);
}
int d_puntos[]=new int[20];
int state;
Table puntos;
void draw() {
  if (state==0) {
    puntos=loadTable ("puntos.csv", "header");
    state=1;
  }
  puntos();
  doble();
}
int contador;
void puntos() {
  contador=puntos.getRowCount();
  for (int i = 0; i < contador; i++) {  
    stroke(145, 47, 86);
    strokeWeight(15);
    point(puntos.getInt(i, "x")*50+50, puntos.getInt(i, "y")*50+50);
  }
}

int game_over;
void doble() {
  for (int i = 0; i < contador; i++) {      
    if (d_puntos[i]>1) {         
      game_over=1;
    }
  }
  if (game_over==1) {
    background(0);
    textAlign(CENTER);
    fill(153, 255, 153);
    textSize(70);
    text("perdiste", width/2, height/2);
    noLoop();
  }
}
int start;
int b, c;
public void mousePressed() {


  b=(mouseY-25)/50;
  c=(mouseX-25)/50;
  start=1;
  println( b, c);
  saveTable(puntos, "new.csv");
  if (start==1) {
    for (int i = 0; i < contador; i++) {
      if ((puntos.getInt(i, "x")==b&&puntos.getInt(i, "y")==c)
        ||(puntos.getInt(i, "x")==b&&puntos.getInt(i, "y")==c)) {
        d_puntos[i]=d_puntos[i]+1;
        
      }
      println( d_puntos[i],game_over);
    }
  }
}

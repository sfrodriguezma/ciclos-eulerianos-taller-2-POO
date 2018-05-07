class Rectangulo extends Nodo{
Rectangulo(int x, int y){
super(x,y);
}
void dibujar(){
  
  pushStyle();
    rectMode(CENTER);
    strokeWeight(5);
    stroke(0, 0, 255);
    fill(255, 255, 0);
    if (pick(mouseX, mouseY)) {
      stroke(255, 255, 0);
      fill(0, 0, 255);
    }
    if(poscentro.x!=0&&poscentro.y!=0){
rectMode(CENTER);
rect(poscentro.x,poscentro.y,largo,largo);
    }
popStyle();
}
 boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
  }

  void seleccionar_nodo() {
    if (posiciones_dibujar==0) {
      dibujar[0]=poscentro.x;
      dibujar[1]=poscentro.y;
    } else {
      dibujar[2]=poscentro.x;
      dibujar[3]=poscentro.y;
    }
  }
}
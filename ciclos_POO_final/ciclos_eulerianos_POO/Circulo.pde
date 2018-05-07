
  class Circulo extends Nodo {

  Circulo (int x, int y) {
    super(x, y);
  }@Override
  void dibujar() {
    pushStyle();
    strokeWeight(5);
    stroke(255, 0, 255);
    fill(0, 255, 0);
    if (pick(mouseX, mouseY)) {
      stroke(0, 255, 0);
      fill(255, 0, 255);
    }
    if(poscentro.x!=0&&poscentro.y!=0){
    ellipse(poscentro.x, poscentro.y, largo, largo);
    }

    popStyle();
  }

@Override
  boolean pick(int x, int y) {
    return sqrt(sq(x-position().x) + sq(y-position().y)) <= size()/2;
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
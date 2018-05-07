abstract class Nodo {
  //attributos
  PVector poscentro;
  PVector position;
  float largo=30;//puede ser el radio
  Nodo(int x, int y) {
    poscentro=new PVector(x, y);
  }
  abstract void dibujar();
  abstract void seleccionar_nodo();
  abstract boolean pick( int x, int y);
  PVector position() {
    position=poscentro;
    return position;
  } 
  float size() {
    return largo;
  }
}

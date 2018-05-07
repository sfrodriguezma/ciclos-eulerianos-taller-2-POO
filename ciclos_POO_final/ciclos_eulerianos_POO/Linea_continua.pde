class Linea_continua extends Linea {
  Linea_continua(Nodo nodo1, Nodo nodo2) {
    super(nodo1, nodo2);
  }
  void dibujar_linea_inicial() {
    strokeWeight(5);//dibuja lineas guias
    stroke(255, 0, 0, 1);
    line(salida.poscentro.x, salida.poscentro.y, llegada.poscentro.x, llegada.poscentro.y);
  }
  void dibujar_linea_jugando(color linea) {
    stroke(linea);
    line(salida.poscentro.x, salida.poscentro.y, llegada.poscentro.x, llegada.poscentro.y);
  }
}
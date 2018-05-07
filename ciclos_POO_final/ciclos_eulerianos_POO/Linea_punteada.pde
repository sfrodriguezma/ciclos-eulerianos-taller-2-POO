class Linea_punteada extends Linea {
  Linea_punteada(Nodo nodo1, Nodo nodo2) {
    super(nodo1, nodo2);
  }
  void dibujar_linea_inicial() {

    for (int i=0; i<=linea_punteada; i++) {
      float x = lerp(salida.poscentro.x, llegada.poscentro.x, i/linea_punteada);
      float y = lerp(salida.poscentro.y, llegada.poscentro.y, i/linea_punteada);
      noStroke();
      fill(0,255,0);
      ellipse(x, y, 4, 4);
    }
  }

  void dibujar_linea_jugando(color linea) {
    stroke(linea);
    line(salida.poscentro.x, salida.poscentro.y, llegada.poscentro.x, llegada.poscentro.y);
  }
}

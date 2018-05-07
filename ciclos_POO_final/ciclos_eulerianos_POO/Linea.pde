abstract class Linea {
  //atributos
  Nodo salida, llegada;
  Linea(Nodo nodo1, Nodo nodo2) {
    salida=nodo1; 
    llegada=nodo2;
  }
  abstract void dibujar_linea_inicial();
  abstract void dibujar_linea_jugando(color linea);
}
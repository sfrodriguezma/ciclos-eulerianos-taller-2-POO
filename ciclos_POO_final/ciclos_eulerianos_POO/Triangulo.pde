class Triangulo extends Nodo{
Triangulo(int x,int y){
 super(x,y);
 }
 void dibujar(){
   fill(100,150,150);
   
 
 
  pushStyle();
    strokeWeight(5);
    stroke(#FA1008);
    fill(#F5FA08);
    if (pick(mouseX, mouseY)) {
      stroke(#F5FA08);
      fill(#FA1008);
    }
     if(poscentro.x!=0&&poscentro.y!=0){
     triangle(poscentro.x-20,poscentro.y+20,poscentro.x,poscentro.y-20,poscentro.x+20,poscentro.y+20);
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
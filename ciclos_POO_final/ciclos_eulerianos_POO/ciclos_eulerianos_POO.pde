
Grafo [] niveles;
String[]CSV={ "new.csv", "nivel2.csv", "nivel3.csv", "nivel4.csv", "nivel5.csv", "nivel6.csv"};
int nivel=1, posiciones_dibujar, contador, nodo1, nodo2, perder, menu, aux, columnasc, creacionc=0, nodo1c, nodo2c;
float[]dibujar=new float[4];
String tipo_de_nodo="Circulo";
float linea_punteada=10;
color linea;
PFont notitulo;
Table nivelc;
float[]dibujarc=new float[4];
PImage imgin, img, imgn, imgganar, imgper;



void setup() {
  img = loadImage("creador.jpg");
  imgn= loadImage("imgnormal.jpg");
  imgin= loadImage("inicio.jpg");
  imgper= loadImage("perdio.jpg");
  imgganar=loadImage("gano.jpg");
  size(800, 700);
  image(imgn, 0, 0);
  nivelc=new Table();
  nivelc.addRow();
  nivelc.addRow();
  nivelc.addRow();
}





void draw() {
  switch(menu) {
  case 0:
    notitulo = loadFont("notitulo.vlw");
    image(imgin, 0, 0);
    textFont(notitulo);
    fill(255, 0, 0);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("BIENVENIDO", 400, 150);
    fill(0);
    text("Para jugar en modo normal presione i", 350, 270);
    text("Para jugar en modo creador presione c", 350, 350);
    text("Para regresar a este menu puede oprimir m", 350, 400);
    if (keyPressed==true&&key=='i') {
      menu++;
      image(imgn, 0, 0);
    }
    if (keyPressed==true&&key=='c') {
      menu=4;
      image(img, 0, 0);
    }
    break;
  case 1:
    image(imgn, 0, 0);
    fill(255, 0, 0);
    textSize(60);//tamaño del texto
    textAlign(CENTER, CENTER);//centralizar texto
    text(" BIENVENIDO", 400, 35);//se coloco texto
    textSize(40);
    textFont(notitulo);
    fill(0);
    text("seleccione el tipo de nodo que desea:", 400, 80);
    fill(0, 0, 255);
    ellipse(400, 200, 180, 180);
    fill(255);
    rectMode(CENTER);
    rect(400, 400, 180, 180);
    fill(100, 150, 150);
    triangle(400, 500, 300, 680, 500, 680);
    break;
  case 2://pantalla de inicio
    image(imgn, 0, 0);
    ;
    fill(0);
    textSize(35);//tamaño del texto
    textAlign(CENTER, CENTER);//centralizar texto
    //text("bienvenido", 400, 250);//se coloco texto
    text(" para comenzar presione i", 400, 350);
    text("si en algun momento desea reiniciar presione r", 400, 400);
    if (keyPressed==true&&key=='i') {
      menu++;
      image(img, 0, 0);
    }
    break;
  case 3:
    niveles[nivel-1].dibujar();
    niveles[nivel-1].ganar_perder(CSV[nivel-1]);
    if ( posiciones_dibujar==1) {
      niveles[nivel-1].jugar();
    }
    break;
  case 4:
    image(img, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255, 0, 0);
    text("bienvenido al modo creador", 350, 100);
    text(" Para comenzar presione i", 350, 150);
    fill(#050505);
    text(" condiciones de cración:", 350, 250);
    text(" _Haga click sobre la pantalla para dibujar los nodos.", 350, 350);
    text(" _Presione s para dibujar las lineas.", 350, 400);
    text(" _Presione l al terminar de dibujar las lineas.", 350, 450);
    if (keyPressed==true&&key=='i') {
      menu++;
      image(img, 0, 0);
    }
    break;
  case 5:
    if (keyPressed==true&&key=='s') {
      creacionc++;
      for (int i=0; i<nivelc.getColumnCount(); i++) {
        println(nivelc.getFloat(0, i));
        println(nivelc.getFloat(2, i));
      }
      for (int i=0; i<=nivelc.getColumnCount(); i++) {
        nivelc.addRow();
      }

      delay(1000);
    }
    if (keyPressed==true&&key=='l') {

      creacionc=7;//totearla
      for (int f=4; f<nivelc.getRowCount(); f++) {
        for (int c=0; c<nivelc.getColumnCount(); c++) {
          if (nivelc.getFloat(f, c)!=1) {
            nivelc.setFloat(f, c, 0);
          }
        }
      }
      for (int i=4; i<nivelc.getRowCount(); i++) {//asegura simetria
        nivelc.setFloat(i, (i-4), 0);
      }


      saveTable(nivelc, "data/new.csv");
      menu=1;
    }
    break;
  }
  if (keyPressed==true&&key=='m') {//volver al inicio
    menu=0;
    creacionc=0;
    posiciones_dibujar=0;
    nivel=1;

    nivelc.clearRows();


    background(240);
  }
}





void mouseClicked() {
  if (menu==5) {
    asignacion_dibujar();
    switch(creacionc) {
    case 1:
      creacionc++;
      break;
    case 2:
      creacionc=1;
      break;
    }
  }
  if (menu==1) {//quitar ifs con base a nivel
    if ((mouseX>=310)&&(mouseX<=490)&&(mouseY>=110)&&(mouseY<=290)) {
      tipo_de_nodo="Circulo";
      menu++;
    }
    if ((mouseX>=310)&&(mouseX<=490)&&(mouseY>=310)&&(mouseY<=490)) {
      tipo_de_nodo="Rectangulo";
      menu++;
    }
    if ((mouseX>=310)&&(mouseX<=490)&&(mouseY>=510)&&(mouseY<=690)) {
      tipo_de_nodo="Triangulo";
      menu++;
    }
    println(tipo_de_nodo);
    niveles=new Grafo[CSV.length];
    for (int i=0; i<niveles.length; i++) {
      niveles[i]=new Grafo(CSV[i], tipo_de_nodo, aux);
    }
  }

  if (menu==3 &&posiciones_dibujar==0) {
    niveles[nivel-1].jugar();
  }
}




void asignacion_dibujar() {
  switch(creacionc) {
  case 0:
    nivelc.addColumn();
    fill(0, 0, 255);
    nivelc.setInt (0, columnasc, mouseX);
    nivelc.setInt(2, columnasc, mouseY);
    fill(#FFF529);
    ellipse(nivelc.getInt(0, columnasc), nivelc.getInt(2, columnasc), 30, 30);
    columnasc++;
    break;
  case 1:
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        dibujarc[0]=nivelc.getInt(0, a);
        dibujarc[1]=nivelc.getInt(2, a);
        nodo1c=a;
      }
    }
    break;
  case 2:
    for (int a=0; a<nivelc.getColumnCount(); a++) {
      if ((mouseX>=(nivelc.getInt(0, a)-15))&&(mouseX<=(nivelc.getInt(0, a)+15))&&(mouseY>=(nivelc.getInt(2, a)-15))&&(mouseY<=(nivelc.getInt(2, a)+15))) {
        dibujarc[2]=nivelc.getInt(0, a);
        dibujarc[3]=nivelc.getInt(2, a);
        nodo2c=a;
        stroke(255, 0, 0);
        strokeWeight(5);
        line(dibujarc[0], dibujarc[1], dibujarc[2], dibujarc[3]);
        nivelc.setInt((nodo1c+4), nodo2c, 1);
        nivelc.setInt((nodo2c+4), nodo1c, 1);
      }
    }
    break;
  }
}
class Grafo {
  //atributos
  Nodo [] nodos;
  Linea[]lineas;
  Table tabla;
  int   numero_de_lineas, numero_de_lineas_punteadas ;


  Grafo(String CSV, String  tipo_de_nodo, int aux) {//luego ajustar forma de los nodos con base a un click del usuario al diseñar menu
    tabla=loadTable(CSV);
    nodos=new Nodo[tabla.getColumnCount()];

    for (int a=4; a<tabla.getRowCount(); a++) {
      for (int b=0; b<tabla.getColumnCount(); b++) {
        if (tabla.getInt(a, b)==1) {
          numero_de_lineas++;
        }
        if (tabla.getInt(a, b)==2) {
          numero_de_lineas++;
          numero_de_lineas_punteadas++;
        }
      }
    }


    //crear los nodo
    for (int i=0; i<nodos.length; i++) {
      switch(tipo_de_nodo) {
      case "Circulo":
        nodos[i]=new Circulo (tabla.getInt(0, i), tabla.getInt(2, i));
        break;//viene el cambio a circulo por ahora
      case "Rectangulo":
        nodos[i]=new Rectangulo (tabla.getInt(0, i), tabla.getInt(2, i));
        break;
      case "Triangulo":
        nodos[i]=new Triangulo (tabla.getInt(0, i), tabla.getInt(2, i));
        break;
      }
    }



    //crear lineas
    lineas=new Linea[numero_de_lineas];

    for (int a=4; a<tabla.getRowCount(); a++) {
      for (int b=0; b<tabla.getColumnCount(); b++) {

        if (tabla.getInt(a, b)==1) {
          lineas[ aux]=new  Linea_continua(nodos[(a-4)], nodos[b]);//por ahora ,en los niveles de repetir linea la cosa puede cambiar
          aux++;
        }
        if (tabla.getInt(a, b)==2) {
          lineas[ aux]=new Linea_punteada(nodos[(a-4)], nodos[b]);//por ahora ,en los niveles de repetir linea la cosa puede cambiar
          aux++;
        }
      }
    }
    aux=0;
  }


  void dibujar() {

    for (int i=0; i<nodos.length; i++) {
      nodos[i].dibujar();
    }
    for (int a=0; a<lineas.length; a++) {
      lineas[a].dibujar_linea_inicial();
    }
  }


  void ganar_perder(String csv) {
    if (contador==(numero_de_lineas/2)+(numero_de_lineas_punteadas/2)) {
      image(imgganar,0,120);
      delay(200); 
      //// println("gano");
      fill(0);
      textSize(40);//tamaño del texto
      textAlign(CENTER, CENTER);//centralizar texto
      text("crack,ha superado el nivel", 400, 50);//se coloco texto
      text("para ver el siguiente nivel presione s", 400, 100);

      if (keyPressed==true&&key=='s') {//reiniciar
        if (nivel<=(CSV.length-1)) {
         image(imgn,0,0);
         
          posiciones_dibujar=0;
          contador=0;
          perder= 0;
          nivel++;
          //////// //limpiar(usuario);
          tabla=loadTable(csv);
        } else {
          image(imgn,0,0);
          posiciones_dibujar=0;
          contador=0;
          perder= 0;
          nivel=1;
          tabla=loadTable(csv);
        }
      }
    }
    if (perder==1) {
      image(img,0,0);
       image(imgper,0,150);
      delay(200);
      fill(0);
      ////println("perdio");
      textSize(40);//tamaño del texto
      textAlign(CENTER, CENTER);//centralizar texto
      text("llorelo papa,ha perdido", 400, 50);//se coloco texto
      text(" para volver a intentarlo presione r", 400, 100);
      tabla=loadTable(csv);
    }
    if (keyPressed==true&&key=='r') { 
      image(imgn,0,0);
      posiciones_dibujar=0;
      contador=0;
      perder=0;
      tabla=loadTable(csv);
    }
  }



  void jugar() {

    if (posiciones_dibujar==0) {
      for (int nodo1=0; nodo1<nodos.length; nodo1++) {
        if ((mouseX>=(nodos[nodo1].poscentro.x-15))&&(mouseX<=(nodos[nodo1].poscentro.x+15))&&(mouseY>=(nodos[nodo1].poscentro.y-15))&&(mouseY<=(nodos[nodo1].poscentro.y+15))) {
          nodos[nodo1].seleccionar_nodo();
          nodo2=nodo1;
          posiciones_dibujar++;
        }
      }
    } else {
      for (int nodo1=0; nodo1<nodos.length; nodo1++) {//podria haber error por el switch
        if ((mouseX>=(nodos[nodo1].poscentro.x-15))&&(mouseX<=(nodos[nodo1].poscentro.x+15))&&(mouseY>=(nodos[nodo1].poscentro.y-15))&&(mouseY<=(nodos[nodo1].poscentro.y+15))) {
          nodos[nodo1].seleccionar_nodo();


          switch(tabla.getInt((nodo1+4), nodo2)) {
          case 1://line(dibujar[0], dibujar[1], dibujar[2], dibujar[3]);//podria cambiarlo por cambiar el metodo dibujar de lineas con un arreglo ,preguntar?
            for (int a=0; a<lineas.length; a++) {
              if (((dibujar[0]==lineas[a].salida.poscentro.x)&&(dibujar[1]==lineas[a].salida.poscentro.y)&&(dibujar[2]==lineas[a].llegada.poscentro.x)&&(dibujar[3]==lineas[a].llegada.poscentro.y))||((dibujar[0]==lineas[a].llegada.poscentro.x)&&(dibujar[1]==lineas[a].llegada.poscentro.y)&&(dibujar[2]==lineas[a].salida.poscentro.x)&&(dibujar[3]==lineas[a].salida.poscentro.y))) {
                linea=color(0, 255, 0);
                lineas[a].dibujar_linea_jugando(linea);
              }
            }

            //line(dibujar[0],dibujar[1],dibujar[2],dibujar[3]);
            //cambiar valores de tabla
            tabla.setInt((nodo1+4), nodo2, 7);
            tabla.setInt((nodo2+4), nodo1, 7);
            dibujar[0]=dibujar[2];
            dibujar[1]=dibujar[3];
            nodo2=nodo1;
            contador++;
            break;
          case 2: //ajustar a pasar 2 veces
            for (int a=0; a<lineas.length; a++) {
              if (((dibujar[0]==lineas[a].salida.poscentro.x)&&(dibujar[1]==lineas[a].salida.poscentro.y)&&(dibujar[2]==lineas[a].llegada.poscentro.x)&&(dibujar[3]==lineas[a].llegada.poscentro.y))||((dibujar[0]==lineas[a].llegada.poscentro.x)&&(dibujar[1]==lineas[a].llegada.poscentro.y)&&(dibujar[2]==lineas[a].salida.poscentro.x)&&(dibujar[3]==lineas[a].salida.poscentro.y))) {
                linea=color(0, 0, 255);
                lineas[a].dibujar_linea_jugando(linea);
              }
            }

            //line(dibujar[0],dibujar[1],dibujar[2],dibujar[3]);
            //cambiar valores de tabla
            tabla.setInt((nodo1+4), nodo2, 1);
            tabla.setInt((nodo2+4), nodo1, 1);
            dibujar[0]=dibujar[2];
            dibujar[1]=dibujar[3];
            nodo2=nodo1;
            contador++;
            break;
          case 7:
            perder=1;
            break;
          }
        }
      }
    }
  }
}
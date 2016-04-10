class ChernoffFacesGraph extends Group {
  Group faces ;
  float x;
  float xTemp;
  float y;
  int[] colors = null;
  float[][] values = null;
  String[] category = null;
  
  final float minFaceWidth = 20;
  final float minFaceHeight = 20;
  final float minEyesWidth = 5;
  final float minEyesHeight = 3;
  final float constGrowth = 0.2;
  float maxEyesWidh=0;
  float maxEyesHeight=0;
  float maxFaceWidh=0;
  float maxFaceHeight=0;
  float maxYMouth=0;
  float maxYSocialclass=0;
  
  final int spaceFace = 110;
  final int spaceEyes = 110;
  
  final String[] faceValues = {"Face Width","Face Height","Eyebrows inclination","Mouth inclination","Eyes Width","Eyes Height"};
   
  //Se va a generar matriz gráfica donde se acomodan las caras.
  //ejem: para 12 meses, 3 filas y 4 columnas.
  // O  O  O  O
  // O  O  O  O
  // O  O  O  O
  // O  O  O  O
  int w;//cada fila para posicionar una cara.
  int h;//cada columna para posicionar una cara.
  
  
  ChernoffFacesGraph (float ejeX, float ejeY, int tamW, int tamH, float[][] nv, String[] cv, int[] c){
    
    if(tamW*tamH == nv.length) {
      
      x = ejeX;
      xTemp=ejeX;
      y = ejeY;
      h = tamH;
      w = tamW;
      colors = c;
      values = nv;
      category = cv;
      
    }

  }
  
  Graphic getLeyendText(){
    String text =""; 
    int index = 0;
    /*= newText(text,x,y)
        .fontSize(12).fontAnchor(CENTER).fillColor(0);*/
    for(String e : faceValues){
      text += e + ": " + category[index] + "\n";
      index++;
    }
    return newText(text,20,440).fontSize(10).fontAnchor(LEFT).fillColor(0);
    
  }
  
  void update() {
    
    
    for(int i=0;i<values.length;i++){
      
      if(values[i][4]>maxEyesWidh){
        maxEyesWidh=values[i][4];
      }
      if(values[i][5]>maxEyesHeight){
        maxEyesHeight=values[i][5];
      }
      if(values[i][3]>maxYMouth){
        maxYMouth=values[i][3];
      }
      if(values[i][3]>maxYSocialclass){
        maxYSocialclass=values[i][2];
      }
      if(values[i][0]>maxFaceWidh){
        maxFaceWidh=values[i][0];
      }
      if(values[i][1]>maxFaceHeight){
        maxFaceHeight=values[i][1];
      }
    }
    
    faces = newGroup();
    for(int i = 0 ; i < values.length ; i++ ) {
      
      if(i%w==0){
        y+=100;
      }
      int iTemp = i % w;
      
      float widhTemp=80*values[i][0]/maxFaceWidh;
      float heightTemp=80*values[i][1]/maxFaceHeight;
      Ellipse face = newEllipse( x + (iTemp*(spaceFace)), y , minFaceWidth + (widhTemp) , minFaceHeight + ((heightTemp)) );
      face.fillColor(220);
      face.strokeColor(colors[i]);
      
      widhTemp=10*values[i][4]/maxEyesWidh;
      heightTemp=10*values[i][5]/maxEyesHeight;
      
      Ellipse eyeOne = newEllipse( x + (iTemp*(spaceEyes)) - 8, y - 5 , minEyesWidth + (widhTemp) , minEyesHeight + ((heightTemp)) );
      eyeOne.fillColor(colors[i]);
      eyeOne.strokeColor(colors[i]);
      
      Ellipse eyeTwo = newEllipse( x + (iTemp*(spaceEyes)) + 8 , y - 5 , minEyesWidth + (widhTemp) , minEyesHeight + ((heightTemp)) );
      eyeTwo.fillColor(colors[i]);
      eyeTwo.strokeColor(colors[i]);
      
      int inclinacion=1;
      if(values[i][3]<maxYMouth/2){
        inclinacion=-1;
      }
      float yTemp=10*values[i][3]/maxYMouth;
      if(values[i][3]==40){
        inclinacion=0;
      }
      Line l1 = newLine(x + (iTemp*spaceFace)-15, (y+15)+(inclinacion*yTemp), x+iTemp*spaceFace, y+15);
      Line l2= newLine(x + (iTemp*spaceFace), y+15, x+iTemp*spaceFace+15, (y+15)+(inclinacion*yTemp));
      l1.fillColor(colors[i]);
      l1.strokeColor(colors[i]);
      l2.fillColor(colors[i]);
      l2.strokeColor(colors[i]);
      
      inclinacion=1;
      if(values[i][2]<maxYSocialclass/2){
        inclinacion=-1;
      }
      yTemp=10*values[i][2]/maxYSocialclass;
      if(values[i][2]==(int)(maxYSocialclass/2)){
        inclinacion=0;
      }
      
      Line eyebrow1 = newLine(x + (iTemp*spaceFace)-15, (y-20)+(inclinacion*yTemp), x+iTemp*spaceFace-2, y-20);
      Line eyebrow2 = newLine(x + (iTemp*spaceFace)+2, y-20, x+iTemp*spaceFace+15, (y-20)+(inclinacion*yTemp));
      eyebrow1.fillColor(colors[i]);
      eyebrow1.strokeColor(colors[i]);
      eyebrow2.fillColor(colors[i]);
      eyebrow2.strokeColor(colors[i]);
      
      faces.add(face);
      faces.add(eyeOne);
      faces.add(eyeTwo);
      faces.add(l1);
      faces.add(l2);
      faces.add(eyebrow1);
      faces.add(eyebrow2);
      
    }
    
    faces.add(getLeyendText());
    //faces.draw();  
    this.add(faces);//without this code, the main can´t hold the draw of faces.
  }


}
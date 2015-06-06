int hawkHeight=0;
PImage hawk; 

void setUpHawk() {
  hawk = loadImage("claws.png");
  hawkHeight = 0-hawk.height/2;
}

void drawHawk() {
  if (hawkHeight > 150) {
    hawkHeight = 150;
  } else {
    hawkHeight=hawkHeight+5;
  }
  image(hawk, width/2, hawkHeight);
}


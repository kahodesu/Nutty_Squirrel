PVector squirrelPos;
PImage basket;
int currentPos =0;
int[] basketPos= {
  int(1024/6), 
  int(2*1024/6), 
  int(3*1024/6), 
  int(4*1024/6), 
  int(5*1024/6)
};

void setUpBasket(){
  squirrelPos = new PVector(basketPos[currentPos], 680);
  basket = loadImage("basket.png");
}
void drawBasket() {
  if(currentPos > basketPos.length-1){
    currentPos = basketPos.length-1;
  }
   if(currentPos < 0) {
    currentPos = 0;
  }
  squirrelPos.x = basketPos[currentPos];
  image(basket, squirrelPos.x, squirrelPos.y);
}








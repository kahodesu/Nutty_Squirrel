int nutFreq = 2000; //amt of time between nut spawna in milliseconds
float collisionSensitivity = 20.0;

PImage[] fallingNuts = new PImage[4];
String[] images= {
  "nut1.png", 
  "nut2.png", 
  "nut3.png",
  "nut4.png", 
};

//used the nut object array list example to make lots of fallingNuts

ArrayList<Nut> nuts;
int nutWidth = 48;
int[] posArray= {
  int(1024/6), 
  int(4*1024/6), 
  int(3*1024/6), 
  int(2*1024/6), 
  int(5*1024/6)
};

int posNum = 0;
int lastNut = 0;


// Simple bouncing nut class
void setupNut() {
    for (int i=0; i<images.length; i++) {
    fallingNuts[i] = loadImage (images[i]);

  }

  // Create an empty ArrayList (will store Nut objects)
  nuts = new ArrayList<Nut>();
  // Start by adding one element
  nuts.add(new Nut(width/2));
}

void drawNut() {
  // This is because we are deleting elements from the list  
  for (int i = nuts.size ()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Nut nut = nuts.get(i);
    nut.move();
    nut.display();
    
    if(nut.checkCollision()){
      nuts.remove(i);
            beepHigh.trigger();
    }
    else if (nut.finished()) {
      // Items can be deleted with remove()
      nuts.remove(i);
    }
    
  }

  if (nuts.size()<10 && millis()-lastNut>nutFreq) {
    posNum++;
    if (posNum>4)
      posNum = 0;
    nuts.add(new Nut(posArray[posNum]));
    lastNut = millis();
  }
}


class Nut {

  float x;
  float y;
  float speed;
  float gravity;

  float life = 255;
  String imageName;
  PImage theNut;
  PVector position;
  float distance;
  int ranNum;

  Nut(float tempX) {
    x = tempX;
    y = 0;
    speed = 10;
    gravity = random(.05, 0.1);
    ranNum = int(random(images.length));
    theNut = loadImage (images[ranNum]);
    position = new PVector(x, y);
  }

  void move() {
    // Add gravity to speed
    speed = (speed + gravity);
    // Add speed to y location
    y = y + speed;
    position.y=y;
  }

  boolean finished() {
    if (y>height+theNut.height) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(theNut, x, y-theNut.height);
  }

  boolean checkCollision() {
// println ((squirrelPos.y-(basket.height/2))-position.y);

     if (position.x==squirrelPos.x && abs(squirrelPos.y-position.y)< collisionSensitivity) {
        return true;
      } 
      else {
        return false;
    }

  }
}  


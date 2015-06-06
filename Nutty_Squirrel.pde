float a = 0.0;
float s = 0.0;
color deadColor = #CC0000;
color normalColor = #CCFFFF;
color currentColor;
boolean hideState = false;
int death = 0;

//STATE VARS
int STARTMODE = 0;
int NUTSMODE = 1;
int RUSTLEMODE = 2;
int ATTACKMODE = 3;
int DEATHMODE = 4;
int GAMEOVER = 5;
int state;

//IMAGE VARS
PImage logo;
PImage bg;

void setup() {
  size(1024, 768);
  frameRate(60);
  smooth();
  imageMode(CENTER);

  setUpSound();
  setupNut();
  setUpBasket();
  setUpTimer();
  setUpTree();
setUpScore();
  logo = loadImage("nuttysquirrel_logo.png");
  currentColor = normalColor;
  state = STARTMODE;
}

void draw() {
  background(currentColor);
  leaf_anim(state);
println(lives);
  ////////////////////STARTMODE////////////////////
  if (state == STARTMODE) {
    a = a + 0.04;
    s = sin(a)*2;
    if (s <1) {
      image(logo, width/2, height/2, int((s*logo.width)+1), int((s*logo.height)+1));
    } else {
      delay(3000);
      state = NUTSMODE;
    }
  } 
  ////////////////////NUTSMODE////////////////////  
  else if (state == NUTSMODE) {
    drawNut();
    drawBasket();
    if (attackTimer.isFinished()) {  
      rustleTimer.start();     
      state = RUSTLEMODE;
      leaf.loop();
    }
  }
  ////////////////////RUSTLEMODE////////////////////
  else if (state == RUSTLEMODE) {
    drawNut();
    drawBasket();
    if (rustleTimer.isFinished()) {
      leaf.pause();      
      state = ATTACKMODE;
       kaw_whoosh.rewind();
      kaw_whoosh.play();
      setUpHawk();
      hideState = false;
    }
  }

  ////////////////////ATTACKMODE////////////////////
  else if (state == ATTACKMODE) {
    drawHawk();
    drawNut();
    drawBasket();
    if (!kaw_whoosh.isPlaying()) {
      if (hideState == true) {
        state = NUTSMODE; 
        attackTimer.start();
      } else {
        state = DEATHMODE;
      bach.rewind();
        bach.play();
      }
    }
  }

  ////////////////////DEATHMODE////////////////////
  else if (state == DEATHMODE) {
    if (bach.isPlaying()) {
      currentColor = deadColor;
    } else {
      if (lives == 0) {
        state = GAMEOVER;
      } else {

        lives = lives-1;
        state = NUTSMODE;
        hideState = false;
        currentColor = normalColor;
        attackTimer.start();
      }
    }
  }
  ////////////////////GAMEOVER////////////////////
  else if (state == GAMEOVER) {
    
  }
}


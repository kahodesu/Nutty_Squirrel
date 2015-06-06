PImage branch, branch1, branch2;
boolean leafState = false;

void setUpTree() {
  branch1 = loadImage("branch1.png");
  branch2 = loadImage("branch2.png");  
}

void leaf_anim(int gameState){
  if(gameState == STARTMODE || gameState == NUTSMODE || gameState == GAMEOVER){
    branch = branch1;
  }
  else if (gameState == RUSTLEMODE) {
    if (leafTimer.isFinished() && leafState == true){
       branch = branch1;
       leafState = false;
       leafTimer.start();
    }
    else if(leafTimer.isFinished() && leafState == false){
      branch = branch2;
      leafState = true;
      leafTimer.start();
    }  
  } 
  image(branch, width/2, height/10); 
}
  



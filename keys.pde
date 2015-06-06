void keyPressed() {
  if (state == ATTACKMODE || state == RUSTLEMODE || state == NUTSMODE){
  if(keyCode == RIGHT && moveTimer.isFinished()){
    currentPos++;
    squirrelPos.y = 680;
    bert.trigger();
    moveTimer.start();
    //LOL the more you move around the harder it gets! 
    nutFreq = int(nutFreq *.99) ;
    
  }
  if (keyCode == LEFT && moveTimer.isFinished()){
    currentPos--;
     squirrelPos.y = 680;
      bert.trigger();
      moveTimer.start();
      //LOL the more you move around the harder it gets! 
      nutFreq = int(nutFreq *.99);
  }
   if (key== ' ' && state == ATTACKMODE){
    if(hideState == false) {
    squirrelPos.y = 1000;
    cheer.trigger();
    hideState = true;
}
  }
  
  } 
  
}

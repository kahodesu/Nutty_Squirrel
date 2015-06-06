import ddf.minim.*;

//SOUND VARS
Minim minim;
AudioPlayer leaf, kaw_whoosh, bach;
AudioSample  bert, honk, beepHigh, cheer;

void setUpSound(){
  
  minim = new Minim(this);
  bach = minim.loadFile("bach.mp3");
  bert= minim.loadSample("bert.mp3");
  honk= minim.loadSample("honk.mp3");
  cheer= minim.loadSample("cheer.mp3");
  leaf= minim.loadFile("leaf.mp3");
  kaw_whoosh = minim.loadFile("kaw_whoosh.mp3"); 
  beepHigh = minim.loadSample("beepHigh.mp3"); 
}

void doClockScreenStuff(){
  //background(construction);
  background(250);
  strokeWeight(5);
  panButtonLeft();
  panButtonRight();
  clockInterface();
}

void clockInterface(){
  timeShower();
  playButton();
  stopButton();
}

void playButton(){
  int tWidth = height/8;
  int x = tWidth/2 + width/36; //width/2 - (width - width/7)/2 + tWidth/2;
  int y = height/2;// int y = height/2 + height/16 + tWidth/2 + 20;
  fill(250);
  ellipse(x, y, tWidth, tWidth);
  fill(0);
  if(clockGoing){
    triangle( x-tWidth/4, y-tWidth/5, x-tWidth/4, y+tWidth/5, x+tWidth/4, y);
  }
  else{
    rect(x-tWidth/5, y-tWidth/5, tWidth/6, 2*(tWidth/5));
    rect(x+tWidth/20, y-tWidth/5, tWidth/6, 2*tWidth/5);
  }
}

void timeShower(){
  int tWidth = 16*width/36;
  int tHeight = height/8;
  int x = width/2 - tWidth/2;
  int y = height/2 - tHeight/2;
  fill(250);
  rect(x, y, tWidth, tHeight);
  fill(0);
  textAlign(CENTER, CENTER);
  if(!timerGoing){
    textSize(width/13);
    text("00 : 00 : 00", x+tWidth/2, y+tHeight/2);
  }
  else{
    if(clockGoing){
      int s = (millis() - storedM)/1000;
      int m = s/60;
      int h = m/60;
      textSize(width/13);
      text(h + " : " + m % 60 + " : " + s % 60, x+tWidth/2, y+tHeight/2);
      //text(hour() + " : " + minute() + " : " + second(), x+200, y+50);
    }
    else{
      int s = (storedM)/1000;
      int m = s/60;
      int h = m/60;
      textSize(width/13);
      text(h + " : " + m % 60 + " : " + s % 60, x+tWidth/2, y+tHeight/2);
    } 
  }
}

void stopButton(){
  int tWidth = height/8;
  int x = width - tWidth/2 - width/36;//width/2 + (width - width/7)/2 - tWidth/2;
  int y = height/2;//  int y = height/2 + height/16 + tWidth/2 + 20;
  fill(250);
  ellipse(x, y, tWidth, tWidth);
  noStroke();
  fill(#9B0303);
  rect(x-tWidth/4, y-tWidth/4, tWidth/2, tWidth/2);
  stroke(0);
  strokeWeight(5);
}

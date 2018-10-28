void teamLog(){
  pushMatrix();
  for(int i = 0; i < logHeight; i++){
    translate(0, -30);
  }
  background(0);
  fill(250);
  textSize(30);
  textAlign(LEFT, CENTER);
  for(int i = 0; i < LOGMAX; i++){
    text(i+1 + " " + raceLog[i], 10, 35*i + 15);
  }
  popMatrix();
  panButtonLeft();
  panButtonRight();
  upButton();
  downButton();
}

void addTeamToLog(){
    int s = 0;
    int m = 0;
    int h = 0;
    if(timerGoing){
      s = (millis() - storedM)/1000 % 60;
      m = ((millis() - storedM)/1000)/60;
      h = m/60;
    }
    int number = team[aoi].numberFinished - 1;
    raceLog[LOGMAX] = team[aoi].name + ", runner number " + number + " finished at " + h + " : " + m + " : " + s;
    LOGMAX++;
    raceLog = append(raceLog, " ");
}

void downButton(){
  int x = width-150;
  int y = height/2 + 30;
  fill(250);
  triangle(x, y, x+40, y+70, x+80, y);
}

void upButton(){
  int x = width-150;
  int y = height/2-30;
  fill(250);
  triangle(x, y, x+40, y-70, x+80, y);
}

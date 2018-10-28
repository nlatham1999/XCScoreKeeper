void screenIsOne(){
    if(editing == false){    
      if((mouseX > width/2-bLength-(bPad/2))&&(mouseX < width/2-bLength-(bPad/2)+ bLength)&&(mouseY > 15)&&(mouseY < 100)){   //to turn on and off the edit
        if(edit){
          edit = false;
        }
        else{
          edit = true;
        }
      }
      if((mouseY > 100)&&(mouseY < height - 115)){ //see if a team button wass pressed
        int i;
        i = findAoi(100, bWidth, bPad, mouseY);
        if(i != -1){
          if((mouseX > ((width-600)/3))&&(mouseX < ((width-600)/2)+300)){
            aoi = i + (i);
          }
          if((mouseX > (300+(2*((width-600)/3))))&& (mouseX < ((300+(2*((width-600)/3))) + 300))){
            aoi = i + (i + 1);
          }
          if(aoi < numberOfTeamsUsed){
            if(edit == true){   //switches to edditing screen
              editing = true;
            }
            else{              //add team points and such
              if(team[aoi].name != " "){
                team[aoi].numberFinished++;
                if(team[aoi].numberFinished < 6){
                  team[aoi].score += genScore;
                }
                addTempEntry(aoi, genScore);
                genScore++;
                addTeamToLog();
              }
            }
          }
        }
      }
      if((mouseX > width/2+(bPad/2))&&(mouseX < width/2+(bPad/2) + bLength)&&(mouseY > 15)&&(mouseY < 100)){
        if(!tempListIsEmpty()){ //using the undo
          int t = tempTeams[0].team;
          int s = tempTeams[0].scoreAdded;
          removeEntry();
          if(team[t].numberFinished <= 5){
            team[t].score -= s;
          }
          team[t].numberFinished--;
          genScore--;
        }
      }
      if((mouseX > width/2+(bPad/2))&&(mouseX < width/2+(bPad/2) + bLength)&&(mouseY > height-115)&&(mouseY < height-15)){ //using the add new teams
        numberOfTeamsUsed++;
      }
    }
    else{
      if((mouseX > width/2 - 150)&&(mouseX < width/2 + 150)&&(mouseY > 15)&&(mouseY < 115)){
        editing = false;
        hideSoftKeyboard();
      }
      selectColor();
    }
}

void screenIsZero(){
    if((mouseX > width/2 - 315)&&(mouseX < width/2 - 215)&&(mouseY > height/2 - 50)&&(mouseY < height/2 + 50)){
      if(clockGoing){
        clockGoing = false;
        storedM = millis()-storedM;
      }
      else{
        clockGoing = true;     
        storedM = millis()-storedM;
      }
    }
    if((mouseX > width/2 - 200)&&(mouseX < width/2 + 200)&&(mouseY > height/2 - 50)&&(mouseY < height/2 + 50)){
      if(!timerGoing){
        timerGoing = true;
        storedM = millis();
        clockGoing = true;
      }
    }
    if((mouseX > width/2 + 215)&&(mouseX < width/2 + 315)&&(mouseY > height/2 - 50)&&(mouseY < height/2 + 50)){
      timerGoing = false;
      storedM = 0;
    }
}

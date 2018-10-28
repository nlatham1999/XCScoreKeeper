

class tempList { 
  int team;
  int scoreAdded;
  tempList(){
    team = -1;
    scoreAdded = 0;
  }
}

void setupTempList(){
  for (int i = 0; i < UNDOMAX; i++){
    tempTeams[i] = new tempList();
  }
}

void addTempEntry(int t, int s){
  for(int i = 0; i < UNDOMAX - 1; i++){
    tempTeams[UNDOMAX-1-i].team = tempTeams[UNDOMAX-2-i].team;
    tempTeams[UNDOMAX-1-i].scoreAdded =  tempTeams[UNDOMAX-2-i].scoreAdded;   
  }
  tempTeams[0].team = t;
  tempTeams[0].scoreAdded = s;
}

void removeEntry(){
  for(int i = 0; i < UNDOMAX - 1; i++){
    tempTeams[i].team = tempTeams[i+1].team;
    tempTeams[i].scoreAdded = tempTeams[i+1].scoreAdded;
  }
  tempTeams[UNDOMAX-1].team = -1;
  tempTeams[UNDOMAX-1].team = -1;
  if(TEAMMAX > 1){
    raceLog = shorten(raceLog);
    TEAMMAX--;
  }
}

boolean tempListIsEmpty(){
  if(tempTeams[0].team == -1){
    return true;
  }
  else{
    return false;
  }
}

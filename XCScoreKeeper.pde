import android.view.inputmethod.InputMethodManager;
import android.content.Context;

int aoi = 0;     //which part of the screen is pressed
boolean edit = false;  //inside the main program whether the race is in progress or not
int TEAMMAX = 18;//((height - 215)/115)*2;      //the maximum nuber of teams
int TEAMMAXHALF = TEAMMAX/2;
boolean editing = false; //whether we are transitioning to the edit teams or not
int genScore = 1;    //the general score that each member adds to the team. increments at each team member finish
int UNDOMAX = 100;   //the size of the array that holds past actions
int screen = 1; //which screen is run. 1 is main, 0 is clock and 2 is log
int numberOfTeamsUsed = 1;
boolean clockGoing = false;  //pauses and plays the clock
boolean timerGoing = false;  //starts and stops the clock
int storedM = 0;
String raceLog[] = new String[1];
int LOGMAX = 0;
int state = 0;
int bLength = 300;
int bWidth = 100;
int bPad = 15; //(height-215)/TEAMMAXHALF - bWidth;
int logHeight = 0;
//PImage construction = loadImage("construction.png");
//Table table = loadTable("data.txt");






class teams{
    String name;
    int score;
    int numberFinished;
    color colorUsed;

    teams(){
      name = " ";
      score = 0;
      numberFinished = 0;
      colorUsed = #000000;
    }
}

teams[] team = new teams[TEAMMAX];
tempList[] tempTeams = new tempList[UNDOMAX];


void setup(){
  fullScreen();
  strokeWeight(3);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  smooth(8);
  setupTeams();
  setupTempList();
  bWidth = (height)/(TEAMMAXHALF+2) - bPad;
  bLength = (width-(bPad*3))/2;
  print(height);
  print(width);
}

void setupTeams(){
  for(int i = 0; (i < TEAMMAX); i++){
    team[i] = new teams();
    /*
    team[i].score = table.getInt(i, 2);
    team[i].numberFinished = table.getInt(i, 3);
    team[i].name = table.getString(i, 1);
    */
  }
}

void draw(){
  switch (screen){
    case 0:
      doClockScreenStuff();
      break;
    case 1:
      doMainScreenStuff();
      break;
    case 2:
      teamLog();
      break;
    default:
      doMainScreenStuff();
      break;
  }
}

void mouseDragged(){
  if(mouseX - pmouseX > 300){
    if((screen == 1)||(screen == 2)){
      screen--;
    }
  }
  if(mouseX - pmouseX < -300){
    if((screen == 0)||(screen == 1)){
      screen++;
    }
  }
}


void mousePressed(){
  if((mouseX > width/2-bLength-(bPad/2))&&(mouseX < width/2-bLength-(bPad/2) + 70)&&(mouseY > height-115)&&(mouseY < height-15)){
     if((screen == 1)||(screen == 2)){
        screen--;
     }
  }
  if((mouseX > width/2-bLength-(bPad/2) + 150)&&(mouseX < width/2-bLength-(bPad/2) + 220)&&(mouseY > height-115)&&(mouseY < height-15)){
    if((screen == 1)||(screen == 0)){
      screen++;
    }
  }
  if(screen == 0){
    screenIsZero();
  }
  if(screen == 1){
    screenIsOne();
  }
  if(screen == 2){
    if((mouseX > width-150)&&(mouseX < width-150+80)&&(mouseY > height/2 - 30 - 70)&&(mouseY < height/2 - 30)){
      if(logHeight != 0){
        logHeight--;
      }
    }
    if((mouseX > width-150)&&(mouseX < width-150+80)&&(mouseY > height/2 + 30)&&(mouseY < height/2 + 30 + 70)){
      logHeight++;
    }
  }
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (team[aoi].name.length() > 0) {
      team[aoi].name = team[aoi].name.substring(0, team[aoi].name.length()-1);
    }
  } else if (keyCode == DELETE) {
    team[aoi].name = "";
  } else if (keyCode != SHIFT) { //&& keyCode != CONTROL && keyCode != ALT) {
    team[aoi].name = team[aoi].name  + key;
  }
}

int findAoi(int start, int lengthY, int pad, int x){
  for(int i = 0; i < TEAMMAX / 2; i++){
    int k = start + (i*(lengthY + pad));
    for(int j = 0; j < lengthY; j++){
      if(x == k){
        if(i < numberOfTeamsUsed){
          return i;
        }
        else{
          return -1;
        }
      }
      k++;
    }
  }
  return -1;
}

/*
does main screen stuff
functions:
  doMainScreenStuff
    layout
      buttons
    toggleStartEdit
    undoButton
  editingTeamButton
    pickColor
    toggleSoftKeyboard
    showSoftKeyborad
    hideSoftKeyboard
*/

void doMainScreenStuff(){
    background(250);
  if(editing == false){
    layout();
    toggleStartEdit();
    undoButton();
    addNewTeam();
    panButtonLeft();
    panButtonRight();
//    text(genScore, 600, 30);
  }
  else{
    editingTeamName();
  }
}


void layout(){
  int count = 0;
  for(int i = 0; (i < TEAMMAX/2)&&(count < numberOfTeamsUsed); i++){
      buttons(width/2-bLength-(bPad/2), (115)+(i*(bWidth+bPad)), team[count].name, team[count].score, team[count].numberFinished, team[count].colorUsed); //(width-600)/3
      count++;
      if(count < numberOfTeamsUsed){
        buttons(width/2+(bPad/2), (115)+(i*(bWidth+bPad)), team[count].name, team[count].score, team[count].numberFinished, team[count].colorUsed); // 115+(i*115)
        count++;
      }
  }
  
}

void buttons(int x, int y, String name, int score, int numberFinished, color rgb){
  fill(250);
  stroke(rgb);
  rect(x, y, bLength, bWidth);
  stroke(0);
  strokeWeight(3);
  textSize(bWidth/2);
  fill(0);
  textAlign(CENTER);
  text(name,x+150, y+bWidth/2); 
  textAlign(LEFT);
  textSize(bWidth/5);
  text(" number finished: " + numberFinished + "   score: " + score, x, y+(bWidth*.8));
  //text(score, x+200, y+79);
}

void toggleStartEdit(){
  fill(250);
  rect(width/2-bLength-(bPad/2), 15, bLength, 85);
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  if(!edit){
    text("edit teams", (width/2)-(bLength/2-bPad), 65);
  }
  else{
    text("start race", (width/2)-(bLength/2-bPad), 65);
  }
}

void undoButton(){
  fill(250);
  textAlign(CENTER);
  rect(width/2+(bPad/2), 15, bLength, 85);
  fill(0);
  text("undo", width/2+(bPad) + (bLength/2), 65);
}

void addNewTeam(){
  int x = width/2+(bPad/2);
  int y = height-115;
  fill(250);
  rect(x, y, bLength, 100);
  fill(0);
  text("add new team",x+(bLength/2)+ bPad, y+36);
}

void panButtonLeft(){
  int x = width/2-bLength-(bPad/2);
  int y = height-115;
  fill(0);
  if(screen == 2){
    fill(250);
  }
  triangle(x, y+50, x+70, y+10, x+70, y+90);
}

void panButtonRight(){
  int x = width/2-bLength-(bPad/2) + 150;
  int y = height-115;
  fill(0);
  if(screen == 2){
    fill(250);
  }
  triangle(x, y+10, x, y+90, x+70, y+50);
}
  
  

void editingTeamName(){
  fill(250);
  rect(((width/2) - 150), 50, 300, 100);
 
  fill(#0258E8);
  rect(((width/2) - 290), 300, 100, 100);
  fill(#012767);
  rect(((width/2) - 175), 300, 100, 100);
  fill(#C40404);
  rect(((width/2) - 50), 300, 100, 100);
  fill(#EA3E0E);
  rect(((width/2) + 75), 300, 100, 100);
  fill(#F1FA03);
  rect(((width/2) + 190), 300, 100, 100);
  
  fill(#00CE08);
  rect(((width/2) - 290), 415, 100, 100);
  fill(#015504);
  rect(((width/2) - 175), 415, 100, 100);
  fill(#080808);
  rect(((width/2) - 50), 415, 100, 100);
  fill(#840986);
  rect(((width/2) + 75), 415, 100, 100);
  fill(#03814B);
  rect(((width/2) + 190), 415, 100, 100);
  fill(0);
  textAlign(CENTER);
  textSize(40);
  text(team[aoi].name, width/2, 100);
  text("select color below", width/2, 250);
  showSoftKeyboard();
}

void selectColor(){
  if((mouseY > 300)&&(mouseY < 400)){
    if ((mouseX > ((width/2) - 290))&&(mouseX < ((width/2) - 290) + 100)){
      team[aoi].colorUsed = #0258E8;
    }
    if ((mouseX > ((width/2) - 175))&&(mouseX < ((width/2) - 175) + 100)){
      team[aoi].colorUsed = #012767;
    }
    if ((mouseX > ((width/2) - 50))&&(mouseX < ((width/2) - 50) + 100)){
      team[aoi].colorUsed = #C40404;
    }
    if ((mouseX > ((width/2) + 75))&&(mouseX < ((width/2) + 75) + 100)){
      team[aoi].colorUsed = #EA3E0E;
    }
    if ((mouseX > ((width/2) + 190))&&(mouseX < ((width/2) + 190) + 100)){
      team[aoi].colorUsed = #F1FA03;
    }
  }
  if((mouseY > 415)&&(mouseY < 515)){
    if ((mouseX > ((width/2) - 290))&&(mouseX < ((width/2) - 290) + 100)){
      team[aoi].colorUsed = #00CE08;
    }
    if ((mouseX > ((width/2) - 175))&&(mouseX < ((width/2) - 175) + 100)){
      team[aoi].colorUsed = #015504;
    }
    if ((mouseX > ((width/2) - 50))&&(mouseX < ((width/2) - 50) + 100)){
      team[aoi].colorUsed = #080808;
    }
    if ((mouseX > ((width/2) + 75))&&(mouseX < ((width/2) + 75) + 100)){
      team[aoi].colorUsed = #840986;
    }
    if ((mouseX > ((width/2) + 190))&&(mouseX < ((width/2) + 190) + 100)){
      team[aoi].colorUsed = #03814B;
    }
  }
}

void toggleSoftKeyboard() {
  android.view.inputmethod.InputMethodManager imm = (android.view.inputmethod.InputMethodManager) getActivity().getSystemService(android.content.Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(0, 0);
}
 
void showSoftKeyboard() {
  android.view.inputmethod.InputMethodManager imm = (android.view.inputmethod.InputMethodManager) getActivity().getSystemService(android.content.Context.INPUT_METHOD_SERVICE);
  imm.showSoftInput(getActivity().getCurrentFocus(), 0);
}
 
void hideSoftKeyboard() {
  android.view.inputmethod.InputMethodManager imm = (android.view.inputmethod.InputMethodManager) getActivity().getSystemService(android.content.Context.INPUT_METHOD_SERVICE);
  imm.hideSoftInputFromWindow(getActivity().getCurrentFocus().getWindowToken(), 0);
}

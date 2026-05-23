class Screen {

  color mainScreenCol;
  color secondScreenCol;
  int type;

  Screen(color mainScreenCol, color secondScreenCol, int type){
    
    this.mainScreenCol = mainScreenCol;
    this.secondScreenCol = secondScreenCol;
    this.type = type;
  }

  void drawScreen(){

    noStroke();
    fill(mainScreenCol);
    rect(0,0,width,height);

    if(type == 1){
      
    }

    if(type == 2){

      fill(thirdScreenCol);
      rect(0, 0, width * 0.1, height);
      rect(width * 0.9, 0, width, height);
    }
    
    if(type == 3){

      fill(thirdScreenCol);
      rect(0, 0, width * 0.1, height);
    }
    
    fill(secondScreenCol);
    rect(0, 0, width, height * 0.12);
  }
}

import controlP5.*;

final int MENU = 0;
final int SUMMARY = 1;
final int THEORY = 2;
final int FLASHCARDS = 3;
final int ANSWERS = 4;
final int QUESTIONS = 5;
final int CREDITS = 6;

int screen = MENU;

Screen intro;
Screen summary;
Screen credits;
Screen theory;
Screen flashcards;
Screen answers;
Screen questions;

color mainScreenCol = color(0,50,255);
color secondScreenCol = color(0,20,200);
color thirdScreenCol = color(0,30,150);

color mainButtonCol = color(30,200,200);
color exitButtonCol = color(200,0,0);
color backButtonCol = color(0,0,240);

ArrayList<Button> menuButtons = new ArrayList<Button>();

Button backButton;

void setup(){

  fullScreen(JAVA2D);
  
  setupUI();

  intro = new Screen(mainScreenCol, secondScreenCol, 2);
  summary = new Screen(mainScreenCol, secondScreenCol, 2);
  theory = new Screen(mainScreenCol, secondScreenCol, 1);
  questions = new Screen(mainScreenCol, secondScreenCol, 1);
  answers = new Screen(mainScreenCol, secondScreenCol, 1);
  flashcards = new Screen(mainScreenCol, secondScreenCol, 1);
  credits = new Screen(mainScreenCol, secondScreenCol, 2);

  backButton = new Button(0.92, 0.03, 0.06, 0.06, backButtonCol,"Voltar", MENU);

  menuButtons.add(new Button(0.24, 0.30, 0.18, 0.10, mainButtonCol, "Sumário", SUMMARY));
  menuButtons.add(new Button(0.24, 0.48, 0.18, 0.10, mainButtonCol, "Créditos", CREDITS));
  menuButtons.add(new Button(0.58, 0.24, 0.18, 0.10, mainButtonCol, "Teoria", THEORY));
  menuButtons.add(new Button(0.58, 0.42, 0.18, 0.10, mainButtonCol, "Questões", QUESTIONS));
  menuButtons.add(new Button(0.58, 0.60, 0.18, 0.10, mainButtonCol, "Revisão", FLASHCARDS));
  menuButtons.add(new Button(0.92, 0.03, 0.06, 0.06, exitButtonCol, "Sair", -1));
}

void draw(){
  
  updateSummaryUI();
  hideSummaryUI();
  
  updateQuizUI();
  hideQuizUI();
  
  updateCreditsUI();
  hideCreditsUI();

  switch(screen){

    case MENU:
    drawMenu();
    break;

    case SUMMARY:
    drawSummary();
    showSummaryUI();
    break;

    case THEORY:
    drawTheory();
    break;

    case FLASHCARDS:
    drawFlashcards();
    break;

    case ANSWERS:
    drawAnswers();
    break;

    case QUESTIONS:
    drawQuestions();
    showQuizUI();
    break;

    case CREDITS:
    drawCredits();
    showCreditsUI();
    break;
  }
}

void drawTitle(String txt){

  fill(255);
  textAlign(CENTER);
  textSize(height * 0.06);
  text(txt, width * 0.5, height * 0.08);
}

void mousePressed(){

  if(screen == MENU){

    for(Button b : menuButtons){

      if(b.isMouseOver()){

        if(b.targetScreen == -1){

          exit();

        } else {

          screen = b.targetScreen;
        }
      }
    }
  }

  else {

    if(backButton.isMouseOver()){

      screen = MENU;
    }
  }
  
  if(screen == QUESTIONS){
    selectAnswer();
  }
}

void keyPressed(){

  if(key == ESC){

    key = 0;
  }
}

boolean mouseOver(float x, float y, float w, float h){

  return (
    mouseX > x &&
    mouseX < x + w &&
    mouseY > y &&
    mouseY < y + h
  );
}

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

int questao = 0;
int pontos = 0;

void setup(){

  fullScreen(JAVA2D);

  intro = new Screen(mainScreenCol, secondScreenCol, 1);
  summary = new Screen(mainScreenCol, secondScreenCol, 2);
  theory = new Screen(mainScreenCol, secondScreenCol, 3);
  questions = new Screen(mainScreenCol, secondScreenCol, 3);
  answers = new Screen(mainScreenCol, secondScreenCol, 3);
  flashcards = new Screen(mainScreenCol, secondScreenCol, 3);
  credits = new Screen(mainScreenCol, secondScreenCol, 1);

  backButton = new Button(0.92, 0.03, 0.06, 0.06, backButtonCol,"Voltar", MENU);

  menuButtons.add(new Button(0.2, 0.2, 0.12, 0.1, mainButtonCol, "Sumário", SUMMARY));
  menuButtons.add(new Button(0.44, 0.2, 0.12, 0.1, mainButtonCol, "Teoria", THEORY));
  menuButtons.add(new Button(0.68, 0.2, 0.12, 0.1, mainButtonCol, "Créditos", CREDITS));
  menuButtons.add(new Button(0.2, 0.35, 0.12, 0.1, mainButtonCol, "Questões", QUESTIONS));
  menuButtons.add(new Button(0.44, 0.35, 0.12, 0.1, mainButtonCol, "Revisão", FLASHCARDS));
  menuButtons.add(new Button(0.92, 0.03, 0.06, 0.06, exitButtonCol, "Sair", -1));
}

void draw(){

  switch(screen){

    case MENU:
    drawMenu();
    break;

    case SUMMARY:
    drawSummary();
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
    break;

    case CREDITS:
    drawCredits();
    break;
  }
}

void drawTitle(String txt){

  fill(255);

  textAlign(CENTER);

  textSize(height * 0.06);

  text(
    txt,
    width * 0.5,
    height * 0.1
  );
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

    float y = height * 0.45;

    for(int i = 0; i < alternativas[questao].length; i++){

      float x = width * 0.2;
      float w = width * 0.6;
      float h = height * 0.08;

      if(mouseOver(x, y + i * height * 0.1, w, h)){

        verificarResposta(i);
      }
    }
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

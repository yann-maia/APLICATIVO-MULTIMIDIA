import controlP5.*;

ControlP5 cp5;

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

color mainScreenCol = color(120,0,45);
color secondScreenCol = color(85,0,32);
color thirdScreenCol = color(65,0,25);

color mainButtonCol = color(150,0,55);
color exitButtonCol = color(200,0,0);
color backButtonCol = color(150,0,55);

ArrayList<Button> menuButtons = new ArrayList<Button>();

Button backButton;

int questao = 0;
int pontos = 0;

void setup(){

  fullScreen(JAVA2D);
  smooth(8);
  cp5 = new ControlP5(this);

  intro = new Screen(mainScreenCol, secondScreenCol, 1);
  summary = new Screen(mainScreenCol, secondScreenCol, 2);
  theory = new Screen(mainScreenCol, secondScreenCol, 3);
  questions = new Screen(mainScreenCol, secondScreenCol, 3);
  answers = new Screen(mainScreenCol, secondScreenCol, 3);
  flashcards = new Screen(mainScreenCol, secondScreenCol, 3);
  credits = new Screen(mainScreenCol, secondScreenCol, 1);

  backButton = new Button(0.92, 0.03, 0.06, 0.06, backButtonCol,"Menu", MENU);
  setupTheory();
  setupQuestions();
  setupReview();

  menuButtons.add(new Button(0.2, 0.2, 0.12, 0.1, mainButtonCol, "Sumário", SUMMARY));
  menuButtons.add(new Button(0.44, 0.2, 0.12, 0.1, mainButtonCol, "Teoria", THEORY));
  menuButtons.add(new Button(0.68, 0.2, 0.12, 0.1, mainButtonCol, "Créditos", CREDITS));
  menuButtons.add(new Button(0.2, 0.35, 0.12, 0.1, mainButtonCol, "Questões", QUESTIONS));
  menuButtons.add(new Button(0.44, 0.35, 0.12, 0.1, mainButtonCol, "Revisão", FLASHCARDS));
  menuButtons.add(new Button(0.92, 0.03, 0.06, 0.06, exitButtonCol, "Sair", -1));

  menuButtons.get(0).text = "Sum\u00e1rio";
  menuButtons.get(2).text = "Cr\u00e9ditos";
  menuButtons.get(3).text = "Quest\u00f5es";
  menuButtons.get(4).text = "Revis\u00e3o";
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

  textFont(createFont("Times New Roman", height * 0.06));
  textSize(height * 0.06);

  text(
    txt,
    width * 0.5,
    height * 0.1
  );

  textFont(createFont("SansSerif", 16));
}

void mousePressed(){

  if(screen == MENU){

    for(Button b : menuButtons){

      if(b.isMouseOver()){

        if(b.targetScreen == -1){

          exit();

        } else {

          if(b.targetScreen == QUESTIONS){

            resetQuestions();
          }

          screen = b.targetScreen;
        }

        return;
      }
    }
  }

  else {

    if(backButton.isMouseOver()){

      if(screen == FLASHCARDS){

        hideReview();
      }

      screen = MENU;
      return;
    }
  }

  if(screen == THEORY){

    handleTheoryMousePressed();
    return;
  }

  if(screen == QUESTIONS){

    handleQuestionsMousePressed();
    return;
  }

  if(screen == ANSWERS){

    handleAnswersMousePressed();
    return;
  }

  if(screen == FLASHCARDS){

    handleReviewMousePressed();
    return;
  }

  if(screen == CREDITS){

    handleCreditsMousePressed();
    return;
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

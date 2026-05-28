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

color theoryBackground;
color theoryBook;
color theoryPage;
color theoryText;
color theoryButton;

color answersBackground;
color answersText;
color answersPanel;
color answersCorrect;
color answersWrong;

color answersBlueButton;
color answersBlueHover;

color answersRedButton;
color answersRedHover;

color practiceButtonColor;
color practiceButtonHover;

color questionsBackground;
color questionsPanel;
color questionsText;
color questionsButton;
color questionsCorrect;
color questionsWrong;

color reviewBackground;
color reviewCard;
color reviewCardHover;
color reviewText;
color reviewTitle;

color mainScreenCol = color(120,0,45);
color secondScreenCol = color(85,0,32);
color thirdScreenCol = color(65,0,25);

boolean darkMode = false;

color mainButtonCol = color(150,0,55);
color exitButtonCol = color(200,0,0);
color backButtonCol = color(150,0,55);

ArrayList<Button> menuButtons = new ArrayList<Button>();

Button backButton;

int questao = 0;
int pontos = 0;

float[] confeteX = new float[150];
float[] confeteY = new float[150];
float[] confeteVel = new float[150];
color[] confeteCor = new color[150];

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

  menuButtons.add(new Button(0.68,0.35,0.12,0.1,mainButtonCol,"Dark Mode",999));

  menuButtons.get(0).text = "Sum\u00e1rio";
  menuButtons.get(2).text = "Cr\u00e9ditos";
  menuButtons.get(3).text = "Quest\u00f5es";
  menuButtons.get(4).text = "Revis\u00e3o";
  updateTheme();
  setupConfete();
}

void updateTheme(){

  if(darkMode){
    
    answersBackground = color(25);
    answersText = color(255);
    answersPanel = color(60);

    answersCorrect = color(80, 200, 80);
    answersWrong = color(220, 90, 90);

    answersBlueButton = color(70,120,220);
    answersBlueHover = color(100,150,255);
 
    answersRedButton = color(170,50,50);
    answersRedHover = color(220,90,90);

    practiceButtonColor = color(50,140,80);
    practiceButtonHover = color(80,190,110);
    
    questionsBackground = color(25);
    questionsPanel = color(60);
    questionsText = color(255);
    questionsButton = color(90);

    questionsCorrect = color(70,140,70);
    questionsWrong = color(140,70,70);
    
    reviewBackground = color(30);
    reviewCard = color(70);
    reviewCardHover = color(100,140,100);
    reviewText = color(255);
    reviewTitle = color(255);

    theoryBackground = color(25);
    theoryBook = color(55);
    theoryPage = color(90);
    theoryText = color(255);
    theoryButton = color(120);
    
    mainScreenCol = color(20);
    secondScreenCol = color(35);
    thirdScreenCol = color(50);

    mainButtonCol = color(70);
    exitButtonCol = color(150,0,0);
    backButtonCol = color(90);

  } else {
    
    answersBackground = color(245);
    answersText = color(0);
    answersPanel = color(255);

    answersCorrect = color(0,155,0);
    answersWrong = color(210,0,0);

    answersBlueButton = color(40,110,230);
    answersBlueHover = color(90,160,255);

    answersRedButton = color(220,40,40);
    answersRedHover = color(255,90,90);

    practiceButtonColor = color(40,170,90);
    practiceButtonHover = color(90,220,140);
    
    questionsBackground = color(240);
    questionsPanel = color(255);
    questionsText = color(0);
    questionsButton = color(150,0,55);

    questionsCorrect = color(120,255,120);
    questionsWrong = color(255,120,120);
     
    reviewBackground = color(240);
    reviewCard = color(255);
    reviewCardHover = color(180,255,180);
    reviewText = color(0);
    reviewTitle = color(0);

    theoryBackground = color(225,210,190);
    theoryBook = color(92,51,23);
    theoryPage = color(245,235,210);
    theoryText = color(40);
    theoryButton = color(110,70,45);
    
    mainScreenCol = color(120,0,45);
    secondScreenCol = color(85,0,32);
    thirdScreenCol = color(65,0,25);

    mainButtonCol = color(150,0,55);
    exitButtonCol = color(200,0,0);
    backButtonCol = color(150,0,55);
  }

  intro.mainScreenCol = mainScreenCol;
  intro.secondScreenCol = secondScreenCol;

  summary.mainScreenCol = mainScreenCol;
  summary.secondScreenCol = secondScreenCol;

  theory.mainScreenCol = mainScreenCol;
  theory.secondScreenCol = secondScreenCol;

  questions.mainScreenCol = mainScreenCol;
  questions.secondScreenCol = secondScreenCol;

  answers.mainScreenCol = mainScreenCol;
  answers.secondScreenCol = secondScreenCol;

  flashcards.mainScreenCol = mainScreenCol;
  flashcards.secondScreenCol = secondScreenCol;

  credits.mainScreenCol = mainScreenCol;
  credits.secondScreenCol = secondScreenCol;

  for(Button b : menuButtons){

    if(b.targetScreen == -1){

      b.baseColor = exitButtonCol;

    } else {

      b.baseColor = mainButtonCol;
    }
  }

  backButton.baseColor = backButtonCol;
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

          if(b.targetScreen == 999){

            darkMode = !darkMode;
            updateTheme();

          } else {

            screen = b.targetScreen;
          }
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

// =========================================================
// SCREEN IDS
// =========================================================

final int MENU_SCREEN      = 0;
final int SUMMARY_SCREEN   = 1;
final int THEORY_SCREEN    = 2;
final int REVIEW_SCREEN    = 3;
final int ANSWERS_SCREEN   = 4;
final int QUESTIONS_SCREEN = 5;
final int CREDITS_SCREEN   = 6;

// =========================================================
// GLOBAL STATE
// =========================================================

int     currentScreen = MENU_SCREEN;
boolean darkMode      = false;

// =========================================================
// THEMES
// =========================================================

Theme lightTheme;
Theme darkTheme;
Theme currentTheme;

// =========================================================
// SCREENS
// =========================================================

Screen introScreen;
Screen summaryScreen;
Screen theoryScreen;
Screen reviewScreen;
Screen answersScreen;
Screen questionsScreen;
Screen creditsScreen;

// =========================================================
// SHARED BUTTONS
// =========================================================

ArrayList<Button> menuButtons = new ArrayList<Button>();
Button backButton;

// =========================================================
// SETUP
// =========================================================

void setup() {
  fullScreen(JAVA2D);
  smooth(8);

  setupThemes();
  setupScreens();
  setupMenuButtons();
  setupBackButton();
  setupSummaryScreen();
  setupTheoryScreen();
  setupQuestionsScreen();
  setupAnswersScreen();
  setupReviewScreen();
  setupCreditsScreen();
  setupConfetti();
  updateTheme();
}

// =========================================================
// DRAW
// =========================================================

void draw() {
  switch (currentScreen) {
    case MENU_SCREEN:      drawMenuScreen();      break;
    case SUMMARY_SCREEN:   drawSummaryScreen();   break;
    case THEORY_SCREEN:    drawTheoryScreen();    break;
    case REVIEW_SCREEN:    drawReviewScreen();    break;
    case ANSWERS_SCREEN:   drawAnswersScreen();   break;
    case QUESTIONS_SCREEN: drawQuestionsScreen(); break;
    case CREDITS_SCREEN:   drawCreditsScreen();   break;
  }
}

// =========================================================
// MOUSE INPUT
// =========================================================

void mousePressed() {
  if (currentScreen == MENU_SCREEN) {
    handleMenuClick();
    return;
  }

  handleBackButton();

  switch (currentScreen) {
    case THEORY_SCREEN:    handleTheoryClick();    break;
    case QUESTIONS_SCREEN: handleQuestionsClick(); break;
    case ANSWERS_SCREEN:   handleAnswersClick();   break;
    case REVIEW_SCREEN:    handleReviewClick();    break;
    case CREDITS_SCREEN:   handleCreditsClick();   break;
  }
}

// =========================================================
// KEYBOARD INPUT
// =========================================================

void keyPressed() {
  if (key == ESC) key = 0;
}

// =========================================================
// SETUP THEMES
// =========================================================

void setupThemes() {
  lightTheme = new Theme(
    color(120, 0, 45),    // background
    color(85, 0, 32),     // secondaryBackground
    color(65, 0, 25),     // tertiaryBackground
    color(255),           // text → branco (telas agora têm fundo escuro)
    color(150, 0, 55),    // panel → vinho (era branco)
    color(150, 0, 55),    // primaryButton
    color(190, 40, 95),   // primaryButtonHover
    color(150, 0, 55),    // secondaryButton → vinho (era azul)
    color(190, 40, 95),   // secondaryButtonHover
    color(200, 0, 0),     // exitButton
    color(255, 60, 60),   // exitButtonHover
    color(0, 155, 0),     // success
    color(210, 0, 0),     // error
    color(85, 0, 32),     // theoryBook → secondaryBackground vinho escuro
    color(255),           // theoryPage → branco
    color(0),             // theoryText → preto (sobre página branca)
    color(120, 0, 45),    // theoryButton → vinho principal
    color(120, 0, 45),    // theoryBackground → vinho principal
    color(255),           // reviewCard
    color(180, 255, 180), // reviewCardHover
    color(120, 0, 45),    // reviewBackground → vinho principal
    color(30),           // reviewText → branco (fundo escuro)
    color(120, 0, 45),    // answersBackground → vinho principal
    color(255)            // answersText → branco
  );

  darkTheme = new Theme(
    color(20),            // background
    color(35),            // secondaryBackground
    color(50),            // tertiaryBackground
    color(255),           // text
    color(60),            // panel
    color(70),            // primaryButton
    color(110),           // primaryButtonHover
    color(70),            // secondaryButton → cinza (era azul)
    color(110),           // secondaryButtonHover
    color(150, 0, 0),     // exitButton
    color(200, 50, 50),   // exitButtonHover
    color(80, 200, 80),   // success
    color(220, 90, 90),   // error
    color(35),            // theoryBook → secondaryBackground dark
    color(255),           // theoryPage → branco
    color(0),             // theoryText → preto (sobre página branca)
    color(70),            // theoryButton → cinza dark
    color(20),            // theoryBackground → background dark
    color(70),            // reviewCard
    color(100, 140, 100), // reviewCardHover
    color(20),            // reviewBackground → background dark
    color(255),           // reviewText
    color(20),            // answersBackground → background dark
    color(255)            // answersText
  );

  currentTheme = lightTheme;
}

// =========================================================
// SETUP SCREENS
// =========================================================

void setupScreens() {
  introScreen     = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  summaryScreen   = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  theoryScreen    = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  reviewScreen    = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  answersScreen   = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  questionsScreen = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
  creditsScreen   = new Screen(currentTheme.background, currentTheme.secondaryBackground, 2);
}

// =========================================================
// UPDATE THEME
// =========================================================

void updateTheme() {
  currentTheme = darkMode ? darkTheme : lightTheme;

  Screen[] screens = {
    introScreen, summaryScreen, theoryScreen,
    reviewScreen, answersScreen, questionsScreen, creditsScreen
  };

  for (Screen s : screens) {
    s.mainColor      = currentTheme.background;
    s.secondaryColor = currentTheme.secondaryBackground;
  }

  for (Button b : menuButtons) {
    if (b.targetScreen == -1) {
      b.baseColor  = currentTheme.exitButton;
      b.hoverColor = currentTheme.exitButtonHover;
    } else {
      b.baseColor  = currentTheme.primaryButton;
      b.hoverColor = currentTheme.primaryButtonHover;
    }
  }

  backButton.baseColor  = currentTheme.primaryButton;
  backButton.hoverColor = currentTheme.primaryButtonHover;

  updateTheoryButtons();
  updateDynamicButtons();
}

// =========================================================
// UPDATE DYNAMIC BUTTONS (called from updateTheme)
// =========================================================

void updateDynamicButtons() {
  if (startQuizButton   != null) { startQuizButton.baseColor   = currentTheme.secondaryButton; startQuizButton.hoverColor   = currentTheme.secondaryButtonHover; }
  if (viewAnswersButton != null) { viewAnswersButton.baseColor = currentTheme.secondaryButton; viewAnswersButton.hoverColor = currentTheme.secondaryButtonHover; }
  if (retryQuizButton   != null) { retryQuizButton.baseColor   = currentTheme.secondaryButton; retryQuizButton.hoverColor   = currentTheme.secondaryButtonHover; }
  if (answerPrevButton  != null) { answerPrevButton.baseColor  = currentTheme.primaryButton;   answerPrevButton.hoverColor  = currentTheme.primaryButtonHover; }
  if (answerNextButton  != null) { answerNextButton.baseColor  = currentTheme.primaryButton;   answerNextButton.hoverColor  = currentTheme.primaryButtonHover; }
  if (answerRetryButton != null) { answerRetryButton.baseColor = currentTheme.secondaryButton; answerRetryButton.hoverColor = currentTheme.secondaryButtonHover; }
  if (creditsFormButton != null) { creditsFormButton.baseColor = currentTheme.primaryButton;   creditsFormButton.hoverColor = currentTheme.primaryButtonHover; }
}

// =========================================================
// MENU SCREEN
// =========================================================

void setupMenuButtons() {
  menuButtons.clear();

  color btn  = currentTheme.primaryButton;
  color hovr = currentTheme.primaryButtonHover;
  color txt  = color(255);

  menuButtons.add(new Button(0.24, 0.24, 0.12, 0.10, "Sum\u00e1rio",  SUMMARY_SCREEN,   btn, hovr, txt));
  menuButtons.add(new Button(0.64, 0.24, 0.12, 0.10, "Teoria",        THEORY_SCREEN,    btn, hovr, txt));
  menuButtons.add(new Button(0.24, 0.42, 0.12, 0.10, "Cr\u00e9ditos", CREDITS_SCREEN,   btn, hovr, txt));
  menuButtons.add(new Button(0.64, 0.42, 0.12, 0.10, "Quest\u00f5es", QUESTIONS_SCREEN, btn, hovr, txt));
  menuButtons.add(new Button(0.64, 0.60, 0.12, 0.10, "Revis\u00e3o",  REVIEW_SCREEN,    btn, hovr, txt));
  menuButtons.add(new Button(0.24, 0.60, 0.12, 0.10, "Dark Mode",     999,              btn, hovr, txt));
  menuButtons.add(new Button(0.92, 0.03, 0.06, 0.06, "Sair",          -1,
    currentTheme.exitButton, currentTheme.exitButtonHover, txt));
}

void setupBackButton() {
  backButton = new Button(
    0.92, 0.03, 0.06, 0.06,
    "Menu", MENU_SCREEN,
    currentTheme.primaryButton,
    currentTheme.primaryButtonHover,
    color(255)
  );
}

// -------------------------
// DRAW
// -------------------------

void drawMenuScreen() {
  introScreen.display();

  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("Times New Roman", height * 0.045));
  textSize(height * 0.045);
  text(
    "Consumo de Energia El\u00e9trica - 8\u00ba Ano",
    width * 0.5,
    height * 0.06
  );

  for (Button b : menuButtons) {
    b.display();
  }

  fill(255);
  textFont(createFont("Times New Roman", height * 0.028));
  textSize(height * 0.028);
  textAlign(CENTER, CENTER);
  text(
    "Projeto Extensionista - Extens\u00e3o Universit\u00e1ria PUCPR",
    width * 0.5,
    height * 0.9
  );

  textFont(createFont("SansSerif", 16));
}

// -------------------------
// INPUT
// -------------------------

void handleMenuClick() {
  for (Button b : menuButtons) {
    if (!b.isMouseOver()) continue;

    if (b.targetScreen == -1) {
      exit();
      return;
    }

    if (b.targetScreen == 999) {
      darkMode = !darkMode;
      updateTheme();
      return;
    }

    if (b.targetScreen == QUESTIONS_SCREEN) {
      resetQuestions();
    }

    currentScreen = b.targetScreen;
    return;
  }
}

void handleBackButton() {
  if (!backButton.isMouseOver()) return;

  currentScreen = MENU_SCREEN;
}

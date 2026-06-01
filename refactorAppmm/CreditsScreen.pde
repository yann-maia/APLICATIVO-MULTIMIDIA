// =========================================================
// CREDITS SCREEN
// =========================================================

Button creditsFormButton;

// -------------------------
// SETUP (chamado em setup via setupButtons ou lazy)
// -------------------------

void setupCreditsScreen() {
  creditsFormButton = new Button(
    width * 0.16, height * 0.80, 360, 52,
    "Responder formul\u00e1rio", -1,
    currentTheme.primaryButton, currentTheme.primaryButtonHover,
    color(255), false
  );
}

// -------------------------
// DRAW
// -------------------------

void drawCreditsScreen() {
  creditsScreen.display();
  drawScreenTitle("CR\u00c9DITOS");

  // Garante que o botão está posicionado corretamente
  if (creditsFormButton == null) setupCreditsScreen();
  creditsFormButton.relX = width * 0.16;
  creditsFormButton.relY = height * 0.80;

  fill(255);
  textAlign(LEFT);
  textSize(22);

  for (int i = 0; i < creditsLines.length; i++) {
    text(
      creditsLines[i],
      width * 0.16,
      height * 0.20 + i * height * 0.055,
      width * 0.72,
      height * 0.045
    );
  }

  textSize(21);
  textLeading(28);
  text(
    "Muito obrigado por ter complementado o seu estudo utilizando nosso aplicativo!\n\n"
    + "Por favor, n\u00e3o deixe de responder o formul\u00e1rio abaixo deixando sua avalia\u00e7\u00e3o "
    + "e sugest\u00f5es de melhoria. Sua opini\u00e3o \u00e9 muito importante para a gente!",
    width * 0.16,
    height * 0.58,
    width * 0.68,
    height * 0.18
  );

  creditsFormButton.display();
  backButton.display();
}

// -------------------------
// INPUT
// -------------------------

void handleCreditsClick() {
  if (creditsFormButton != null && creditsFormButton.isMouseOver()) {
    link(creditsFormUrl);
  }
}

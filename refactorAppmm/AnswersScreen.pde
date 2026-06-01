// =========================================================
// ANSWERS SCREEN
// Exibe o gabarito questão a questão e a tela "Pratique mais".
// =========================================================

// -------------------------
// STATE
// -------------------------

int answerPage = 0;

PFont fontAnswerTitle;
PFont fontAnswerBody;

// Botões de navegação
Button answerPrevButton;
Button answerNextButton;
Button answerRetryButton;

// -------------------------
// SETUP
// -------------------------

void setupAnswersScreen() {
  fontAnswerTitle = createFont("Times New Roman", 40);
  fontAnswerBody  = createFont("Verdana", 18);

  answerPrevButton  = new Button(25, 0, 175, 75, "Voltar",       -1,
    currentTheme.primaryButton, currentTheme.primaryButtonHover, color(255), false);
  answerNextButton  = new Button(0,  0, 175, 75, "Continuar",    -1,
    currentTheme.primaryButton, currentTheme.primaryButtonHover, color(255), false);
  answerRetryButton = new Button(0,  0, 195, 75, "Refazer quiz", -1,
    currentTheme.secondaryButton, currentTheme.secondaryButtonHover, color(255), false);
}

void resetAnswers() {
  answerPage = 0;
}

// Atualiza posição Y dos botões de navegação (depende de height)
void positionAnswerButtons() {
  float y = height - 100;
  answerPrevButton.relY = y;
  answerNextButton.relX = width - 200;
  answerNextButton.relY = y;
  answerRetryButton.relX = width - 220;
  answerRetryButton.relY = y;
}

// -------------------------
// DRAW CONTROLLER
// -------------------------

void drawAnswersScreen() {
  background(currentTheme.answersBackground);
  positionAnswerButtons();

  if (answerPage < questions.length) {
    drawAnswerPage(answerPage);
  } else {
    drawPracticeMorePage();
  }

  backButton.display();
}

// -------------------------
// ANSWER PAGE
// -------------------------

void drawAnswerPage(int index) {
  Question q = questions[index];

  fill(currentTheme.answersText);
  textAlign(LEFT);

  textFont(fontAnswerTitle);
  textSize(40);
  text("GABARITO QUEST\u00c3O " + (index + 1) + ":", 50, 70);

  textFont(fontAnswerBody);
  textSize(24);
  textLeading(31);
  text("'" + q.statement + "'", 50, 120, width - 140, 110);

  // Cor da resposta: acerto = verde, erro = vermelho, discursiva = azul
  textSize(25);
  fill(answerLabelColor(index));
  text("Resposta: " + q.answerLabel, 50, 245, width - 120, 130);

  // Ajuste de Y para questão 7 (gabarito mais longo)
  float explY = (index == 6) ? 430 : 360;

  fill(currentTheme.answersText);
  textSize(19);
  textLeading(25);
  text("Explica\u00e7\u00e3o:\n\n" + q.explanation, 50, explY, width - 120, height - explY - 130);

  // Navegação
  String prevLabel = (answerPage == 0) ? "Pontua\u00e7\u00e3o" : "Voltar";
  String nextLabel = (answerPage == questions.length - 1) ? "Pratique mais" : "Continuar";

  answerPrevButton.label = prevLabel;
  answerNextButton.label = nextLabel;

  answerPrevButton.display();
  answerNextButton.display();
}

color answerLabelColor(int index) {
  // Questões discursivas (6, 7, 8, 9, 10) usam azul neutro
  if (index >= 5) return color(40, 110, 230);
  // V/F: verde se acertou, vermelho se errou
  if (selectedAnswers[index] == questions[index].correctAnswer) return color(0, 155, 0);
  return color(210, 0, 0);
}

// -------------------------
// PRACTICE MORE PAGE
// -------------------------

void drawPracticeMorePage() {
  fill(currentTheme.answersText);
  textAlign(LEFT);

  textFont(fontAnswerTitle);
  textSize(42);
  text("Pratique mais!", 50, 75);

  textFont(fontAnswerBody);
  textSize(24);
  textLeading(32);
  text(
    "Resolva as listas de exerc\u00edcio online abaixo e aprimore ainda mais\n"
    + "seu conhecimento sobre o consumo de energia el\u00e9trica.",
    50, 120, width - 120, 100
  );

  for (int i = 0; i < practiceLabels.length; i++) {
    drawPracticeLink(50, 220 + i * 100, practiceLinkWidths[i], 44, practiceLabels[i]);
  }

  textSize(22);
  fill(currentTheme.answersText);
  textAlign(LEFT, CENTER);
  text(
    "(Dica: utilize uma IA de sua prefer\u00eancia para corrigir suas respostas.)",
    530, 342, width - 580, 90
  );

  answerPrevButton.label = "Voltar";
  answerPrevButton.display();
  answerRetryButton.display();
}

void drawPracticeLink(float x, float y, float w, float h, String label) {
  boolean hover = mouseOver(x, y, w, h);
  fill(hover ? currentTheme.primaryButtonHover : currentTheme.primaryButton);
  noStroke();
  rect(x, y, w, h, 20);
  fill(255);
  textFont(fontAnswerBody);
  textSize(18);
  textAlign(LEFT, CENTER);
  text(label, x + 18, y + h / 2);
}

// -------------------------
// INPUT
// -------------------------

void handleAnswersClick() {
  if (answerPage < questions.length) {
    handleAnswerPageClick();
  } else {
    handlePracticeMoreClick();
  }
}

void handleAnswerPageClick() {
  // Próximo
  if (answerNextButton.isMouseOver()) {
    if (answerPage < questions.length - 1) answerPage++;
    else answerPage = questions.length; // vai para "Pratique mais"
    return;
  }
  // Anterior / Pontuação
  if (answerPrevButton.isMouseOver()) {
    if (answerPage == 0) {
      quizState     = QUIZ_FINISHED;
      currentScreen = QUESTIONS_SCREEN;
    } else {
      answerPage--;
    }
  }
}

void handlePracticeMoreClick() {
  // Links externos
  for (int i = 0; i < practiceLabels.length; i++) {
    if (mouseOver(50, 220 + i * 100, practiceLinkWidths[i], 44)) {
      link(practiceUrls[i]);
      return;
    }
  }
  // Voltar
  if (answerPrevButton.isMouseOver()) {
    answerPage = questions.length - 1;
    return;
  }
  // Refazer quiz
  if (answerRetryButton.isMouseOver()) {
    resetQuestions();
    currentScreen = QUESTIONS_SCREEN;
  }
}

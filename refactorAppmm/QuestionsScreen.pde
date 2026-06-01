// =========================================================
// QUESTIONS SCREEN
// =========================================================

// -------------------------
// STATE
// -------------------------

final int QUIZ_START    = 0;
final int QUIZ_PLAYING  = 1;
final int QUIZ_FINISHED = 2;

int quizState       = QUIZ_START;
int currentQuestion = 0;
int score           = 0;

int[] selectedAnswers;

// bandeiras (questão 7)
int   selectedFlag            = -1;
int[] playerFlagAnswers       = { -1, -1, -1, -1 };

// confetti
float[] confettiX   = new float[150];
float[] confettiY   = new float[150];
float[] confettiVel = new float[150];
color[] confettiCol = new color[150];

// fonts
PFont fontQuizTitle;
PFont fontQuizBody;

// botões
Button startQuizButton;
Button retryQuizButton;
Button viewAnswersButton;

// -------------------------
// SETUP
// -------------------------

void setupQuestionsScreen() {
  fontQuizTitle = createFont("Times New Roman", 40);
  fontQuizBody  = createFont("Verdana", 18);

  selectedAnswers = new int[questions.length];

  float bx = width / 2 - 130;
  color bBase  = currentTheme.secondaryButton;
  color bHover = currentTheme.secondaryButtonHover;

  startQuizButton   = new Button(bx, height * 0.58, 260, 75, "INICIAR",       -1, bBase, bHover, color(255), false);
  retryQuizButton   = new Button(bx, height * 0.70, 260, 75, "Refazer quiz",  -1, bBase, bHover, color(255), false);
  viewAnswersButton = new Button(bx, height * 0.68, 260, 75, "Ver Gabarito",  -1, bBase, bHover, color(255), false);

  resetQuestions();
}

void setupConfetti() {
  for (int i = 0; i < confettiX.length; i++) {
    confettiX[i]   = random(width);
    confettiY[i]   = random(-height, 0);
    confettiVel[i] = random(2, 8);
    confettiCol[i] = color(random(255), random(255), random(255));
  }
}

// -------------------------
// RESET
// -------------------------

void resetQuestions() {
  quizState       = QUIZ_START;
  currentQuestion = 0;
  score           = 0;
  selectedFlag    = -1;

  if (selectedAnswers == null) selectedAnswers = new int[questions.length];
  for (int i = 0; i < selectedAnswers.length; i++) selectedAnswers[i] = -1;

  resetFlagQuestion();
}

void resetFlagQuestion() {
  selectedFlag = -1;
  for (int i = 0; i < playerFlagAnswers.length; i++) playerFlagAnswers[i] = -1;
}

// -------------------------
// DRAW CONTROLLER
// -------------------------

void drawQuestionsScreen() {
  if (quizState == QUIZ_START) {
    drawQuizStart();
  } else if (quizState == QUIZ_PLAYING) {
    drawQuizPlaying();
  } else {
    drawQuizFinished();
  }
  backButton.display();
}

// -------------------------
// START
// -------------------------

void drawQuizStart() {
  background(currentTheme.background);

  fill(currentTheme.text);
  textAlign(CENTER);

  textFont(fontQuizTitle);
  textSize(44);
  text("QUIZ DE ENERGIA EL\u00c9TRICA", width / 2, height * 0.22);

  textFont(fontQuizBody);
  textSize(24);
  text("5 f\u00e1ceis \u2022 3 m\u00e9dias \u2022 2 dif\u00edceis", width / 2, height * 0.30);

  textSize(22);
  text(
    "Teste seus conhecimentos sobre energia el\u00e9trica.\n\n"
    + "Anote suas respostas em um papel se quiser conferir com o gabarito ao final.",
    width * 0.20, height * 0.42, width * 0.60, height * 0.20
  );

  startQuizButton.display();
}

// -------------------------
// PLAYING
// -------------------------

void drawQuizPlaying() {
  background(currentTheme.background);

  // Header
  noStroke();
  fill(currentTheme.panel);
  rect(0, 0, width, 110);

  fill(255); // sempre branco sobre o panel vinho
  textFont(fontQuizTitle);
  textSize(44);
  textAlign(LEFT, CENTER);
  text("QUEST\u00d5ES", 60, 55);

  textFont(fontQuizBody);
  textSize(22);
  textAlign(RIGHT, CENTER);

  String difficulty;
  if      (currentQuestion <= 4) difficulty = "Dificuldade: F\u00e1cil";
  else if (currentQuestion <= 7) difficulty = "Dificuldade: M\u00e9dia";
  else                           difficulty = "Dificuldade: Dif\u00edcil";
  text(difficulty, width - 220, 55);

  // Contador
  fill(currentTheme.text);
  textAlign(LEFT);
  textSize(24);
  text("Quest\u00e3o " + (currentQuestion + 1) + " de " + questions.length, width * 0.15, height * 0.20);

  // Caixa da pergunta
  float boxX = width * 0.15;
  float boxY = height * 0.25;
  float boxW = width * 0.70;
  float boxH = height * 0.16;

  fill(currentTheme.panel);
  noStroke();
  rect(boxX, boxY, boxW, boxH, 20);

  fill(255); // sempre branco sobre o panel vinho
  textFont(fontQuizBody);
  textSize(22);
  textAlign(LEFT, TOP);
  text(questions[currentQuestion].statement, boxX + 30, boxY + 25, boxW - 60, boxH - 40);

  // Alternativas ou questão de bandeiras
  if (currentQuestion == 6) {
    drawFlagQuestion();
  } else {
    drawAlternatives();
  }

  // Pontuação
  fill(currentTheme.text);
  textAlign(CENTER);
  textSize(22);
  text("Pontua\u00e7\u00e3o: " + score, width / 2, height * 0.93);
}

void drawAlternatives() {
  float altX = width * 0.20;
  float altY = height * 0.48;
  float altW = width * 0.60;
  float altH = 65;
  float gap  = 85;

  for (int i = 0; i < questions[currentQuestion].alternatives.length; i++) {
    boolean hover = mouseOver(altX, altY + i * gap, altW, altH);
    fill(hover ? currentTheme.primaryButtonHover : currentTheme.panel);
    noStroke();
    rect(altX, altY + i * gap, altW, altH, 15);

    fill(255); // sempre branco sobre o panel vinho
    textAlign(LEFT, CENTER);
    textFont(fontQuizBody);
    textSize(20);
    text(questions[currentQuestion].alternatives[i], altX + 20, altY + i * gap + altH / 2);
  }
}

void drawFlagQuestion() {
  float flagX  = width * 0.18;
  float descX  = width * 0.57;
  float startY = height * 0.50;
  float colW   = width * 0.24;
  float colH   = 60;
  float gap    = 85;

  textFont(fontQuizBody);
  textSize(22);
  fill(currentTheme.text);
  textAlign(CENTER);
  text("BANDEIRAS",  flagX + colW / 2, startY - 35);
  text("DESCRI\u00c7\u00d5ES", descX + colW / 2, startY - 35);

  for (int i = 0; i < flagNames.length; i++) {
    // Caixa de bandeira
    fill(selectedFlag == i ? currentTheme.primaryButtonHover : currentTheme.panel);
    stroke(150);
    strokeWeight(1);
    rect(flagX, startY + i * gap, colW, colH, 15);
    fill(currentTheme.text);
    textAlign(CENTER, CENTER);
    text(flagNames[i], flagX + colW / 2, startY + i * gap + colH / 2);

    // Caixa de descrição
    fill(currentTheme.panel);
    rect(descX, startY + i * gap, colW, colH, 15);
    fill(currentTheme.text);
    text(flagDescriptions[i], descX + colW / 2, startY + i * gap + colH / 2);

    // Linha de conexão
    if (playerFlagAnswers[i] != -1) {
      stroke(currentTheme.text);
      strokeWeight(3);
      line(
        flagX + colW, startY + i * gap + colH / 2,
        descX,        startY + playerFlagAnswers[i] * gap + colH / 2
      );
      strokeWeight(1);
    }
  }
}

// -------------------------
// FINISHED
// -------------------------

void drawQuizFinished() {
  if (darkMode) background(40, 70, 40);
  else          background(220, 255, 220);

  drawConfetti();

  fill(currentTheme.theoryText);
  textAlign(CENTER);

  textFont(fontQuizTitle);
  textSize(48);
  text("QUIZ FINALIZADO!", width / 2, height * 0.25);

  textSize(34);
  text("Pontua\u00e7\u00e3o: " + score + " / " + questions.length, width / 2, height * 0.40);

  drawPieChart(width / 2, height * 0.58, 220);

  viewAnswersButton.relY = height * 0.76;
  viewAnswersButton.display();
}

void drawConfetti() {
  noStroke();
  for (int i = 0; i < confettiX.length; i++) {
    fill(confettiCol[i]);
    rect(confettiX[i], confettiY[i], 12, 12);
    confettiY[i] += confettiVel[i];
    if (confettiY[i] > height) {
      confettiY[i] = random(-200, -50);
      confettiX[i] = random(width);
    }
  }
}

void drawPieChart(float x, float y, float size) {
  float hits     = score;
  float misses   = questions.length - score;
  float total    = hits + misses;
  float hitAngle = TWO_PI * (hits / total);

  noStroke();
  fill(80, 220, 120);
  arc(x, y, size, size, 0, hitAngle, PIE);

  fill(220, 80, 80);
  arc(x, y, size, size, hitAngle, TWO_PI, PIE);

  fill(80, 220, 120);
  rectMode(CORNER);
  rect(x + size / 2 + 40, y - 20, 25, 25);

  fill(currentTheme.theoryText);
  textAlign(LEFT, CENTER);
  textSize(22);
  text("Acertos: " + score,                        x + size / 2 + 80, y - 7);

  fill(220, 80, 80);
  rect(x + size / 2 + 40, y + 30, 25, 25);

  fill(currentTheme.theoryText);
  text("Erros: " + (questions.length - score),     x + size / 2 + 80, y + 43);
}

// -------------------------
// INPUT
// -------------------------

void handleQuestionsClick() {
  if (quizState == QUIZ_START) {
    if (startQuizButton.isMouseOver()) startQuiz();
    return;
  }

  if (quizState == QUIZ_PLAYING) {
    handlePlayingClick();
    return;
  }

  // QUIZ_FINISHED
  if (viewAnswersButton.isMouseOver()) {
    resetAnswers();
    currentScreen = ANSWERS_SCREEN;
  }
}

void startQuiz() {
  currentQuestion = 0;
  score           = 0;
  quizState       = QUIZ_PLAYING;
  resetFlagQuestion();
  for (int i = 0; i < selectedAnswers.length; i++) selectedAnswers[i] = -1;
}

void handlePlayingClick() {
  if (currentQuestion == 6) {
    handleFlagQuestionClick();
    return;
  }

  float altX = width * 0.20;
  float altY = height * 0.48;
  float altW = width * 0.60;
  float altH = 65;
  float gap  = 85;

  for (int i = 0; i < questions[currentQuestion].alternatives.length; i++) {
    if (mouseOver(altX, altY + i * gap, altW, altH)) {
      checkAnswer(i);
      return;
    }
  }
}

void checkAnswer(int playerAnswer) {
  selectedAnswers[currentQuestion] = playerAnswer;
  if (playerAnswer == questions[currentQuestion].correctAnswer) score++;
  advanceQuestion();
}

void advanceQuestion() {
  if (currentQuestion < questions.length - 1) currentQuestion++;
  else                                          quizState = QUIZ_FINISHED;
}

void handleFlagQuestionClick() {
  float flagX  = width * 0.18;
  float descX  = width * 0.57;
  float startY = height * 0.50;
  float colW   = width * 0.24;
  float colH   = 60;
  float gap    = 85;

  for (int i = 0; i < flagNames.length; i++) {
    if (mouseOver(flagX, startY + i * gap, colW, colH)) {
      selectedFlag = i;
      return;
    }
  }

  for (int i = 0; i < flagDescriptions.length; i++) {
    if (mouseOver(descX, startY + i * gap, colW, colH)) {
      if (selectedFlag != -1) {
        playerFlagAnswers[selectedFlag] = i;
        selectedFlag = -1;
      }
    }
  }

  if (allFlagsAnswered()) {
    if (flagsCorrect()) score++;
    selectedAnswers[currentQuestion] = 0;
    advanceQuestion();
  }
}

boolean allFlagsAnswered() {
  for (int i = 0; i < playerFlagAnswers.length; i++) {
    if (playerFlagAnswers[i] == -1) return false;
  }
  return true;
}

boolean flagsCorrect() {
  for (int i = 0; i < flagCorrectAnswers.length; i++) {
    if (playerFlagAnswers[i] != flagCorrectAnswers[i]) return false;
  }
  return true;
}

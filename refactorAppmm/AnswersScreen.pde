// =========================================================
// ANSWERS SCREEN
// =========================================================

// -------------------------
// STATE
// -------------------------

int answerPage = 0;

PFont fontAnswerTitle;
PFont fontAnswerBody;

// Imagens auxiliares
PImage seloProcelImg;
PImage kwImg;
PImage ledImg;
PImage bandeirasImg;

// Botões
Button answerPrevButton;
Button answerNextButton;
Button answerRetryButton;

// -------------------------
// SETUP
// -------------------------

void setupAnswersScreen() {

  fontAnswerTitle = createFont("Times New Roman", 40);
  fontAnswerBody  = createFont("Verdana", 18);

  answerPrevButton  = new Button(
    25, 0, 175, 75,
    "Voltar", -1,
    currentTheme.primaryButton,
    currentTheme.primaryButtonHover,
    color(255),
    false
  );

  answerNextButton  = new Button(
    0, 0, 175, 75,
    "Continuar", -1,
    currentTheme.primaryButton,
    currentTheme.primaryButtonHover,
    color(255),
    false
  );

  answerRetryButton = new Button(
    0, 0, 195, 75,
    "Refazer quiz", -1,
    currentTheme.secondaryButton,
    currentTheme.secondaryButtonHover,
    color(255),
    false
  );

  // Carrega imagens
  seloProcelImg = loadImage("Selo Procel.png");
  kwImg         = loadImage("kW para kWh.png");
  ledImg        = loadImage("LED x Incandescente.png");
  bandeirasImg  = loadImage("bandeiras tarifarias.jpg");
}

void resetAnswers() {
  answerPage = 0;
}

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
// IMAGENS DAS RESPOSTAS
// -------------------------

void drawAnswerImage(int index) {

  switch(index) {

  case 2: // selo procel

    if (seloProcelImg != null)
      image(
        seloProcelImg,
        width - 550,
        80,
        470,
        320
      );
    break;

  case 3: // kW -> kWh

    if (kwImg != null)
      image(
        kwImg,
        width - 620,
        50,
        540,
        380
      );
    break;

  case 4: // LED x Incandescente

    if (ledImg != null)
      image(
        ledImg,
        width - 620,
        50,
        540,
        380
      );
    break;

  case 6: // bandeiras

    if (bandeirasImg != null)
      image(
        bandeirasImg,
        width - 550,
        80,
        470,
        320
      );
    break;
  }
}

// -------------------------
// ANSWER PAGE
// -------------------------

void drawAnswerPage(int index) {

  Question q = questions[index];

  drawAnswerImage(index);

  fill(currentTheme.answersText);
  textAlign(LEFT);

  textFont(fontAnswerTitle);
  textSize(40);

  text("GABARITO QUESTÃO " + (index + 1) + ":", 50, 70);

  float statementWidth;

  if (index == 2 || index == 3 || index == 4 || index == 6) {
    statementWidth = width - 620;
  } else {
    statementWidth = width - 140;
  }

  textFont(fontAnswerBody);
  textSize(24);
  textLeading(31);

  text(
    "'" + q.statement + "'",
    50,
    120,
    statementWidth,
    110
  );

  // Resposta correta
  textSize(25);
  fill(answerLabelColor(index));

  text(
    "Resposta: " + q.answerLabel,
    50,
    245,
    width - 120,
    50
  );

  // Sua resposta
  if(index != 6){

  fill(currentTheme.answersText);
  textSize(22);

  String playerAnswer = "Não respondida";

  if (q.alternatives != null &&
      selectedAnswers[index] >= 0 &&
      selectedAnswers[index] < q.alternatives.length) {

    playerAnswer =
      q.alternatives[selectedAnswers[index]];
  }

  text(
    "Sua resposta: " + playerAnswer,
    50,
    290,
    width - 120,
    60
  );
}


  float explY;

  if (index == 6) {
    explY = 450;
  } else {
    explY = 400;
  }

  fill(currentTheme.answersText);

  textSize(19);
  textLeading(25);

  text(
    "Explicação:\n\n" + q.explanation,
    50,
    explY,
    width - 120,
    height - explY - 130
  );

  // Labels dos botões
  String prevLabel =
    (answerPage == 0)
    ? "Pontuação"
    : "Voltar";

  String nextLabel =
    (answerPage == questions.length - 1)
    ? "Pratique mais"
    : "Continuar";

  answerPrevButton.label = prevLabel;
  answerNextButton.label = nextLabel;

  // Botão Pontuação em verde
  if (answerPage == 0) {

    answerPrevButton.baseColor =
      color(0, 170, 0);

    answerPrevButton.hoverColor =
      color(0, 210, 0);

  } else {

    answerPrevButton.baseColor =
      currentTheme.primaryButton;

    answerPrevButton.hoverColor =
      currentTheme.primaryButtonHover;
  }

  // Botão Pratique Mais em laranja
  if (answerPage == questions.length - 1) {

    answerNextButton.baseColor =
      color(255, 140, 0);

    answerNextButton.hoverColor =
      color(255, 175, 0);

  } else {

    answerNextButton.baseColor =
      currentTheme.primaryButton;

    answerNextButton.hoverColor =
      currentTheme.primaryButtonHover;
  }

  answerPrevButton.display();
  answerNextButton.display();
}

color answerLabelColor(int index) {

  if (index >= 5)
    return color(40, 110, 230);

  if (selectedAnswers[index] ==
      questions[index].correctAnswer)
    return color(0, 155, 0);

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
    "Resolva as listas de exercício online abaixo e aprimore ainda mais\n" +
    "seu conhecimento sobre o consumo de energia elétrica.",
    50,
    120,
    width - 120,
    100
  );

  for (int i = 0; i < practiceLabels.length; i++) {

    drawPracticeLink(
      50,
      220 + i * 100,
      practiceLinkWidths[i],
      44,
      practiceLabels[i]
    );
  }

  textSize(22);

  fill(currentTheme.answersText);

  textAlign(LEFT, CENTER);

  text(
    "(Dica: utilize uma IA de sua preferência para corrigir suas respostas.)",
    530,
    342,
    width - 580,
    90
  );

  answerPrevButton.label = "Voltar";

  answerPrevButton.display();
  answerRetryButton.baseColor =
  color(255,140,0);
  answerRetryButton.hoverColor =
  color(255,180,0);
  answerRetryButton.display();
  
}

void drawPracticeLink(
  float x,
  float y,
  float w,
  float h,
  String label
) {

  boolean hover = mouseOver(x, y, w, h);

  fill(
    hover
    ? currentTheme.primaryButtonHover
    : currentTheme.primaryButton
  );

  noStroke();

  rect(x, y, w, h, 20);

  fill(255);

  textFont(fontAnswerBody);
  textSize(18);

  textAlign(LEFT, CENTER);

  text(
    label,
    x + 18,
    y + h / 2
  );
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

  if (answerNextButton.isMouseOver()) {

    if (answerPage < questions.length - 1)
      answerPage++;
    else
      answerPage = questions.length;

    return;
  }

  if (answerPrevButton.isMouseOver()) {

    if (answerPage == 0) {

      quizState = QUIZ_FINISHED;
      currentScreen = QUESTIONS_SCREEN;

    } else {

      answerPage--;
    }
  }
}

void handlePracticeMoreClick() {

  for (int i = 0; i < practiceLabels.length; i++) {

    if (mouseOver(
      50,
      220 + i * 100,
      practiceLinkWidths[i],
      44
      )) {

      link(practiceUrls[i]);
      return;
    }
  }

  if (answerPrevButton.isMouseOver()) {

    answerPage = questions.length - 1;
    return;
  }

  if (answerRetryButton.isMouseOver()) {

    resetQuestions();
    currentScreen = QUESTIONS_SCREEN;
  }
}

// =========================================================
// REVIEW SCREEN — FLASHCARDS COM FLIP 3D FAKE
// Sem ControlP5. Tudo em Processing nativo.
// =========================================================

// -------------------------
// LAYOUT
// -------------------------

final int CARD_COLS = 3;
final int CARD_ROWS = 3;
final int CARD_W    = 210;
final int CARD_H    = 130;

int[] cardX = new int[9];
int[] cardY = new int[9];

// -------------------------
// ESTADO DO FLIP
// -------------------------

float[]   flipTarget = new float[9];   // 0.0 = pergunta, 1.0 = resposta
float[]   flipAnim   = new float[9];   // valor animado via lerp
boolean[] cardFlipped = new boolean[9];

PFont fontReviewTitle;
PFont fontReviewCard;
PFont fontReviewSmall;
PFont fontReviewSide;

// -------------------------
// SETUP
// -------------------------

void setupReviewScreen() {
  fontReviewTitle = createFont("Times New Roman", 42);
  fontReviewCard  = createFont("Verdana", 13);
  fontReviewSmall = createFont("Verdana", 17);
  fontReviewSide  = createFont("Verdana", 13);

  int spacingX = 30;
  int spacingY = 40;
  int gridW    = CARD_COLS * CARD_W + (CARD_COLS - 1) * spacingX;
  int gridH    = CARD_ROWS * CARD_H + (CARD_ROWS - 1) * spacingY;
  int startX   = width  / 2 - gridW / 2;
  int startY   = height / 2 - gridH / 2 + 20;

  for (int i = 0; i < 9; i++) {
    int col   = i % CARD_COLS;
    int row   = i / CARD_COLS;
    cardX[i]  = startX + col * (CARD_W + spacingX);
    cardY[i]  = startY + row * (CARD_H + spacingY);
    flipTarget[i] = 0.0;
    flipAnim[i]   = 0.0;
    cardFlipped[i] = false;
  }
}

// -------------------------
// DRAW
// -------------------------

void drawReviewScreen() {
  background(currentTheme.reviewBackground);

  // Título
  fill(darkMode ? currentTheme.reviewText : color(255));
  textAlign(CENTER, CENTER);
  textFont(fontReviewTitle);
  textSize(42);
  text("REVIS\u00c3O", width / 2.0, height * 0.08);

  // Subtítulo
  textFont(fontReviewSmall);
  textSize(17);
  fill(darkMode ? currentTheme.reviewText : color(255));
  text("Clique em um card para revelar a resposta", width / 2.0, height * 0.14);

  // Painéis laterais
  drawReviewSideLeft();
  drawReviewSideRight();

  // Cards
  for (int i = 0; i < 9; i++) {
    flipAnim[i] = lerp(flipAnim[i], flipTarget[i], 0.12);
    drawFlashcard(i);
  }

  // Mensagem motivacional
  drawReviewMotivation();

  backButton.display();
}

// -------------------------
// CARD
// -------------------------

void drawFlashcard(int i) {
  float cx = cardX[i] + CARD_W / 2.0;
  float cy = cardY[i] + CARD_H / 2.0;
  boolean hover = mouseOver(cardX[i], cardY[i], CARD_W, CARD_H);
  float t = flipAnim[i];

  float scaleX;
  String texto;
  color corFundo, corTexto, corBorda;

  color respostaFundo      = darkMode ? color(40, 100, 55)  : color(120, 200, 140);
  color respostaFundoHover = darkMode ? color(50, 130, 70)  : color(90, 180, 115);
  color respostaBorda      = darkMode ? color(70, 180, 90)  : color(80, 170, 100);
  color respostaTexto      = darkMode ? color(255)          : color(0);

  if (t < 0.5) {
    scaleX   = 1.0 - t * 2.0;
    texto    = reviewQuestions[i];
    corFundo = hover ? currentTheme.reviewCardHover : currentTheme.reviewCard;
    corTexto = currentTheme.reviewText;
    corBorda = currentTheme.reviewText;
  } else {
    scaleX   = (t - 0.5) * 2.0;
    texto    = reviewAnswers[i];
    corFundo = hover ? respostaFundoHover : respostaFundo;
    corTexto = respostaTexto;
    corBorda = respostaBorda;
  }

  // Sombra
  noStroke();
  for (int s = 6; s >= 1; s--) {
    float alpha = map(s, 1, 6, 50, 5);
    fill(0, alpha);
    rect(cardX[i] + s * 1.2, cardY[i] + s * 1.2, CARD_W, CARD_H, 10 + s);
  }

  // Corpo com flip
  pushMatrix();
  translate(cx, cy);
  scale(scaleX, 1.0);
  translate(-cx, -cy);

  noStroke();
  fill(corFundo);
  rect(cardX[i], cardY[i], CARD_W, CARD_H, 10);

  noFill();
  stroke(corBorda);
  strokeWeight(1.8);
  rect(cardX[i], cardY[i], CARD_W, CARD_H, 10);

  if (abs(scaleX) > 0.08) {
    textFont(fontReviewCard);
    textSize(13);
    textAlign(CENTER, CENTER);
    fill(corTexto);
    noStroke();
    text(texto, cardX[i] + 12, cardY[i] + 12, CARD_W - 24, CARD_H - 24);
  }

  popMatrix();

  // Ícone hover
  if (hover) {
    fill(corTexto);
    noStroke();
    textSize(14);
    textAlign(RIGHT, BOTTOM);
    text("\u21ba", cardX[i] + CARD_W - 6, cardY[i] + CARD_H - 4);
  }
}

// -------------------------
// PAINEL ESQUERDO — legenda
// -------------------------

void drawReviewSideLeft() {
  float centroY  = (cardY[0] + cardY[6] + CARD_H) / 2.0;
  float painelX  = cardX[0] / 2.0;
  float painelW  = 120;
  float painelH  = 140;
  float px = painelX - painelW / 2.0;
  float py = centroY  - painelH / 2.0;

  noStroke();
  fill(currentTheme.reviewCard);
  rect(px, py, painelW, painelH, 10);
  noFill();
  stroke(currentTheme.reviewText, 40);
  strokeWeight(1.8);
  rect(px, py, painelW, painelH, 10);

  textFont(fontReviewSide);
  textSize(12);
  textAlign(CENTER, TOP);
  fill(currentTheme.reviewText);
  noStroke();
  text("LEGENDA", painelX, py + 10);

  stroke(currentTheme.reviewText, 30);
  strokeWeight(1);
  line(px + 10, py + 27, px + painelW - 10, py + 27);
  noStroke();

  // Pergunta
  fill(currentTheme.reviewCard);
  stroke(currentTheme.reviewText, 80);
  strokeWeight(1);
  rect(px + 12, py + 38, 18, 12, 3);
  noStroke();
  fill(currentTheme.reviewText);
  textSize(11);
  textAlign(LEFT, CENTER);
  text("Pergunta", px + 37, py + 44);

  // Resposta
  color rEx = darkMode ? color(40, 100, 55) : color(120, 200, 140);
  fill(rEx);
  stroke(darkMode ? color(70, 180, 90) : color(80, 170, 100));
  strokeWeight(1);
  rect(px + 12, py + 64, 18, 12, 3);
  noStroke();
  fill(currentTheme.reviewText);
  text("Resposta", px + 37, py + 70);

  // Hover
  fill(currentTheme.reviewCardHover);
  stroke(currentTheme.reviewText, 80);
  strokeWeight(1);
  rect(px + 12, py + 90, 18, 12, 3);
  noStroke();
  fill(currentTheme.reviewText);
  text("Hover", px + 37, py + 96);

  textSize(10);
  fill(currentTheme.reviewText, 110);
  textAlign(CENTER, BOTTOM);
  text("cor = estado", painelX, py + painelH - 8);
}

// -------------------------
// PAINEL DIREITO — progresso
// -------------------------

void drawReviewSideRight() {
  float centroY        = (cardY[0] + cardY[6] + CARD_H) / 2.0;
  float ultimaDireita  = cardX[2] + CARD_W;
  float painelX        = ultimaDireita + (width - ultimaDireita) / 2.0;
  float painelW        = 120;
  float painelH        = 140;
  float px = painelX - painelW / 2.0;
  float py = centroY  - painelH / 2.0;

  int virados = 0;
  for (int i = 0; i < 9; i++) if (cardFlipped[i]) virados++;
  float pct = virados / 9.0;

  noStroke();
  fill(currentTheme.reviewCard);
  rect(px, py, painelW, painelH, 10);
  noFill();
  stroke(currentTheme.reviewText, 40);
  strokeWeight(1.8);
  rect(px, py, painelW, painelH, 10);

  textFont(fontReviewSide);
  textSize(12);
  textAlign(CENTER, TOP);
  fill(currentTheme.reviewText);
  noStroke();
  text("PROGRESSO", painelX, py + 10);

  stroke(currentTheme.reviewText, 30);
  strokeWeight(1);
  line(px + 10, py + 27, px + painelW - 10, py + 27);
  noStroke();

  textFont(fontReviewTitle);
  textSize(36);
  textAlign(CENTER, CENTER);
  fill(currentTheme.reviewText);
  text(virados + "/9", painelX, py + 68);

  float barX = px + 12;
  float barY = py + 100;
  float barW = painelW - 24;
  float barH = 10;
  fill(currentTheme.reviewText, 30);
  rect(barX, barY, barW, barH, 5);
  color barCor = darkMode ? color(70, 180, 90) : color(80, 170, 100);
  fill(barCor);
  rect(barX, barY, barW * pct, barH, 5);

  textFont(fontReviewSide);
  textSize(10);
  fill(currentTheme.reviewText, 110);
  textAlign(CENTER, BOTTOM);
  text("cards virados", painelX, py + painelH - 8);
}

// -------------------------
// MENSAGEM MOTIVACIONAL
// -------------------------

void drawReviewMotivation() {
  int virados = 0;
  for (int i = 0; i < 9; i++) if (cardFlipped[i]) virados++;

  String msg;
  color corMsg;

  if (virados == 0) {
    msg    = "Vire os cards para come\u00e7ar a revis\u00e3o!";
    corMsg = darkMode ? color(red(currentTheme.reviewText), green(currentTheme.reviewText), blue(currentTheme.reviewText), 160) : color(255, 200);
  } else if (virados <= 3) {
    msg    = "Bom come\u00e7o! Continue assim!";
    corMsg = darkMode ? color(100, 180, 255) : color(40, 100, 200);
  } else if (virados <= 5) {
    msg    = "Voc\u00ea est\u00e1 indo muito bem!";
    corMsg = darkMode ? color(120, 210, 120) : color(30, 140, 60);
  } else if (virados <= 8) {
    msg    = "Quase l\u00e1, n\u00e3o para agora!";
    corMsg = darkMode ? color(255, 190, 80) : color(180, 110, 0);
  } else {
    msg    = "Parab\u00e9ns! Revis\u00e3o completa!";
    corMsg = darkMode ? color(100, 230, 120) : color(20, 150, 50);
  }

  float msgY = cardY[6] + CARD_H + (height - (cardY[6] + CARD_H)) * 0.45;
  textFont(fontReviewSmall);
  textSize(17);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(corMsg);
  text(msg, width / 2.0, msgY);
}

// -------------------------
// INPUT
// -------------------------

void handleReviewClick() {
  for (int i = 0; i < 9; i++) {
    if (mouseOver(cardX[i], cardY[i], CARD_W, CARD_H)) {
      if (abs(flipAnim[i] - flipTarget[i]) < 0.05) {
        cardFlipped[i]  = !cardFlipped[i];
        flipTarget[i]   = cardFlipped[i] ? 1.0 : 0.0;
      }
      return;
    }
  }
}

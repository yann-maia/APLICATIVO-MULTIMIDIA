// =========================================================
// REVIEW SCREEN — FLASHCARDS
// Hover revela a resposta. Sem cp5 — tudo em Processing nativo.
// =========================================================

// -------------------------
// LAYOUT
// -------------------------

final int CARD_COLS = 3;
final int CARD_ROWS = 3;
final int CARD_W    = 260;
final int CARD_H    = 140;

int[] cardX = new int[9];
int[] cardY = new int[9];

PFont fontReviewTitle;
PFont fontReviewCard;

// -------------------------
// SETUP
// -------------------------

void setupReviewScreen() {
  fontReviewTitle = createFont("Times New Roman", 42);
  fontReviewCard  = createFont("Verdana", 15);

  layoutCards();
}

void layoutCards() {
  int spacingX = 30;
  int spacingY = 40;
  int gridW    = CARD_COLS * CARD_W + (CARD_COLS - 1) * spacingX;
  int gridH    = CARD_ROWS * CARD_H + (CARD_ROWS - 1) * spacingY;
  int startX   = width  / 2 - gridW / 2;
  int startY   = height / 2 - gridH / 2 + 30;

  for (int i = 0; i < reviewQuestions.length; i++) {
    int col  = i % CARD_COLS;
    int row  = i / CARD_COLS;
    cardX[i] = startX + col * (CARD_W + spacingX);
    cardY[i] = startY + row * (CARD_H + spacingY);
  }
}

// -------------------------
// DRAW
// -------------------------

void drawReviewScreen() {
  background(currentTheme.reviewBackground);

  // Título
  fill(currentTheme.reviewText);
  textAlign(CENTER, CENTER);
  textFont(fontReviewTitle);
  textSize(42);
  text("REVIS\u00c3O", width / 2, height * 0.07);

  // Instrução
  textFont(fontReviewCard);
  textSize(16);
  fill(currentTheme.reviewText);
  text("Passe o mouse sobre o card para ver a resposta", width / 2, height * 0.13);

  // Cards
  for (int i = 0; i < reviewQuestions.length; i++) {
    drawFlashcard(i);
  }

  backButton.display();
}

void drawFlashcard(int i) {
  boolean hover = mouseOver(cardX[i], cardY[i], CARD_W, CARD_H);

  fill(hover ? currentTheme.reviewCardHover : currentTheme.reviewCard);
  stroke(150);
  strokeWeight(1.5);
  rect(cardX[i], cardY[i], CARD_W, CARD_H, 10);

  fill(currentTheme.theoryText);
  textAlign(LEFT, TOP);
  textFont(fontReviewCard);
  textSize(14);
  textLeading(20);

  String content = hover ? reviewAnswers[i] : reviewQuestions[i];
  text(content, cardX[i] + 12, cardY[i] + 12, CARD_W - 24, CARD_H - 24);
}

// -------------------------
// INPUT
// -------------------------

void handleReviewClick() {
  // Nenhuma ação de clique necessária (hover é suficiente)
}

// =========================================================
// THEORY SCREEN
// Livro com animação de virar página.
// 4 viradas, cada uma com lado esquerdo e direito.
// =========================================================

// -------------------------
// LAYOUT CONSTANTS
// =========================================================

final int THEORY_PAGE_COUNT = 4;

// Margem interna da página
final int PAGE_MARGIN_X = 65;
final int PAGE_MARGIN_Y = 55;

// -------------------------
// STATE
// -------------------------

int     theoryCurrentPage   = 0;
float   theoryFlipProgress  = 0;
boolean theoryIsFlipping    = false;
int     theoryFlipDirection = 1;

// -------------------------
// LAYOUT
// -------------------------

int bookW, bookH, bookX, bookY;

Button theoryPrevButton;
Button theoryNextButton;

PFont fontTheoryTitle;
PFont fontTheorySubtitle;
PFont fontTheoryBody;

// -------------------------
// SETUP
// -------------------------

void setupTheoryScreen() {
  fontTheoryTitle    = createFont("Times New Roman", 38);
  fontTheorySubtitle = createFont("Times New Roman", 22);
  fontTheoryBody     = createFont("Verdana", 15);

  bookW = 1250;
  bookH = 730;
  bookX = width  / 2 - bookW / 2;
  bookY = height / 2 - bookH / 2;

  // Mesmo tamanho do botão de menu (0.06 × 0.06 da tela)
  int btnW = (int)(width  * 0.06);
  int btnH = (int)(height * 0.06);

  // Margem interna da página: bookY + bookH - 45 é a borda inferior da página
  // Botões colados nesse limite, como o botão Menu fica no limite da tela
  int pageBottom = bookY + bookH - 45;
  int btnY       = pageBottom - btnH - 8;

  // Colados nas bordas esquerda e direita da página interna (bookX + 45)
  int prevBtnX = bookX + 45 + 8;
  int nextBtnX = bookX + bookW - 45 - btnW - 8;

  theoryPrevButton = new Button(
    prevBtnX, btnY, btnW, btnH,
    "Anterior", -1,
    currentTheme.theoryButton, currentTheme.primaryButtonHover,
    color(255), false
  );

  theoryNextButton = new Button(
    nextBtnX, btnY, btnW, btnH,
    "Pr\u00f3xima", -1,
    currentTheme.theoryButton, currentTheme.primaryButtonHover,
    color(255), false
  );
}

void updateTheoryButtons() {
  if (theoryPrevButton == null) return;
  theoryPrevButton.baseColor  = currentTheme.theoryButton;
  theoryPrevButton.hoverColor = currentTheme.primaryButtonHover;
  theoryNextButton.baseColor  = currentTheme.theoryButton;
  theoryNextButton.hoverColor = currentTheme.primaryButtonHover;
}

// -------------------------
// DRAW
// -------------------------

void drawTheoryScreen() {
  background(currentTheme.theoryBackground);

  drawBook();
  drawBookPage();
  drawFlipAnimation();

  if (theoryCurrentPage > 0)                     theoryPrevButton.display();
  if (theoryCurrentPage < THEORY_PAGE_COUNT - 1) theoryNextButton.display();
  backButton.display();
}

void drawBook() {
  // Sombra
  fill(0, 45);
  noStroke();
  rect(bookX + 22, bookY + 22, bookW, bookH, 30);

  // Capa
  fill(currentTheme.theoryBook);
  rect(bookX, bookY, bookW, bookH, 30);

  // Detalhes dourados
  stroke(180, 140, 70);
  strokeWeight(4);
  line(bookX + 35,          bookY + 35,          bookX + bookW - 35, bookY + 35);
  line(bookX + 35,          bookY + bookH - 35,  bookX + bookW - 35, bookY + bookH - 35);
  noStroke();

  // Página interna
  fill(currentTheme.theoryPage);
  int pageX = bookX + 45;
  int pageY = bookY + 45;
  int pageW = bookW - 90;
  int pageH = bookH - 90;
  rect(pageX, pageY, pageW, pageH, 14);

  // Linha do meio
  int bookCenterX = bookX + bookW / 2;
  stroke(190, 170, 140);
  strokeWeight(2);
  line(bookCenterX, pageY + 20, bookCenterX, pageY + pageH - 20);
  noStroke();
}

void drawBookPage() {
  int p = theoryCurrentPage;

  // Coordenadas dos dois lados
  int leftX  = bookX + PAGE_MARGIN_X;
  int rightX = bookX + bookW / 2 + PAGE_MARGIN_X / 2;
  int titleY = bookY + PAGE_MARGIN_Y + 55;
  int bodyY  = bookY + PAGE_MARGIN_Y + 100;
  int textW  = bookW / 2 - PAGE_MARGIN_X - 30;
  int textH  = bookH - PAGE_MARGIN_Y - 180;

  // --- TÍTULO (lado esquerdo, grande) ---
  fill(currentTheme.theoryText);
  textAlign(LEFT, BASELINE);
  textFont(fontTheoryTitle);
  textSize(34);
  text(theoryTitles[p], leftX, titleY);

  // Linha separadora sob o título
  stroke(currentTheme.theoryText);
  strokeWeight(1);
  line(leftX, titleY + 10, leftX + textW, titleY + 10);
  noStroke();

  // --- CORPO ESQUERDO ---
  fill(currentTheme.theoryText);
  textFont(fontTheoryBody);
  textSize(15);
  textLeading(22);
  textAlign(LEFT, TOP);
  text(theoryLeft[p], leftX, bodyY, textW, textH);

  // --- NÚMERO DA PÁGINA (centro inferior) ---
  fill(currentTheme.theoryText);
  textAlign(CENTER, BASELINE);
  textFont(fontTheorySubtitle);
  textSize(16);
  text((p + 1) + " / " + THEORY_PAGE_COUNT, bookX + bookW / 2, bookY + bookH - 58);

  // --- CORPO DIREITO ---
  fill(currentTheme.theoryText);
  textFont(fontTheoryBody);
  textSize(15);
  textLeading(22);
  textAlign(LEFT, TOP);
  text(theoryRight[p], rightX, bodyY, textW, textH);
}

void drawFlipAnimation() {
  if (!theoryIsFlipping) return;

  theoryFlipProgress += 0.035;

  int pageX       = bookX + 45;
  int pageY       = bookY + 45;
  int pageW       = bookW - 90;
  int pageH       = bookH - 90;
  int bookCenterX = bookX + bookW / 2;

  float leafW = map(sin(theoryFlipProgress * HALF_PI), 0, 1, 0, pageW / 2);

  noStroke();
  fill(lerpColor(currentTheme.theoryPage, color(230, 220, 200), 0.5));
  rect(bookCenterX - leafW, pageY, leafW, pageH);

  fill(0, 25);
  rect(bookCenterX - leafW, pageY, 10, pageH);

  if (theoryFlipProgress >= 1) {
    theoryFlipProgress = 0;
    theoryIsFlipping   = false;

    theoryCurrentPage += theoryFlipDirection;
    if (theoryCurrentPage >= THEORY_PAGE_COUNT) theoryCurrentPage = 0;
    if (theoryCurrentPage < 0)                  theoryCurrentPage = THEORY_PAGE_COUNT - 1;
  }
}

// -------------------------
// INPUT
// -------------------------

void handleTheoryClick() {
  if (theoryIsFlipping) return;

  if (theoryCurrentPage < THEORY_PAGE_COUNT - 1 && theoryNextButton.isMouseOver()) {
    theoryIsFlipping    = true;
    theoryFlipProgress  = 0;
    theoryFlipDirection = 1;
  }

  if (theoryCurrentPage > 0 && theoryPrevButton.isMouseOver()) {
    theoryIsFlipping    = true;
    theoryFlipProgress  = 0;
    theoryFlipDirection = -1;
  }
}

// =========================================================
// THEORY SCREEN
// Livro com animação de virar página.
// 7 páginas — teoria + passo a passo do exercício.
// Imagens de cálculo exibidas na página direita.
// =========================================================

// -------------------------
// LAYOUT CONSTANTS
// -------------------------

final int THEORY_PAGE_COUNT = 7;

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
// IMAGENS
// Carregadas na pasta data/ do sketch.
// Índices correspondem às páginas (0 a 6).
// Algumas páginas têm duas imagens (A e B) na direita.
// -------------------------

PImage[] theoryImgA = new PImage[THEORY_PAGE_COUNT]; // imagem principal da direita
PImage[] theoryImgB = new PImage[THEORY_PAGE_COUNT]; // imagem secundária (abaixo da principal)
PImage[] theoryImgC = new PImage[THEORY_PAGE_COUNT]; // imagem terciária (para pág com 3 imgs)

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

  int btnW = (int)(width  * 0.06);
  int btnH = (int)(height * 0.06);

  int pageBottom = bookY + bookH - 45;
  int btnY       = pageBottom - btnH - 8;

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

  // -------------------------------------------------------
  // CARREGAMENTO DAS IMAGENS
  // Coloque todos os arquivos na pasta data/ do sketch.
  //
  // Página 0 — Potência Elétrica
  //   Direita: fórmula principal P = E/Δt
  theoryImgA[0] = loadImage("Formula.jpeg");

  // Página 1 — Consumo de Energia
  //   Sem imagens (só texto explicativo)

  // Página 2 — Exercício: Passo 1 (identificar grandezas e aplicar fórmula)
  //   Direita: 500/20 = P  (primeira tentativa antes de converter)
  theoryImgA[2] = loadImage("Calculo 1.jpeg");

  // Página 3 — Exercício: Passo 2 (converter minutos → segundos e recalcular P)
  //   Direita superior: 20 × 60 = 1200 s
  //   Direita inferior: 500/1200 = P  (após conversão)
  theoryImgA[3] = loadImage("Calculo 2-1.jpeg");
  theoryImgB[3] = loadImage("Calculo 2-2.jpeg");

  // Página 4 — Exercício: Passo 3 (calcular consumo mensal em kWh)
  //   Direita superior: 0,42 × 10 × 30 / 1000  (expressão completa)
  //   Direita meio:     0,42 × 10 × 30 / 1000 simplificada (zeros riscados)
  //   Direita inferior: 0,42 × 3 / 10 = kWh    (forma reduzida)
  theoryImgA[4] = loadImage("Calculo 3-1.jpeg");
  theoryImgB[4] = loadImage("Calculo 3-2.jpeg");
  theoryImgC[4] = loadImage("Calculo 3-3.jpeg");

  // Página 5 — Exercício: Passo 4 (calcular custo em R$)
  //   Direita superior: 42/100 × 80/100 = valor gasto
  //   Direita inferior: 3360/10000 ≈ R$ 0,3
  theoryImgA[5] = loadImage("Calculo 4-1.jpeg");
  theoryImgB[5] = loadImage("Calculo 4-2.jpeg");

  // Página 6 — Conta de Luz e Uso Consciente
  //   Sem imagens (texto conclusivo)
  // -------------------------------------------------------
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
  fill(0, 45);
  noStroke();
  rect(bookX + 22, bookY + 22, bookW, bookH, 30);

  fill(currentTheme.theoryBook);
  rect(bookX, bookY, bookW, bookH, 30);

  stroke(180, 140, 70);
  strokeWeight(4);
  line(bookX + 35,         bookY + 35,         bookX + bookW - 35, bookY + 35);
  line(bookX + 35,         bookY + bookH - 35,  bookX + bookW - 35, bookY + bookH - 35);
  noStroke();

  fill(currentTheme.theoryPage);
  int pageX = bookX + 45;
  int pageY = bookY + 45;
  int pageW = bookW - 90;
  int pageH = bookH - 90;
  rect(pageX, pageY, pageW, pageH, 14);

  int bookCenterX = bookX + bookW / 2;
  stroke(190, 170, 140);
  strokeWeight(2);
  line(bookCenterX, pageY + 20, bookCenterX, pageY + pageH - 20);
  noStroke();
}

void drawBookPage() {
  int p = theoryCurrentPage;

  int leftX  = bookX + PAGE_MARGIN_X;
  int rightX = bookX + bookW / 2 + PAGE_MARGIN_X / 2;
  int titleY = bookY + PAGE_MARGIN_Y + 55;
  int bodyY  = bookY + PAGE_MARGIN_Y + 100;
  int textW  = bookW / 2 - PAGE_MARGIN_X - 30;
  int textH  = bookH - PAGE_MARGIN_Y - 180;

  // --- TÍTULO (esquerda) ---
  fill(currentTheme.theoryText);
  textAlign(LEFT, BASELINE);
  textFont(fontTheoryTitle);
  textSize(34);
  text(theoryTitles[p], leftX, titleY);

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

  // --- NÚMERO DA PÁGINA ---
  fill(currentTheme.theoryText);
  textAlign(CENTER, BASELINE);
  textFont(fontTheorySubtitle);
  textSize(16);
  text((p + 1) + " / " + THEORY_PAGE_COUNT, bookX + bookW / 2, bookY + bookH - 58);

  // --- LADO DIREITO: texto ou imagens ---
  drawTheoryRightSide(p, rightX, bodyY, textW, textH);
}

// -------------------------------------------------------
// Desenha o lado direito de cada página.
// Se a página tiver imagens, exibe-as com fundo branco.
// Se não tiver, exibe o texto de theoryRight[].
// -------------------------------------------------------
void drawTheoryRightSide(int p, int rightX, int bodyY, int textW, int textH) {

  // Área disponível na metade direita
  int areaX = rightX;
  int areaY = bodyY;
  int areaW = textW;
  int areaH = textH;

  // ---- Página 0: 1 imagem grande (Formula.jpeg) ----
  if (p == 0 && theoryImgA[0] != null) {
    drawTheoryImage(theoryImgA[0], areaX, areaY, areaW, areaH);
    return;
  }

  // ---- Página 2: 1 imagem (Calculo 1.jpeg) ----
  if (p == 2 && theoryImgA[2] != null) {
    drawTheoryImage(theoryImgA[2], areaX, areaY, areaW, areaH);
    return;
  }

  // ---- Página 3: 2 imagens empilhadas (Calculo 2-1 e 2-2) ----
  if (p == 3 && theoryImgA[3] != null) {
    int gap    = 12;
    int imgH   = (areaH - gap) / 2;
    drawTheoryImage(theoryImgA[3], areaX, areaY,          areaW, imgH);
    drawTheoryImage(theoryImgB[3], areaX, areaY + imgH + gap, areaW, imgH);
    return;
  }

  // ---- Página 4: 3 imagens empilhadas (Calculo 3-1, 3-2, 3-3) ----
  if (p == 4 && theoryImgA[4] != null) {
    int gap  = 8;
    int imgH = (areaH - gap * 2) / 3;
    drawTheoryImage(theoryImgA[4], areaX, areaY,                   areaW, imgH);
    drawTheoryImage(theoryImgB[4], areaX, areaY + imgH + gap,      areaW, imgH);
    drawTheoryImage(theoryImgC[4], areaX, areaY + (imgH + gap) * 2, areaW, imgH);
    return;
  }

  // ---- Página 5: 2 imagens empilhadas (Calculo 4-1 e 4-2) ----
  if (p == 5 && theoryImgA[5] != null) {
    int gap  = 12;
    int imgH = (areaH - gap) / 2;
    drawTheoryImage(theoryImgA[5], areaX, areaY,               areaW, imgH);
    drawTheoryImage(theoryImgB[5], areaX, areaY + imgH + gap,  areaW, imgH);
    return;
  }

  // ---- Páginas sem imagem: exibe texto theoryRight[] ----
  fill(currentTheme.theoryText);
  textFont(fontTheoryBody);
  textSize(15);
  textLeading(22);
  textAlign(LEFT, TOP);
  text(theoryRight[p], areaX, areaY, areaW, areaH);
}

// -------------------------------------------------------
// Desenha uma imagem com fundo branco arredondado.
// A imagem é redimensionada proporcionalmente para caber.
// -------------------------------------------------------
void drawTheoryImage(PImage img, int x, int y, int maxW, int maxH) {
  if (img == null) return;

  int pad = 8;

  // Fundo branco com borda suave
  fill(255, 252, 245);
  stroke(210, 195, 165);
  strokeWeight(1);
  rect(x, y, maxW, maxH, 8);
  noStroke();

  // Calcula tamanho proporcional da imagem dentro da área com padding
  int availW = maxW - pad * 2;
  int availH = maxH - pad * 2;

  float imgRatio = (float) img.width / img.height;
  float boxRatio = (float) availW / availH;

  int drawW, drawH;
  if (imgRatio > boxRatio) {
    drawW = availW;
    drawH = (int)(availW / imgRatio);
  } else {
    drawH = availH;
    drawW = (int)(availH * imgRatio);
  }

  // Centraliza dentro do fundo branco
  int drawX = x + pad + (availW - drawW) / 2;
  int drawY = y + pad + (availH - drawH) / 2;

  image(img, drawX, drawY, drawW, drawH);
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

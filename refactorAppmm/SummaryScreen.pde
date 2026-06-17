// =========================================================
// SUMMARY SCREEN
// =========================================================

PFont fontSummarySection;
PFont fontSummaryItem;
PFont fontSummarySubItem;

// -------------------------
// SETUP
// -------------------------

void setupSummaryScreen() {
  fontSummarySection = createFont("Times New Roman", 22);
  fontSummaryItem    = createFont("Verdana", 16);
  fontSummarySubItem = createFont("Verdana", 14);
}

// -------------------------
// DRAW
// -------------------------

void drawSummaryScreen() {
  summaryScreen.display();
  drawScreenTitle("SUM\u00c1RIO");

  if (fontSummarySection == null) setupSummaryScreen();

  float x       = width * 0.14;
  float startY  = height * 0.19;
  float lineH   = height * 0.048; // espaço por linha
  float col2X   = width * 0.54;   // segunda coluna (Revisão em diante)
  float maxW    = width * 0.36;

  float yLeft  = startY;
  float yRight = startY;
  boolean useRight = false;

  for (int i = 0; i < summaryLines.length; i++) {
    String line = summaryLines[i];
    String type = line.substring(0, 2);
    String content = line.substring(2);

    float currentX = useRight ? col2X : x;
    float currentY = useRight ? yRight : yLeft;

    if (type.equals("S:")) {
      // Título geral — ocupa largura toda, só aparece uma vez no topo
      fill(255);
      textFont(fontSummarySection);
      textSize(20);
      textAlign(LEFT, TOP);
      text(content, x, currentY, width * 0.76, lineH);
      yLeft  += lineH * 1.2;
      yRight  = yLeft;

    } else if (type.equals("I:")) {
      // Seção principal (nome da aba)
      // "Revisão" e "Créditos" vão para coluna direita
      if (content.startsWith("Revis") || content.startsWith("Cr\u00e9d")) {
        useRight = true;
        currentX = col2X;
        currentY = yRight;
      }

      fill(255);
      textFont(fontSummarySection);
      textSize(17);
      textAlign(LEFT, TOP);
      text("\u25B6  " + content, currentX, currentY, maxW, lineH);

      if (useRight) yRight += lineH * 1.1;
      else          yLeft  += lineH * 1.1;

    } else {
      // Subtópico
      fill(220, 220, 220);
      textFont(fontSummarySubItem);
      textSize(13);
      textAlign(LEFT, TOP);
      text("    \u2022  " + content, currentX, currentY, maxW, lineH * 1.1);

      if (useRight) yRight += lineH;
      else          yLeft  += lineH;
    }
  }

  backButton.display();
}

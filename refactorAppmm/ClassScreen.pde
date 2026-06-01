// =========================================================
// SCREEN
// Desenha o fundo de cada tela.
// layoutType controla os painéis laterais:
//   1 = só fundo (menu, créditos)
//   2 = painéis nos dois lados (sumário)
//   3 = painel só no lado esquerdo (teoria, questões, etc.)
// =========================================================

class Screen {

  color mainColor;
  color secondaryColor;
  int   layoutType;

  Screen(color mainColor, color secondaryColor, int layoutType) {
    this.mainColor      = mainColor;
    this.secondaryColor = secondaryColor;
    this.layoutType     = layoutType;
  }

  void display() {
    drawBackground();
    drawSidePanels();
    drawTopBar();
  }

  void drawBackground() {
    noStroke();
    fill(mainColor);
    rect(0, 0, width, height);
  }

  void drawSidePanels() {
    noStroke();
    fill(currentTheme.tertiaryBackground);

    if (layoutType == 2) {
      rect(0,             0, width * 0.10, height);
      rect(width * 0.90, 0, width * 0.10, height);
    }

    if (layoutType == 3) {
      rect(0, 0, width * 0.10, height);
    }
  }

  void drawTopBar() {
    noStroke();
    fill(secondaryColor);
    rect(0, 0, width, height * 0.12);
  }
}

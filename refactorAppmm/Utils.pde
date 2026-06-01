// =========================================================
// UTILS
// Funções auxiliares usadas por múltiplas telas.
// =========================================================

// Verifica se o mouse está sobre uma área retangular (px absolutos)
boolean mouseOver(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w &&
         mouseY > y && mouseY < y + h;
}

// Desenha o título padrão no topo da tela (barra superior)
void drawScreenTitle(String title) {
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("Times New Roman", height * 0.055));
  textSize(height * 0.055);
  text(title, width * 0.5, height * 0.06);
  textFont(createFont("SansSerif", 16));
}

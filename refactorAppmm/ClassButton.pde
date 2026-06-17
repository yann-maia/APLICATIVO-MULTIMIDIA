// =========================================================
// BUTTON
// Todos os botões do app usam esta classe.
// Posição e tamanho são relativos (0.0 a 1.0) ao width/height,
// exceto quando isRelative = false (coordenadas absolutas em px).
// =========================================================

class Button {

  float   relX, relY, relW, relH;
  String  label;
  int     targetScreen;
  color   baseColor;
  color   hoverColor;
  color   textColor;
  boolean isRelative;
  float   borderRadius;

  // Construtor relativo (padrão — posição proporcional à tela)
  Button(
    float relX, float relY,
    float relW, float relH,
    String label,
    int targetScreen,
    color baseColor,
    color hoverColor,
    color textColor
  ) {
    this.relX         = relX;
    this.relY         = relY;
    this.relW         = relW;
    this.relH         = relH;
    this.label        = label;
    this.targetScreen = targetScreen;
    this.baseColor    = baseColor;
    this.hoverColor   = hoverColor;
    this.textColor    = textColor;
    this.isRelative   = true;
    this.borderRadius = 12;
  }

  // Construtor absoluto (posição em pixels — para botões dentro de layouts fixos)
  Button(
    float x, float y,
    float w, float h,
    String label,
    int targetScreen,
    color baseColor,
    color hoverColor,
    color textColor,
    boolean isRelative
  ) {
    this.relX         = x;
    this.relY         = y;
    this.relW         = w;
    this.relH         = h;
    this.label        = label;
    this.targetScreen = targetScreen;
    this.baseColor    = baseColor;
    this.hoverColor   = hoverColor;
    this.textColor    = textColor;
    this.isRelative   = isRelative;
    this.borderRadius = 12;
  }

  float getX() { return isRelative ? relX * width  : relX; }
  float getY() { return isRelative ? relY * height : relY; }
  float getW() { return isRelative ? relW * width  : relW; }
  float getH() { return isRelative ? relH * height : relH; }

  boolean isMouseOver() {
    return mouseOver(getX(), getY(), getW(), getH());
  }

  void display() {
    float x = getX();
    float y = getY();
    float w = getW();
    float h = getH();

    noStroke();
    fill(isMouseOver() ? hoverColor : baseColor);
    rect(x, y, w, h, borderRadius);

    fill(textColor);
    textAlign(CENTER, CENTER);
    textSize(h * 0.32);
    text(label, x + w / 2, y + h / 2);
  }
}

class Button {

  float relX;
  float relY;
  float relW;
  float relH;
  color baseColor;
  color currentColor;
  String text;
  int targetScreen;

  Button(float relX, float relY, float relW, float relH, color baseColor, String text, int targetScreen){

    this.relX = relX;
    this.relY = relY;
    this.relW = relW;
    this.relH = relH;
    this.baseColor = baseColor;
    this.currentColor = baseColor;
    this.text = text;
    this.targetScreen = targetScreen;
  }

  void display(){

    hover();

    float x = relX * width;
    float y = relY * height;
    float w = relW * width;
    float h = relH * height;

    fill(currentColor);
    noStroke();
    rect(x, y, w, h, 5);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(h * 0.35);
    text(
      text,
      x + w/2,
      y + h/2
    );
  }

  void hover(){

    if(isMouseOver()){

      currentColor = color(
        min(red(baseColor) + 30,255),
        min(green(baseColor) + 30,255),
        min(blue(baseColor) + 30,255)
      );

    } else {

      currentColor = baseColor;
    }
  }
  
  boolean isMouseOver(){

    float x = relX * width;
    float y = relY * height;
    float w = relW * width;
    float h = relH * height;

    return mouseOver(x,y,w,h);
  }
}

import controlP5.*;

int tela = 0;

ControlP5 cp5;

void setup() {
  size(800, 800);
cp5 = new ControlP5(this);

//titulo
  cp5.addTextlabel("titulo")
  .setText("Revisão Com Flashcards")
     .setPosition(200, 60)
     .setColorValue(color(0))
     .setFont(createFont("Times New Roman", 40));
     
 //card1
  cp5.addTextarea("card1")
     .setPosition(70, 120)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();

  //card2
 cp5.addTextarea("card2")
   .setPosition(300, 120)
   .setSize(200, 120)
   .setFont(createFont("Verdana", 18))
   .setLineHeight(24)
   .setColor(color(0))
   .setColorBackground(color(255))
   .hideScrollbar();

  //card3
  cp5.addTextarea("card3")
     .setPosition(530, 120)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();
     
  //card4
  cp5.addTextarea("card4")
     .setPosition(70, 300)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();

  //card5
  cp5.addTextarea("card5")
     .setPosition(300, 300)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();

  //card6
 cp5.addTextarea("card6")
   .setPosition(530, 300)
   .setSize(200, 120)
   .setFont(createFont("Verdana", 18))
   .setLineHeight(24)
   .setColor(color(0))
   .setColorBackground(color(255))
   .hideScrollbar();
   
  //card7
  cp5.addTextarea("card7")
     .setPosition(70, 480)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();

  //card8
  cp5.addTextarea("card8")
     .setPosition(300, 480)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();

  //card9
  cp5.addTextarea("card9")
     .setPosition(530, 480)
     .setSize(200, 120)
     .setFont(createFont("Verdana", 18))
     .setLineHeight(24)
     .setColor(color(0))
     .setColorBackground(color(255))
     .hideScrollbar();
     
}

void draw() {
  background(255);

  if (tela == 0) {
    telaIntroducao();
  } else if (tela == 1) {
    telaSumario();
  } else if (tela == 2) {
    telaPrincipal();
  } else if (tela == 3) {
    telaTeoria();
  } else if (tela == 4) {
    telaQuestoes();
  } else if (tela == 5) {
    telaRespostas();
  } else if (tela == 6) {
    telaRevisao();
  } else if (tela == 7) {
    telaCreditos();
  }
  
}

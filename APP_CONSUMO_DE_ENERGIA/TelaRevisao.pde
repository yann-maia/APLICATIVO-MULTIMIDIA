void telaRevisao() {

  background(240);
//titulo
  fill(0);
  textSize(32);
  textAlign(CENTER);

  text("Flashcards de Revisão", 400, 60);
//FAZENDO OS CARDS
//card1
  desenharCard(
    70, 120,
    "pergunta1",
    "resposta1"
  );
//card2
  desenharCard(
    300, 120,
    "pergunta2",
    "resposta2"
  );

  desenharCard(
    530, 120,
    "pergunta3",
    "resposta3"
  );
//card4
  desenharCard(
    70, 300,
    "pergunta4",
    "resposta4"
  );
//card5
  desenharCard(
    300, 300,
    "Pergunta5",
    "resposta5"
  );

//card6

  desenharCard(
    530, 300,
    "pergunta6",
    "resposta6"
  );

//botao pra voltar
  fill(100, 180, 255);
  rect(300, 700, 200, 60, 20);
  fill(0);

  textSize(24);
  text("Voltar", 400, 738);
}
//como os cards funcionam
void desenharCard(
  int x,
  int y,
  String pergunta,
  String resposta
) {

  int largura = 200;
  int altura = 120;

// Verifica mouse em cima
  boolean mouseOver =
    mouseX > x &&
    mouseX < x + largura &&
    mouseY > y &&
    mouseY < y + altura;

//mouseover
  if (mouseOver) {
    fill(180, 255, 180);
    rect(x - 5, y - 5, 210, 130, 20);
  } else {
    fill(255);
    rect(x, y, largura, altura, 20);
  }
//texto
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);

//se mouse estiver em cima
  if (mouseOver) {
    text(
      resposta,
      x + 100,
      y + 60
    );
  } else {
    text(
      pergunta,
      x + 100,
      y + 60
    );
  }
}
//clique
void cliqueRevisao() {

//botao voltar
  if (
    mouseX > 300 &&
    mouseX < 500 &&
    mouseY > 700 &&
    mouseY < 760
  ) {

    tela = 2;
  }
}

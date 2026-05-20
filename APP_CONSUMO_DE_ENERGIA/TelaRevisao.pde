void telaRevisao() {
  background(240);
  
//titulo
  fill(0);
  textAlign(CENTER);
  textSize(40);

  text("Flashcards - Consumo de energia", 400, 60);


//criando os cards

  desenharCard(
    70, 120,
    "Qual é a fórmula da\n potência elétrica?",
    "P = E / t"
  );

  desenharCard(
    300, 120,
    "O que é a potência\n elétrica?",
    "É a quantidade de energia\n que um aparelho consome\n por unidade de tempo"
  );

  desenharCard(
    530, 120,
    "O que significa cada letra\n na fórmula P = E/t ?",
    "P = potência (W)\n E = energia (J)\n t = tempo (s)"
  );

  desenharCard(
    70, 300,
    "Como calcular energia?",
    "E = P x t"
  );

  desenharCard(
    300, 300,
    "Como calcular o tempo?",
    "t = E / P"
  );

  desenharCard(
    530, 300,
    "Qual a diferença entre\n potência e consumo\n de energia?",
    "Consumo é a energia total\n gasta dependendo do\n tempo de uso.\n Potência é o quanto um\n aparelho gasta de\n energia por segundo"
  );
  
  desenharCard(
    530, 480,
    "O que significa kWh?",
    "kWh = energia consumida\nem 1 hora"
  );
  
  desenharCard(
    300, 480,
    "O que influencia no\n consumo de energia?",
    "Potência do aparelho\n e tempo de uso"
  );
  
  desenharCard(
    70, 480,
    "O que significa cada\n parte do kWh?",
    "k = mil\nW = potência elétrica\nh = tempo (hora)"
  );


//botao

 boolean Botao =
  mouseX > 312 &&
  mouseX < 487 &&
  mouseY > 700 &&
  mouseY < 775;

if (Botao) {
  fill(180, 255, 180);
} else {
  fill(100, 180, 255);
}

rect(312, 700, 175, 75, 20);

fill(0);
textAlign(CENTER, CENTER);
textSize(25);
text("Voltar", 400, 737);
}


//dando função pros card
void desenharCard(
  int x,
  int y,
  String pergunta,
  String resposta
) {

  int largura = 200;
  int altura = 120;

  boolean mouseOver =

    mouseX > x &&
    mouseX < x + largura &&

    mouseY > y &&
    mouseY < y + altura;

  if (mouseOver) {

    fill(180, 255, 180);
   
    rect(x - 5, y - 5, largura + 10, altura + 10, 20);

  } else {

    fill(255);
    stroke(0);
    strokeWeight(2);

    rect(x, y, largura, altura, 20);
  }

  fill(0);

  textAlign(CENTER, CENTER);

  textSize(18);

  if (mouseOver) {

    text(resposta, x + largura/2, y + altura/2);

  } else {

    text(pergunta, x + largura/2, y + altura/2);
  }
}


//clicar pra voltar

void cliqueRevisao() {
  if (

    mouseX > 312 &&
    mouseX < 487 &&

    mouseY > 700 &&
    mouseY < 775

  ) {

    tela = 2;
  }
}

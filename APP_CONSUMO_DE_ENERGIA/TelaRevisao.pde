void telaRevisao() {
  background(240);
  
// fazendo a borda preta
stroke(0);
strokeWeight(3);
fill(255);

rect(70, 120, 200, 120, 0);
rect(300, 120, 200, 120, 0);
rect(530, 120, 200, 120, 0);

rect(70, 300, 200, 120, 0);
rect(300, 300, 200, 120, 0);
rect(530, 300, 200, 120, 0);

rect(70, 480, 200, 120, 0);
rect(300, 480, 200, 120, 0);
rect(530, 480, 200, 120, 0);

  //mostrando o título
cp5.get(Textlabel.class, "titulo").show();
//os cards
cp5.get(Textarea.class, "card1").show();
cp5.get(Textarea.class, "card2").show();
cp5.get(Textarea.class, "card3").show();
cp5.get(Textarea.class, "card4").show();
cp5.get(Textarea.class, "card5").show();
cp5.get(Textarea.class, "card6").show();
cp5.get(Textarea.class, "card7").show();
cp5.get(Textarea.class, "card8").show();
cp5.get(Textarea.class, "card9").show();

//criando os cards

 //CARD 1
  atualizarCard(
    "card1",
    70, 120,
    "Qual é a fórmula da potência elétrica?",
    "P = E / t"
  );

//CARD 2
  atualizarCard(
    "card2",
    300, 120,
    "O que é a potência elétrica?",
    "Quantidade de energia que um aparelho consome por tempo"
  );

//CARD 3
  atualizarCard(
    "card3",
    530, 120,
    "O que significa cada letra na fórmula \nP = E / t ?",
    "P = potência (W)\nE = energia (J)\nt = tempo (s)"
  );

//CARD 4
  atualizarCard(
    "card4",
    70, 300,
    "Como calcular energia?",
    "E = P x t"
  );

//CARD 5
  atualizarCard(
    "card5",
    300, 300,
    "Como calcular o tempo?",
    "t = E / P"
  );

//CARD 6
  atualizarCard(
    "card6",
    530, 300,
    "Qual a diferença entre potência e consumo de energia?",
    "Consumo depende do tempo de uso. Potência é o gasto por segundo."
  );

//CARD 7
  atualizarCard(
    "card7",
    70, 480,
    "O que significa cada parte do kWh?",
    "k = mil\nW = potência elétrica\nh = tempo (hora)"
  );

//CARD 8
  atualizarCard(
    "card8",
    300, 480,
    "O que influencia no consumo de energia?",
    "Potência do aparelho e tempo de uso"
  );

//CARD 9
  atualizarCard(
    "card9",
    530, 480,
    "O que significa kWh?",
    "kWh = energia consumida em 1 hora"
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
void atualizarCard(
  String nome,
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

    cp5.get(Textarea.class, nome)
       .setColorBackground(color(180, 255, 180))
       .setText(resposta);

  } else {

    cp5.get(Textarea.class, nome)
       .setColorBackground(color(255))
       .setText(pergunta);
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
//escondendo o titulo
    cp5.get(Textlabel.class, "titulo").hide();
    //escondendo os cards
    cp5.get(Textarea.class, "card1").hide();
    cp5.get(Textarea.class, "card2").hide();
    cp5.get(Textarea.class, "card3").hide();
    cp5.get(Textarea.class, "card4").hide();
    cp5.get(Textarea.class, "card5").hide();
    cp5.get(Textarea.class, "card6").hide();
    cp5.get(Textarea.class, "card7").hide();
    cp5.get(Textarea.class, "card8").hide();
    cp5.get(Textarea.class, "card9").hide();
    
    tela = 2;
  }
}

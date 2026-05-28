String[] perguntasRevisao = {
  "Qual \u00e9 a f\u00f3rmula da pot\u00eancia el\u00e9trica?",
  "O que \u00e9 a pot\u00eancia el\u00e9trica?",
  "O que significa cada letra na f\u00f3rmula \nP = E / t ?",
  "Como calcular energia?",
  "Como calcular o tempo?",
  "Qual a diferen\u00e7a entre pot\u00eancia e consumo de energia?",
  "O que significa cada parte do kWh?",
  "O que influencia no consumo de energia?",
  "O que significa kWh?"
};

String[] respostasRevisao = {
  "P = E / t",
  "Quantidade de energia que um aparelho consome por tempo",
  "P = pot\u00eancia (W)\nE = energia (J)\nt = tempo (s)",
  "E = P x t",
  "t = E / P",
  "Consumo depende do tempo de uso. Pot\u00eancia \u00e9 o gasto por segundo.",
  "k = mil\nW = pot\u00eancia el\u00e9trica\nh = tempo (hora)",
  "Pot\u00eancia do aparelho e tempo de uso",
  "kWh = energia consumida em 1 hora"
};

int[] cardRevisaoX = new int[9];
int[] cardRevisaoY = new int[9];

int cardRevisaoL = 200;
int cardRevisaoA = 120;

void setupReview(){

  int espacoX = 35;
  int espacoY = 50;
  int gradeL = 3 * cardRevisaoL + 2 * espacoX;
  int gradeA = 3 * cardRevisaoA + 2 * espacoY;
  int inicioX = width/2 - gradeL/2;
  int inicioY = height/2 - gradeA/2 + 30;

  for(int i = 0; i < perguntasRevisao.length; i++){

    int coluna = i % 3;
    int linha = i / 3;

    cardRevisaoX[i] = inicioX + coluna * (cardRevisaoL + espacoX);
    cardRevisaoY[i] = inicioY + linha * (cardRevisaoA + espacoY);
  }

  cp5.addTextlabel("tituloRevisao")
     .setText("REVIS\u00c3O")
     .setPosition(width/2 - 95, 55)
     .setColorValue(reviewTitle)
     .setFont(createFont("Times New Roman", 42))
     .hide();

  for(int i = 0; i < perguntasRevisao.length; i++){

    cp5.addTextarea("cardRevisao" + (i + 1))
       .setPosition(cardRevisaoX[i] + 10, cardRevisaoY[i] + 12)
       .setSize(cardRevisaoL - 20, cardRevisaoA - 24)
       .setFont(createFont("Verdana", 16))
       .setColor(reviewText)
       .setColorBackground(reviewCard)
       .setLineHeight(20)
       .setText(perguntasRevisao[i])
       .hide();
  }
}

void drawFlashcards(){

  background(reviewBackground);

  showReview();

  stroke(reviewText);
  strokeWeight(3);

  fill(reviewCard);

  for(int i = 0; i < perguntasRevisao.length; i++){

    rect(
      cardRevisaoX[i],
      cardRevisaoY[i],
      cardRevisaoL,
      cardRevisaoA,
      0
    );
  }

  cp5.get(Textlabel.class, "tituloRevisao")
     .setColorValue(reviewTitle)
     .show();

  for(int i = 0; i < perguntasRevisao.length; i++){

    updateReviewCard(
      "cardRevisao" + (i + 1),
      cardRevisaoX[i],
      cardRevisaoY[i],
      perguntasRevisao[i],
      respostasRevisao[i]
    );
  }

  backButton.display();
}

void showReview(){

  cp5.get(Textlabel.class, "tituloRevisao").show();

  for(int i = 0; i < perguntasRevisao.length; i++){

    cp5.get(Textarea.class, "cardRevisao" + (i + 1)).show();
  }
}

void hideReview(){

  cp5.get(Textlabel.class, "tituloRevisao").hide();

  for(int i = 0; i < perguntasRevisao.length; i++){

    cp5.get(Textarea.class, "cardRevisao" + (i + 1)).hide();
  }
}

void updateReviewCard(
  String nome,
  int x,
  int y,
  String pergunta,
  String resposta
){

  boolean mouseSobreCard =
    mouseX > x &&
    mouseX < x + cardRevisaoL &&
    mouseY > y &&
    mouseY < y + cardRevisaoA;

  if(mouseSobreCard){

    cp5.get(Textarea.class, nome)
       .setColorBackground(reviewCardHover)
       .setColor(reviewText)
       .setText(resposta);

  } else {

    cp5.get(Textarea.class, nome)
       .setColorBackground(reviewCard)
       .setColor(reviewText)
       .setText(pergunta);
  }
}

void handleReviewMousePressed(){
}

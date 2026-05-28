final int QUESTIONS_START = 0;
final int QUESTIONS_PLAYING = 1;
final int QUESTIONS_FINISHED = 2;

int questionsState = QUESTIONS_START;

PFont fonteTituloQuestoes;
PFont fonteTextoQuestoes;

String[] perguntas = {

  "1) Um aparelho desligado da tomada pode continuar consumindo energia.",
  "2) Dois aparelhos com mesma pot\u00eancia sempre consomem a mesma energia.",
  "3) O selo Procel A indica maior efici\u00eancia energ\u00e9tica.",
  "4) Um aparelho de 1000 W consome 1 kWh em 1 hora.",
  "5) L\u00e2mpadas LED transformam mais energia em luz que l\u00e2mpadas incandescentes.",

  "6) Um chuveiro de 5500 W ligado por 20 minutos consome aproximadamente:",
  "7) Relacione as bandeiras tarif\u00e1rias \u00e0s descri\u00e7\u00f5es corretas.",
  "8) Uma TV de 200 W ligada 5h por dia durante 30 dias consumir\u00e1:",

  "9) Uma resid\u00eancia possui 6 l\u00e2mpadas de 15 W ligadas 8h por dia durante 30 dias. O consumo total \u00e9:",
  "10) Um ar-condicionado de 1500 W funciona 6h por dia durante 30 dias. Se o kWh custa R$0,90, o gasto ser\u00e1 aproximadamente:"
};

String[][] alternativas = {

  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},

  {"0,9 kWh", "1,8 kWh", "2,2 kWh", "5,5 kWh"},
  {"Clique para relacionar"},
  {"3 kWh", "30 kWh", "300 kWh", "15 kWh"},

  {"10,8 kWh", "21,6 kWh", "32,4 kWh", "43,2 kWh"},
  {"R$81", "R$162", "R$243", "R$324"}
};

String[] bandeiras = {
  "Verde",
  "Amarela",
  "Vermelha 1",
  "Vermelha 2"
};

String[] descricoesBandeiras = {
  "Maior acr\u00e9scimo",
  "Sem cobran\u00e7a extra",
  "Pequeno acr\u00e9scimo",
  "Acr\u00e9scimo moderado"
};

int[] respostasBandeiras = {
  1,
  2,
  3,
  0
};

int[] respostasJogadorBandeiras = {
  -1,
  -1,
  -1,
  -1
};

int bandeiraSelecionada = -1;

int[] respostas = {

  0,
  1,
  0,
  0,
  0,

  1,
  1,
  1,

  1,
  2
};

int[] respostasEscolhidas = new int[perguntas.length];

void setupConfete(){

  for(int i = 0; i < confeteX.length; i++){

    confeteX[i] = random(width);
    confeteY[i] = random(-height, 0);

    confeteVel[i] = random(2, 8);

    confeteCor[i] = color(
      random(255),
      random(255),
      random(255)
    );
  }
}

void setupQuestions(){

  fonteTituloQuestoes = createFont("Times New Roman", 40);
  fonteTextoQuestoes = createFont("Verdana", 18);

  resetQuestions();
}

void resetQuestions(){

  questionsState = QUESTIONS_START;
  questao = 0;
  pontos = 0;
  bandeiraSelecionada = -1;

  for(int i = 0; i < respostasEscolhidas.length; i++){

    respostasEscolhidas[i] = -1;
  }

  resetQuestionSeven();
}

void resetQuestionSeven(){

  bandeiraSelecionada = -1;

  for(int i = 0; i < respostasJogadorBandeiras.length; i++){

    respostasJogadorBandeiras[i] = -1;
  }
}

void drawConfete(){

  noStroke();

  for(int i = 0; i < confeteX.length; i++){

    fill(confeteCor[i]);

    rect(
      confeteX[i],
      confeteY[i],
      12,
      12
    );

    confeteY[i] += confeteVel[i];

    if(confeteY[i] > height){

      confeteY[i] = random(-200, -50);
      confeteX[i] = random(width);
    }
  }
}

void drawQuestions(){

  if(questionsState == QUESTIONS_START){

    drawQuestionsStart();

  } else if(questionsState == QUESTIONS_PLAYING){

    drawQuestionsPlaying();

  } else {

    drawQuestionsFinished();
  }

  backButton.display();
}

void drawQuestionsStart(){

  background(questionsBackground);

  fill(questionsText);

  textAlign(CENTER);

  textFont(fonteTituloQuestoes);
  textSize(44);

  text(
    "QUIZ DE ENERGIA EL\u00c9TRICA",
    width/2,
    height * 0.22
  );

  textFont(fonteTextoQuestoes);
  textSize(24);

  text(
    "5 f\u00e1ceis \u2022 3 m\u00e9dias \u2022 2 dif\u00edceis",
    width/2,
    height * 0.30
  );

  textSize(23);

  text(
    "Teste seus conhecimentos sobre energia el\u00e9trica.\n\nAnote suas respostas em um papel se quiser conferir com o gabarito ao final.",
    width * 0.20,
    height * 0.42,
    width * 0.60,
    height * 0.20
  );

  drawQuizButton(
    width/2 - 130,
    height/2 + 120,
    260,
    75,
    "INICIAR"
  );
}

void drawQuestionsPlaying(){

  background(questionsBackground);

  noStroke();

  fill(questionsButton);

  rect(0, 0, width, 110);

  fill(255);

  textFont(fonteTituloQuestoes);
  textSize(44);

  textAlign(LEFT, CENTER);

  text(
    "QUEST\u00d5ES",
    60,
    55
  );

  textFont(fonteTextoQuestoes);
  textSize(22);

  textAlign(RIGHT, CENTER);

  if(questao <= 4){

    text("Dificuldade: F\u00e1cil", width - 220, 55);

  } else if(questao <= 7){

    text("Dificuldade: M\u00e9dia", width - 220, 55);

  } else {

    text("Dificuldade: Dif\u00edcil", width - 220, 55);
  }

  fill(questionsText);

  textAlign(LEFT);
  textSize(24);

  text(
    "Quest\u00e3o " + (questao + 1) + " de " + perguntas.length,
    width * 0.15,
    height * 0.20
  );

  float caixaX = width * 0.15;
  float caixaY = height * 0.25;
  float caixaW = width * 0.70;
  float caixaH = height * 0.16;

  fill(questionsPanel);

  stroke(180);
  strokeWeight(1);

  rect(
    caixaX,
    caixaY,
    caixaW,
    caixaH,
    20
  );

  fill(questionsText);

  textFont(fonteTextoQuestoes);
  textSize(22);

  textAlign(LEFT, TOP);

  text(
    perguntas[questao],
    caixaX + 30,
    caixaY + 25,
    caixaW - 60,
    caixaH - 40
  );

  if(questao == 6){

    desenharQuestaoBandeiras();

  } else {

    float altX = width * 0.20;
    float altY = height * 0.48;
    float altW = width * 0.60;
    float altH = 65;
    float espaco = 85;

    for(int i = 0; i < alternativas[questao].length; i++){

      drawQuizAlternative(
        altX,
        altY + i * espaco,
        altW,
        altH,
        alternativas[questao][i]
      );
    }
  }

  fill(questionsText);

  textAlign(CENTER);
  textSize(22);

  text(
    "Pontua\u00e7\u00e3o: " + pontos,
    width/2,
    height * 0.93
  );
}

void drawPieChart(float x, float y, float tamanho){

  float acertos = pontos;
  float erros = perguntas.length - pontos;

  float total = acertos + erros;

  float anguloAcertos =
    TWO_PI * (acertos / total);

  noStroke();

  // ACERTOS
  fill(80, 220, 120);

  arc(
    x,
    y,
    tamanho,
    tamanho,
    0,
    anguloAcertos,
    PIE
  );

  // ERROS
  fill(220, 80, 80);

  arc(
    x,
    y,
    tamanho,
    tamanho,
    anguloAcertos,
    TWO_PI,
    PIE
  );

  // LEGENDA
  fill(questionsText);

  textAlign(LEFT, CENTER);
  textSize(22);

  rectMode(CORNER);

  fill(80, 220, 120);
  rect(x + tamanho/2 + 40, y - 20, 25, 25);

  fill(questionsText);
  text(
    "Acertos: " + pontos,
    x + tamanho/2 + 80,
    y - 7
  );

  fill(220, 80, 80);
  rect(x + tamanho/2 + 40, y + 30, 25, 25);

  fill(questionsText);
  text(
    "Erros: " + (perguntas.length - pontos),
    x + tamanho/2 + 80,
    y + 43
  );
}

void drawQuestionsFinished(){

  if(darkMode){

    background(40, 70, 40);

  } else {

    background(220, 255, 220);
  }
  
  drawConfete();

  fill(questionsText);

  textAlign(CENTER);

  textFont(fonteTituloQuestoes);
  textSize(48);

  text(
    "QUIZ FINALIZADO!",
    width/2,
    height * 0.25
  );

  textSize(34);

  text(
    "Pontua\u00e7\u00e3o: " + pontos + " / " + perguntas.length,
    width/2,
    height * 0.40
  );
  
  drawPieChart(
  width/2,
  height * 0.52,
  220
  );

  drawQuizButton(
    width/2 - 130,
    height * 0.68,
    260,
    75,
    "VER GABARITO"
  );
}

void drawQuizButton(float x, float y, float w, float h, String label){

  if(mouseOver(x, y, w, h)){

    fill(90, 160, 255);

  } else {

    fill(40, 110, 230);
  }

  noStroke();
  rect(x, y, w, h, 20);

  fill(255);
  textAlign(CENTER, CENTER);
  textFont(fonteTextoQuestoes);
  textSize(24);
  text(label, x + w/2, y + h/2);
}

void drawQuizAlternative(
  float x,
  float y,
  float w,
  float h,
  String label
){

  if(mouseOver(x, y, w, h)){

    fill(questionsCorrect);

  } else {

    fill(questionsPanel);
  }

  stroke(150);
  strokeWeight(1);

  rect(
    x,
    y,
    w,
    h,
    15
  );

  fill(questionsText);

  textAlign(LEFT, CENTER);
  textFont(fonteTextoQuestoes);
  textSize(20);

  text(
    label,
    x + 20,
    y + h/2
  );
}

void handleQuestionsMousePressed(){

  if(questionsState == QUESTIONS_START){

    if(mouseOver(width/2 - 130, height/2 + 120, 260, 75)){

      startQuestions();
    }

  } else if(questionsState == QUESTIONS_PLAYING){

    handlePlayingQuestionClick();

  } else if(mouseOver(width/2 - 150, height * 0.68, 300, 80)){

    resetAnswers();
    screen = ANSWERS;
  }
}

void startQuestions(){

  questao = 0;
  pontos = 0;
  questionsState = QUESTIONS_PLAYING;
  resetQuestionSeven();

  for(int i = 0; i < respostasEscolhidas.length; i++){

    respostasEscolhidas[i] = -1;
  }
}

void handlePlayingQuestionClick(){

  if(questao == 6){

    handleBandeirasClick();

  } else {

    float altX = width * 0.20;
    float altY = height * 0.48;
    float altW = width * 0.60;
    float altH = 65;
    float espaco = 85;

    for(int i = 0; i < alternativas[questao].length; i++){

      if(mouseOver(altX, altY + i * espaco, altW, altH)){

        verificarRespostaQuestao(i);
      }
    }
  }
}

void verificarRespostaQuestao(int respostaJogador){

  respostasEscolhidas[questao] = respostaJogador;

  if(respostaJogador == respostas[questao]){

    pontos++;
  }

  avancarQuestaoOuFinalizar();
}

void avancarQuestaoOuFinalizar(){

  if(questao < perguntas.length - 1){

    questao++;

  } else {

    questionsState = QUESTIONS_FINISHED;
  }
}

void desenharQuestaoBandeiras(){

  float bandeiraX = width * 0.18;
  float descricaoX = width * 0.57;
  float inicioY = height * 0.50;

  float caixaW = width * 0.24;
  float caixaH = 60;

  float espaco = 85;

  textFont(fonteTextoQuestoes);
  textSize(22);

  fill(questionsText);

  textAlign(CENTER);

  text(
    "BANDEIRAS",
    bandeiraX + caixaW/2,
    inicioY - 35
  );

  text(
    "DESCRI\u00c7\u00d5ES",
    descricaoX + caixaW/2,
    inicioY - 35
  );

  for(int i = 0; i < bandeiras.length; i++){

    // CAIXA DAS BANDEIRAS
    if(bandeiraSelecionada == i){

      fill(questionsCorrect);

    } else {

      fill(questionsPanel);
    }

    stroke(150);
    strokeWeight(1);

    rect(
      bandeiraX,
      inicioY + i * espaco,
      caixaW,
      caixaH,
      15
    );

    fill(questionsText);

    textAlign(CENTER, CENTER);

    text(
      bandeiras[i],
      bandeiraX + caixaW/2,
      inicioY + i * espaco + caixaH/2
    );

    // CAIXA DAS DESCRIÇÕES
    fill(questionsPanel);

    stroke(150);

    rect(
      descricaoX,
      inicioY + i * espaco,
      caixaW,
      caixaH,
      15
    );

    fill(questionsText);

    text(
      descricoesBandeiras[i],
      descricaoX + caixaW/2,
      inicioY + i * espaco + caixaH/2
    );

    if(respostasJogadorBandeiras[i] != -1){

      stroke(questionsText);
      strokeWeight(3);

      line(
        bandeiraX + caixaW,
        inicioY + i * espaco + caixaH/2,
        descricaoX,
        inicioY + respostasJogadorBandeiras[i] * espaco + caixaH/2
      );

      strokeWeight(1);
    }
  }
}

void handleBandeirasClick(){

  float bandeiraX = width * 0.18;
  float descricaoX = width * 0.57;
  float inicioY = height * 0.50;
  float caixaW = width * 0.24;
  float caixaH = 60;
  float espaco = 85;

  for(int i = 0; i < bandeiras.length; i++){

    if(mouseOver(bandeiraX, inicioY + i * espaco, caixaW, caixaH)){

      bandeiraSelecionada = i;
      return;
    }
  }

  for(int i = 0; i < descricoesBandeiras.length; i++){

    if(mouseOver(descricaoX, inicioY + i * espaco, caixaW, caixaH)){

      if(bandeiraSelecionada != -1){

        respostasJogadorBandeiras[bandeiraSelecionada] = i;
        bandeiraSelecionada = -1;
      }
    }
  }

  if(bandeirasRespondidas()){

    if(bandeirasCorretas()){

      pontos++;
    }

    respostasEscolhidas[questao] = 0;
    avancarQuestaoOuFinalizar();
  }
}

boolean bandeirasRespondidas(){

  for(int i = 0; i < respostasJogadorBandeiras.length; i++){

    if(respostasJogadorBandeiras[i] == -1){

      return false;
    }
  }

  return true;
}

boolean bandeirasCorretas(){

  for(int i = 0; i < respostasBandeiras.length; i++){

    if(respostasJogadorBandeiras[i] != respostasBandeiras[i]){

      return false;
    }
  }

  return true;
}

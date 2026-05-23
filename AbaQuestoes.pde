String[] perguntas = {

  "1) Um aparelho desligado da tomada pode continuar consumindo energia.",

  "2) Dois aparelhos com mesma potência sempre consomem a mesma energia.",

  "3) O selo Procel A indica maior eficiência energética.",

  "4) Um aparelho de 1000 W consome 1 kWh em 1 hora.",

  "5) Lâmpadas LED transformam mais energia em luz que lâmpadas incandescentes.",

  "6) Um chuveiro de 5500 W ligado por 20 minutos consome aproximadamente:",

  "7) Qual aparelho normalmente apresenta maior potência elétrica?",

  "8) Uma TV de 200 W ligada 5h por dia durante 30 dias consumirá:",

  "9) Uma residência possui 6 lâmpadas de 15 W ligadas 8h por dia durante 30 dias. O consumo total é:",

  "10) Um ar-condicionado de 1500 W funciona 6h por dia durante 30 dias. Se o kWh custa R$0,90, o gasto será aproximadamente:"
};

String[][] alternativas = {

  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},
  {"Verdadeiro", "Falso"},

  {"0,9 kWh", "1,8 kWh", "2,2 kWh", "5,5 kWh"},

  {"Carregador de celular", "Chuveiro elétrico", "Lâmpada LED", "Roteador"},

  {"3 kWh", "30 kWh", "300 kWh", "15 kWh"},

  {"10,8 kWh", "21,6 kWh", "32,4 kWh", "43,2 kWh"},

  {"R$81", "R$162", "R$243", "R$324"}
};

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

void drawQuestions(){

  questions.drawScreen();

  backButton.display();

  fill(255);
  textAlign(CENTER);
  textSize(height * 0.05);
  text("QUESTÕES DE ENERGIA", width * 0.5, height * 0.08);

  fill(255);
  rect(width * 0.15, height * 0.18, width * 0.7, height * 0.18, 20);
  
  fill(0);
  textAlign(LEFT, TOP);
  textSize(height * 0.03);
  text(perguntas[questao], width * 0.18, height * 0.22, width * 0.64, height * 0.15);

  float y = height * 0.45;

  for(int i = 0; i < alternativas[questao].length; i++){

    float x = width * 0.2;
    float w = width * 0.6;
    float h = height * 0.08;

    if(mouseOver(x, y + i * height * 0.1, w, h)){

      fill(180,220,255);

    } else {

      fill(255);
    }

    rect(x, y + i * height * 0.1, w, h, 15);
    
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(height * 0.028);
    text(alternativas[questao][i], x + width * 0.02, y + i * height * 0.1 + h/2);
  }

  fill(255);
  textAlign(CENTER);
  textSize(height * 0.03);
  text("Pontuação: " + pontos, width * 0.5, height * 0.92);
}

void verificarResposta(int respostaJogador){

  if(respostaJogador == respostas[questao]){

    pontos++;
  }

  if(questao < perguntas.length - 1){

    questao++;
    
  } else {

    screen = ANSWERS;
  }
}

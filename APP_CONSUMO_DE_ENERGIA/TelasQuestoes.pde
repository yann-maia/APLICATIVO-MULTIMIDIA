import controlP5.*;

ControlP5 cp5;

Textlabel titulo;
Textlabel subtitulo;

int tela = 0;
int questao = 0;
int pontos = 0;

// PERGUNTAS

String[] perguntas = {

  // FÁCEIS (V/F)
  "1) Um aparelho desligado pode continuar consumindo energia.",
  "2) Dois aparelhos com mesma potência sempre consomem a mesma energia.",
  "3) O selo Procel A indica maior eficiência energética.",
  "4) Um aparelho de 1000 W consome 1 kWh em 1 hora.",
  "5) Lâmpadas LED transformam mais energia em luz que lâmpadas incandescentes.",

  // MÉDIAS
  "6) Um chuveiro de 5500 W ligado por 20 minutos consome aproximadamente:",
  "7) Qual aparelho normalmente apresenta maior potência elétrica?",
  "8) Uma TV de 200 W ligada 5h por dia durante 30 dias consumirá:",

  // DIFÍCEIS
  "9) Uma residência possui 6 lâmpadas de 15 W ligadas 8h por dia durante 30 dias. O consumo total é:",
  "10) Um ar-condicionado de 1500 W funciona 6h por dia durante 30 dias. Se o kWh custa R$0,90, o gasto será aproximadamente:"
};

// ALTERNATIVAS

String[][] alternativas = {

  {
    "Verdadeiro",
    "Falso"
  },

  {
    "Verdadeiro",
    "Falso"
  },

  {
    "Verdadeiro",
    "Falso"
  },

  {
    "Verdadeiro",
    "Falso"
  },

  {
    "Verdadeiro",
    "Falso"
  },

  // MÉDIAS
  {
    "0,9 kWh",
    "1,8 kWh",
    "2,2 kWh",
    "5,5 kWh"
  },

  {
    "Carregador de celular",
    "Chuveiro elétrico",
    "Lâmpada LED",
    "Roteador"
  },

  {
    "3 kWh",
    "30 kWh",
    "300 kWh",
    "15 kWh"
  },

  // DIFÍCEIS
  {
    "10,8 kWh",
    "21,6 kWh",
    "32,4 kWh",
    "43,2 kWh"
  },

  {
    "R$81",
    "R$162",
    "R$243",
    "R$324"
  }
};

// RESPOSTAS

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


  // TEXTOS COM CONTROLP5

  titulo = cp5.addTextlabel("titulo")
    .setText("QUIZ DE ENERGIA ELÉTRICA")
    .setPosition(120, 150)
    .setColorValue(color(0))
    .setFont(createFont("Times New Roman", 36));

  subtitulo = cp5.addTextlabel("subtitulo")
    .setText("5 fáceis • 3 médias • 2 difíceis")
    .setPosition(220, 230)
    .setColorValue(color(0))
    .setFont(createFont("Arial", 20));
}

// ==========================================

void draw() {

  background(240);

  if (tela == 0) {

    telaInicial();

  } else if (tela == 1) {

    telaQuestoes();

  } else if (tela == 2) {

    telaFinal();
  }
}

// TELA INICIAL

void telaInicial() {

  titulo.setVisible(true);
  subtitulo.setVisible(true);

  fill(0);

  textAlign(CENTER);

  textSize(18);

  text(
    "Teste seus conhecimentos sobre energia elétrica",
    width/2,
    320
  );

  botao(300, 450, 200, 65, "INICIAR");
}

// QUESTÕES

void telaQuestoes() {

  titulo.setVisible(false);
  subtitulo.setVisible(false);

  fill(20, 60, 170);

  rect(0, 0, width, 90);

  fill(255);

  textSize(30);

  textAlign(LEFT);

  text("QUESTÕES", 30, 55);

  fill(0);

  textSize(22);

  text(
    "Questão " + (questao + 1) + " de " + perguntas.length,
    40,
    130
  );

  // PERGUNTA

  fill(255);

  stroke(180);

  rect(50, 170, 700, 120, 15);

  fill(0);

  textSize(20);

  text(
    perguntas[questao],
    70,
    200,
    650,
    120
  );

  // ALTERNATIVAS

  int y = 340;

  for (int i = 0; i < alternativas[questao].length; i++) {

    alternativa(
      100,
      y + i*80,
      600,
      55,
      alternativas[questao][i]
    );
  }
}

// TELA FINAL

void telaFinal() {

  background(220, 255, 220);

  fill(0);

  textAlign(CENTER);

  textSize(40);

  text("QUIZ FINALIZADO!", width/2, 180);

  textSize(30);

  text(
    "Pontuação: " + pontos + " / " + perguntas.length,
    width/2,
    300
  );

  textSize(24);

  if (pontos == 10) {

    text("Excelente desempenho!", width/2, 400);

  } else if (pontos >= 7) {

    text("Muito bom!", width/2, 400);

  } else {

    text("Continue praticando!", width/2, 400);
  }

  botao(280, 520, 240, 70, "GABARITO");
}

// BOTÃO

void botao(float x, float y, float w, float h, String texto) {

  if (mouseX > x &&
      mouseX < x+w &&
      mouseY > y &&
      mouseY < y+h) {

    fill(90, 160, 255);

  } else {

    fill(40, 110, 230);
  }

  noStroke();

  rect(x, y, w, h, 20);

  fill(255);

  textAlign(CENTER, CENTER);

  textSize(24);

  text(
    texto,
    x + w/2,
    y + h/2
  );
}

// ALTERNATIVA

void alternativa(float x, float y, float w, float h, String texto) {

  if (mouseX > x &&
      mouseX < x+w &&
      mouseY > y &&
      mouseY < y+h) {

    fill(170, 210, 255);

  } else {

    fill(255);
  }

  stroke(150);

  rect(x, y, w, h, 15);

  fill(0);

  textAlign(LEFT, CENTER);

  textSize(20);

  text(
    texto,
    x + 20,
    y + h/2
  );
}

// CLIQUES

void mousePressed() {

  // INICIAR

  if (tela == 0) {

    if (clicou(300, 450, 200, 65)) {

      tela = 1;
    }
  }

  // QUESTÕES

  else if (tela == 1) {

    int y = 340;

    for (int i = 0; i < alternativas[questao].length; i++) {

      if (clicou(100, y + i*80, 600, 55)) {

        verificarResposta(i);
      }
    }
  }

  // FINAL

  else if (tela == 2) {

    if (clicou(280, 520, 240, 70)) {

      println("===== GABARITO =====");

      println("1) Verdadeiro");
      println("2) Falso");
      println("3) Verdadeiro");
      println("4) Verdadeiro");
      println("5) Verdadeiro");

      println("6) 1,8 kWh");
      println("7) Chuveiro elétrico");
      println("8) 30 kWh");

      println("9) 21,6 kWh");
      println("10) R$243");
    }
  }
}

void verificarResposta(int respostaJogador) {

  if (respostaJogador == respostas[questao]) {

    pontos++;
  }

  if (questao < perguntas.length - 1) {

    questao++;

  } else {

    tela = 2;
  }
}

// DETECTAR CLIQUE

boolean clicou(float x, float y, float w, float h) {

  return mouseX > x &&
         mouseX < x+w &&
         mouseY > y &&
         mouseY < y+h;
}

void cliqueQuestoes(){

}

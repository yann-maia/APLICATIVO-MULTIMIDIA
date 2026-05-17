int questao = 0;
int pontos = 0;
// ==========================================
// QUESTÕES
// ==========================================
String[] perguntas = {

  "Uma residência possui 10 lâmpadas LED de 12 W cada, ligadas durante 5 horas por dia. Qual é o consumo total em kWh após 30 dias?",

  "Um chuveiro elétrico possui potência de 5500 W e é utilizado por 40 minutos diariamente. Qual é o consumo mensal aproximado em kWh em 30 dias?",

  "Qual alternativa apresenta um aparelho com MAIOR eficiência energética?",

  "Uma máquina de lavar de 800 W funciona 2 horas por dia durante 25 dias. Qual o consumo total em kWh?",

  "Uma família substituiu 5 lâmpadas incandescentes de 60 W por LEDs de 9 W. Qual foi a redução total de potência?"
};

// ==========================================
// ALTERNATIVAS
// ==========================================

String[][] alternativas = {

  {
    "A) 18 kWh",
    "B) 12 kWh",
    "C) 24 kWh",
    "D) 30 kWh"
  },

  {
    "A) 66 kWh",
    "B) 110 kWh",
    "C) 220 kWh",
    "D) 55 kWh"
  },

  {
    "A) Selo D",
    "B) Selo C",
    "C) Selo A",
    "D) Selo E"
  },

  {
    "A) 20 kWh",
    "B) 40 kWh",
    "C) 60 kWh",
    "D) 80 kWh"
  },

  {
    "A) 255 W",
    "B) 300 W",
    "C) 150 W",
    "D) 75 W"
  }
};

// ==========================================
// RESPOSTAS CORRETAS
// 0=A 1=B 2=C 3=D
// ==========================================

int[] respostas = {
  0,
  1,
  2,
  0,
  0
};
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

// ==========================================
// TELA INICIAL
// ==========================================

void telaInicial() {

  background(230, 240, 255);

  textAlign(CENTER, CENTER);

  fill(30, 60, 170);

  textSize(42);
  text("QUESTÕES", width/2, 180);

  textSize(24);
  text("Energia Elétrica e Consumo", width/2, 240);

  fill(0);

  textSize(18);

  text(
    "Questões difíceis com cálculos e eficiência energética",
    width/2,
    320
  );

  botao(width/2 - 120, 450, 240, 65, "INICIAR");
}

// ==========================================
// TELA QUESTÕES
// ==========================================

void telaQuestoes() {

  textAlign(LEFT, TOP);

  // TOPO
  fill(20, 60, 180);
  noStroke();

  rect(0, 0, width, 80);

  fill(255);

  textSize(30);

  text("QUESTÕES", 30, 22);

  // QUESTÃO
  fill(0);

  textSize(20);

  text(
    "Questão " + (questao + 1) + " de " + perguntas.length,
    40,
    100
  );

  // PONTOS
  text(
    "Pontos: " + pontos,
    620,
    100
  );

  // CAIXA DA PERGUNTA
  fill(255);

  stroke(180);

  rect(40, 140, 720, 180, 20);

  fill(0);

  textSize(23);

  // TEXTO AJUSTADO
  text(
    perguntas[questao],
    65,
    175,
    670,
    130
  );

  // ==========================================
  // ALTERNATIVAS
  // ==========================================

  int y = 360;

  for (int i = 0; i < 4; i++) {

    alternativa(
      60,
      y + i*85,
      680,
      60,
      alternativas[questao][i]
    );
  }
}

// ==========================================
// ALTERNATIVAS
// ==========================================

void alternativa(float x, float y, float w, float h, String texto) {

  if (mouseX > x &&
      mouseX < x+w &&
      mouseY > y &&
      mouseY < y+h) {

    fill(140, 190, 255);

  } else {

    fill(255);
  }

  stroke(120);

  rect(x, y, w, h, 18);

  fill(0);

  textSize(20);

  text(
    texto,
    x + 18,
    y + 16
  );
}

// ==========================================
// TELA FINAL
// ==========================================

void telaFinal() {

  background(230, 255, 230);

  textAlign(CENTER, CENTER);

  fill(0);

  textSize(42);

  text(
    "QUIZ FINALIZADO!",
    width/2,
    200
  );

  textSize(32);

  text(
    "Pontuação: " + pontos + " / " + perguntas.length,
    width/2,
    320
  );

  textSize(24);

  if (pontos == perguntas.length) {

    text("Excelente desempenho!", width/2, 420);

  } else if (pontos >= 3) {

    text("Muito bom!", width/2, 420);

  } else {

    text("Continue praticando!", width/2, 420);
  }

  botao(width/2 - 130, 550, 260, 70, "REINICIAR");
}

// ==========================================
// BOTÃO
// ==========================================

void botao(float x, float y, float w, float h, String texto) {

  if (mouseX > x &&
      mouseX < x+w &&
      mouseY > y &&
      mouseY < y+h) {

    fill(100, 170, 255);

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

// ==========================================
// CLIQUES
// ==========================================

void mousePressed() {

  // TELA INICIAL
  if (tela == 0) {

    if (clicou(width/2 - 120, 450, 240, 65)) {

      tela = 1;
    }
  }

  // QUESTÕES
  else if (tela == 1) {

    int y = 360;

    for (int i = 0; i < 4; i++) {

      if (clicou(60, y + i*85, 680, 60)) {

        verificarResposta(i);
      }
    }
  }

  // FINAL
  else if (tela == 2) {

    if (clicou(width/2 - 130, 550, 260, 70)) {

      reiniciar();
    }
  }
}

// ==========================================
// VERIFICAR
// ==========================================

void verificarResposta(int respostaJogador) {

  if (respostaJogador == respostas[questao]) {

    pontos++;
  }

  questao++;

  if (questao >= perguntas.length) {

    tela = 2;
  }
}

// ==========================================
// REINICIAR
// ==========================================

void reiniciar() {

  tela = 0;
  questao = 0;
  pontos = 0;
}

// ==========================================
// DETECTAR CLIQUE
// ==========================================

boolean clicou(float x, float y, float w, float h) {

  return mouseX > x &&
         mouseX < x+w &&
         mouseY > y &&
         mouseY < y+h;
}

// ==========================================

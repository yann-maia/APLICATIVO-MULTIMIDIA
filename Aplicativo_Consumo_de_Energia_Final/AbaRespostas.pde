int paginaResposta = 0;

String[] respostasCorretas = {
  "Verdadeiro!",
  "Falso!",
  "Verdadeiro!",
  "Verdadeiro!",
  "Verdadeiro!",
  "1,8 kWh de energia!",
  "Verde -> Sem cobran\u00e7a extra\nAmarela -> Pequeno acr\u00e9scimo\nVermelha 1 -> Acr\u00e9scimo moderado\nVermelha 2 -> Maior acr\u00e9scimo",
  "30 kWh de energia el\u00e9trica!",
  "21,6 kWh de energia!",
  "R$ 243,00!"
};

String[] explicacoesRespostas = {
  "Mesmo desligado, alguns aparelhos continuam consumindo uma pequena quantidade de energia se permanecerem conectados \u00e0 tomada.\n\nIsso acontece porque certos componentes ficam em modo de espera, como TVs, micro-ondas e carregadores.\n\nEsse consumo \u00e9 pequeno, mas ao longo do tempo pode aumentar a conta de luz.",
  "Dois aparelhos podem ter a mesma pot\u00eancia, mas consumir quantidades diferentes de energia dependendo do tempo em que ficam ligados.\n\nPor exemplo, dois aparelhos de 1000 W ter\u00e3o consumos diferentes se um ficar ligado por 1 hora e o outro por 5 horas.\n\nO consumo de energia depende da pot\u00eancia e do tempo de uso.",
  "O selo Procel A indica que o aparelho possui alta efici\u00eancia energ\u00e9tica, ou seja, consegue funcionar bem consumindo menos energia el\u00e9trica.\n\nAparelhos com esse selo ajudam a economizar na conta de luz e tamb\u00e9m reduzem o desperd\u00edcio de energia.",
  "Um aparelho de 1000 W possui pot\u00eancia equivalente a 1 kW.\n\nSe ele ficar ligado durante 1 hora, consumir\u00e1 1 kWh de energia el\u00e9trica.\n\nEssa \u00e9 a unidade usada para medir o consumo de energia na conta de luz.",
  "As l\u00e2mpadas LED s\u00e3o mais eficientes porque transformam uma maior parte da energia el\u00e9trica em luz, enquanto as l\u00e2mpadas incandescentes desperdi\u00e7am muita energia em forma de calor.\n\nPor isso, as LEDs iluminam bem consumindo menos energia.",
  "Primeiro, precisamos converter de watts (W) para quilowatts (kW), pois o consumo de energia \u00e9 calculado em kWh:\n\n5500 W / 1000 = 5,5 kW\n\nDepois, transformamos 20 minutos em horas. Como 20 minutos \u00e9 a ter\u00e7a parte de 60 minutos:\n\n20 min = 1/3 de hora\n\nAgora calculamos o consumo:\n\n5,5 * 1/3 \u2248 1,8 kWh",
  "As bandeiras tarif\u00e1rias indicam o custo da produ\u00e7\u00e3o de energia el\u00e9trica no pa\u00eds.\n\nQuando a gera\u00e7\u00e3o est\u00e1 mais barata, utiliza-se a bandeira verde, sem taxa extra.\n\nJ\u00e1 as bandeiras amarela e vermelhas indicam que produzir energia ficou mais caro, aumentando o valor da conta de luz.\n\nA vermelha 2 representa o maior custo entre elas.",
  "Primeiro, convertemos de watts (W) para quilowatts (kW):\n\n200 W / 1000 = 0,2 kW\n\nDepois, calculamos o total de horas ligadas no m\u00eas:\n\n5 * 30 = 150 horas\n\nAgora calculamos o consumo:\n\n0,2 * 150 = 30 kWh",
  "Primeiro, somamos a pot\u00eancia das l\u00e2mpadas:\n\n6 * 15 = 90 W\n\nAgora convertemos de watts (W) para quilowatts (kW):\n\n90 W / 1000 = 0,09 kW\n\nDepois, calculamos o total de horas ligadas no m\u00eas:\n\n8 * 30 = 240 horas\n\nAgora calculamos o consumo total:\n\n0,09 * 240 = 21,6 kWh",
  "Primeiro, convertemos de watts (W) para quilowatts (kW):\n\n1500 W / 1000 = 1,5 kW\n\nDepois, calculamos o total de horas ligadas no m\u00eas:\n\n6 * 30 = 180 horas\n\nAgora calculamos o consumo de energia:\n\n1,5 * 180 = 270 kWh\n\nPor fim, multiplicamos pelo valor do kWh:\n\n270 * 0,90 = 243"
};

String[] linksAprofundeLabels = {
  "Exerc\u00edcios da Brasil Escola",
  "Exerc\u00edcios da SEDUC (ignorar quest\u00e3o 14)",
  "Exerc\u00edcios da ProCampus Educa\u00e7\u00e3o"
};

String[] linksAprofundeUrls = {
  "https://exercicios.brasilescola.uol.com.br/exercicios-fisica/exercicios-sobre-energia-eletrica.htm",
  "https://portal.educacao.go.gov.br/wp-content/uploads/2021/06/Atividade-11-8o-ano-Ciencias-da-natureza-Revisa%CC%83o.pdf",
  "https://www.procampuseducacao.com.br/wp-content/uploads/2020/04/8%C2%BA-Ano-Trabalhos-de-Ci%C3%AAncias-Ensino-Remoto.pdf"
};

void resetAnswers(){

  paginaResposta = 0;
}

void drawAnswers(){

  background(245);

  if(paginaResposta < perguntas.length){

    drawAnswerPage(paginaResposta);

  } else {

    drawAprofundeSe();
  }

  backButton.display();
}

void drawAnswerPage(int indice){

  fill(0);
  textAlign(LEFT);

  textFont(fonteTituloQuestoes);
  textSize(40);
  text("GABARITO QUEST\u00c3O " + (indice + 1) + ":", 50, 70);

  textFont(fonteTextoQuestoes);
  textSize(24);
  textLeading(31);
  text(
    "'" + perguntas[indice] + "'",
    50,
    120,
    width - 140,
    110
  );

  textSize(25);
  fill(answerColor(indice));
  text("Resposta: " + respostasCorretas[indice], 50, 245, width - 120, 130);

  float explicacaoY = 360;

  if(indice == 6){

    explicacaoY = 430;
  }

  fill(0);
  textSize(19);
  textLeading(25);
  text(
    "Explica\u00e7\u00e3o:\n\n" + explicacoesRespostas[indice],
    50,
    explicacaoY,
    width - 120,
    height - explicacaoY - 130
  );

  drawAnswerNavigation();
}

color answerColor(int indice){

  if(indice <= 4){

    if(respostas[indice] == 0){

      return color(0, 155, 0);
    }

    return color(210, 0, 0);
  }

  return color(0, 0, 200);
}

void drawAnswerNavigation(){

  String leftLabel = "Voltar";
  String rightLabel = "Continuar";

  if(paginaResposta == 0){

    leftLabel = "Pontua\u00e7\u00e3o";
  }

  if(paginaResposta == perguntas.length - 1){

    rightLabel = "Pratique mais";
  }

  drawAnswerButton(25, height - 100, 175, 75, leftLabel, color(220, 40, 40), color(255, 90, 90));
  drawAnswerButton(width - 200, height - 100, 175, 75, rightLabel, color(40, 110, 230), color(90, 160, 255));
}

void drawAprofundeSe(){

  fill(0);
  textAlign(LEFT);
  textFont(fonteTituloQuestoes);
  textSize(42);
  text("Pratique mais!", 50, 75);

  textFont(fonteTextoQuestoes);
  textSize(24);
  textLeading(32);
  text(
    "Resolva as listas de exerc\u00edcio online abaixo e aprimore ainda mais seu conhecimento sobre o consumo de energia el\u00e9trica.",
    50,
    120,
    width - 120,
    100
  );

  for(int i = 0; i < linksAprofundeLabels.length; i++){

    drawPracticeButton(50, 220 + i * 100, practiceButtonWidth(i), 44, linksAprofundeLabels[i]);
  }

  textSize(22);
  fill(0);
  textAlign(LEFT, CENTER);
  text(
    "(Dica: utilize uma IA de sua prefer\u00eancia para corrigir suas respostas.)",
    530,
    342,
    width - 580,
    90
  );

  drawAnswerButton(25, height - 100, 175, 75, "Voltar", color(220, 40, 40), color(255, 90, 90));
  drawAnswerButton(width - 220, height - 100, 195, 75, "Refazer quiz", color(40, 110, 230), color(90, 160, 255));
}

float practiceButtonWidth(int indice){

  if(indice == 0){

    return 270;
  }

  if(indice == 1){

    return 450;
  }

  return 360;
}

void drawPracticeButton(float x, float y, float w, float h, String label){

  if(mouseOver(x, y, w, h)){

    fill(90, 220, 140);

  } else {

    fill(40, 170, 90);
  }

  noStroke();
  rect(x, y, w, h, 20);

  fill(255);
  textFont(fonteTextoQuestoes);
  textSize(18);
  textAlign(LEFT, CENTER);
  text(label, x + 18, y + h/2);
}

void drawAnswerButton(float x, float y, float w, float h, String label, color baseColor, color hoverColor){

  if(mouseOver(x, y, w, h)){

    fill(hoverColor);

  } else {

    fill(baseColor);
  }

  stroke(0);
  strokeWeight(4);
  rect(x, y, w, h, 20);

  fill(255);
  textAlign(CENTER, CENTER);
  textFont(fonteTextoQuestoes);
  textSize(18);
  text(label, x + w/2, y + h/2);
}

void handleAnswersMousePressed(){

  if(paginaResposta < perguntas.length){

    handleAnswerPageClick();

  } else {

    handleAprofundeSeClick();
  }
}

void handleAnswerPageClick(){

  if(mouseOver(width - 200, height - 100, 175, 75)){

    if(paginaResposta < perguntas.length - 1){

      paginaResposta++;

    } else {

      paginaResposta = perguntas.length;
    }

  } else if(mouseOver(25, height - 100, 175, 75)){

    if(paginaResposta == 0){

      questionsState = QUESTIONS_FINISHED;
      screen = QUESTIONS;

    } else {

      paginaResposta--;
    }
  }
}

void handleAprofundeSeClick(){

  for(int i = 0; i < linksAprofundeLabels.length; i++){

    if(mouseOver(50, 220 + i * 100, practiceButtonWidth(i), 44)){

      link(linksAprofundeUrls[i]);
      return;
    }
  }

  if(mouseOver(25, height - 100, 175, 75)){

    paginaResposta = perguntas.length - 1;

  } else if(mouseOver(width - 220, height - 100, 195, 75)){

    resetQuestions();
    screen = QUESTIONS;
  }
}

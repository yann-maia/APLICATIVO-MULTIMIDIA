int answerPage = 0;
PImage procelSealImage;
PImage kwToKwhImage;
PImage ledIncandescentImage;
PImage tariffFlagsImage;

String[] correctAnswers = {
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

String[] answerExplanations = {
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

String[] practiceMoreLabels = {
  "Exerc\u00edcios da Brasil Escola",
  "Exerc\u00edcios da SEDUC (ignorar quest\u00e3o 14)",
  "Exerc\u00edcios da ProCampus Educa\u00e7\u00e3o"
};

String[] practiceMoreUrls = {
  "https://exercicios.brasilescola.uol.com.br/exercicios-fisica/exercicios-sobre-energia-eletrica.htm",
  "https://portal.educacao.go.gov.br/wp-content/uploads/2021/06/Atividade-11-8o-ano-Ciencias-da-natureza-Revisa%CC%83o.pdf",
  "https://www.procampuseducacao.com.br/wp-content/uploads/2020/04/8%C2%BA-Ano-Trabalhos-de-Ci%C3%AAncias-Ensino-Remoto.pdf"
};

void resetAnswers(){

  answerPage = 0;
}

void drawAnswers(){

  background(answersBackground);

  if(answerPage < perguntas.length){

    drawAnswerPage(answerPage);

  } else {

    drawPracticeMore();
  }

  backButton.display();
}


void ensureAnswerImagesLoaded(){

  if(procelSealImage == null){

    procelSealImage = loadImage("Selo Procel.png");
  }

  if(kwToKwhImage == null){

    kwToKwhImage = loadImage("kW para kWh.png");
  }

  if(ledIncandescentImage == null){

    ledIncandescentImage = loadImage("LED x Incandescente.png");
  }

  if(tariffFlagsImage == null){

    tariffFlagsImage = loadImage("bandeiras tarifarias.jpg");
  }
}
void drawAnswerPage(int index){

  ensureAnswerImagesLoaded();

  boolean showProcelImage = index == 2 && procelSealImage != null;
  boolean showKwImage = index == 3 && kwToKwhImage != null;
  boolean showLedImage = index == 4 && ledIncandescentImage != null;
  boolean showTariffFlagsImage = index == 6 && tariffFlagsImage != null;
  boolean showWideImage = showKwImage || showLedImage || showTariffFlagsImage;
  boolean showSideImage = showProcelImage || showWideImage;
  float answerTextWidth = showWideImage ? width - 560 : (showProcelImage ? width - 470 : width - 120);
  float imageX = showTariffFlagsImage ? width - 455 : (showWideImage ? width - 400 : width - 330);
  float imageY = showWideImage ? 210 : 215;
  float imageW = showTariffFlagsImage ? 430 : (showWideImage ? 360 : 250);
  float imageH = showTariffFlagsImage ? 225 : (showWideImage ? 200 : 190);

  fill(answersText);
  textAlign(LEFT);

  textFont(fonteTituloQuestoes);
  textSize(40);
  text("GABARITO QUESTÃO " + (index + 1) + ":", 50, 70);

  textFont(fonteTextoQuestoes);
  textSize(24);
  textLeading(31);
  text(
    "'" + perguntas[index] + "'",
    50,
    120,
    width - 140,
    110
  );

  textSize(25);
  fill(answerColor(index));
  boolean useSideBySideAnswers = index >= 5 && shouldShowUserAnswer(index);
  float correctAnswerY = index >= 5 ? 220 : 245;
  float userAnswerY = useSideBySideAnswers ? correctAnswerY : 305;
  float correctAnswerW = useSideBySideAnswers ? width * 0.43 : answerTextWidth;
  float userAnswerX = useSideBySideAnswers ? width * 0.53 : 50;
  float userAnswerW = useSideBySideAnswers ? width * 0.40 : answerTextWidth;

  if(index == 6){

    text("Resposta correta:\n" + correctAnswers[index], 50, 195, width - 120, 154);

  } else {

    text("Resposta correta: " + correctAnswers[index], 50, correctAnswerY, correctAnswerW, 130);
  }

  float explanationY = 360;

  if(shouldShowUserAnswer(index)){

    fill(userAnswerColor(index));
    text(
      "Sua resposta: " + userAnswerText(index),
      userAnswerX,
      userAnswerY,
      userAnswerW,
      80
    );

    explanationY = useSideBySideAnswers ? 315 : 410;
  }

  if(showProcelImage){

    image(procelSealImage, imageX, imageY, imageW, imageH);
  }

  if(showKwImage){

    image(kwToKwhImage, imageX, imageY, imageW, imageH);
  }

  if(showLedImage){

    image(ledIncandescentImage, imageX, imageY, imageW, imageH);
  }

  if(showTariffFlagsImage){

    image(tariffFlagsImage, imageX, imageY, imageW, imageH);
  }

  if(index == 6){

    explanationY = 365;
  }

  if(index == 8 || index == 9){

    explanationY = 285;
  }

  fill(answersText);
  textSize(19);
  textLeading(25);

  if(index == 8 || index == 9){

    drawSplitExplanation(index, explanationY);
    drawAnswerNavigation();
    return;
  }

  text(
    "Explicação:\n\n" + answerExplanations[index],
    50,
    explanationY,
    width - 120,
    height - explanationY - 130
  );

  drawAnswerNavigation();
}

void drawSplitExplanation(int index, float y){

  String[] parts = split(answerExplanations[index], "\n\n");
  int halfIndex = ceil(parts.length / 2.0);
  float columnGap = 35;
  float columnW = (width - 120 - columnGap) / 2;
  float textY = y + 38;

  text("ExplicaÃ§Ã£o:", 50, y);

  textAlign(LEFT, TOP);
  textSize(18);
  textLeading(23);

  text(
    joinExplanationParts(parts, 0, halfIndex),
    50,
    textY,
    columnW,
    height - textY - 125
  );

  text(
    joinExplanationParts(parts, halfIndex, parts.length),
    50 + columnW + columnGap,
    textY,
    columnW,
    height - textY - 125
  );
}

String joinExplanationParts(String[] parts, int start, int end){

  String textValue = "";

  for(int i = start; i < end; i++){

    if(textValue.length() > 0){

      textValue += "\n\n";
    }

    textValue += parts[i];
  }

  return textValue;
}

boolean shouldShowUserAnswer(int index){

  return index != 6;
}

String userAnswerText(int index){

  int selectedAnswer = respostasEscolhidas[index];

  if(selectedAnswer == -1){

    return "Não respondida";
  }

  return alternativas[index][selectedAnswer];
}

color userAnswerColor(int index){

  return color(answersText);
}

color answerColor(int index){

  if(index <= 4){

    if(respostas[index] == 0){

      return answersCorrect;
    }

    return answersWrong;
  }

  return answersBlueButton;
}

void drawAnswerNavigation(){

  String leftLabel = "Questão anterior";
  String rightLabel = "Próxima questão";
  color leftBaseColor = answersRedButton;
  color leftHoverColor = answersRedHover;
  color rightBaseColor = answersBlueButton;
  color rightHoverColor = answersBlueHover;

  if(answerPage == 0){

    leftLabel = "Pontuação";
    leftBaseColor = color(120, 170, 120);
    leftHoverColor = color(140, 190, 140);
  }

  if(answerPage == perguntas.length - 1){

    rightLabel = "Pratique mais";
    rightBaseColor =  color(210, 155, 90);
    rightHoverColor =  color(225, 175, 110);
  }

  drawAnswerButton(
    25,
    height - 100,
    175,
    75,
    leftLabel,
    leftBaseColor,
    leftHoverColor
  );

  drawAnswerButton(
    width - 200,
    height - 100,
    175,
    75,
    rightLabel,
    rightBaseColor,
    rightHoverColor
  );
}

void drawPracticeMore(){

  fill(answersText);

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

  for(int i = 0; i < practiceMoreLabels.length; i++){

    drawPracticeButton(
      50,
      220 + i * 100,
      practiceButtonWidth(i),
      44,
      practiceMoreLabels[i]
    );
  }

  textSize(22);

  fill(answersText);

  textAlign(LEFT, TOP);

  text(
    "(Dica: utilize uma IA de sua prefer\u00eancia para corrigir suas respostas.)",
    50,
    490,
    width - 120,
    90
  );

  drawAnswerButton(
    25,
    height - 100,
    175,
    75,
    "Voltar",
    answersRedButton,
    answersRedHover
  );

  drawAnswerButton(
    width - 220,
    height - 100,
    195,
    75,
    "Refazer quiz",
    color(210, 155, 90),
    color(225, 175, 110)
  );
}

float practiceButtonWidth(int index){

  if(index == 0){

    return 270;
  }

  if(index == 1){

    return 450;
  }

  return 360;
}

void drawPracticeButton(
  float x,
  float y,
  float w,
  float h,
  String label
){

  if(mouseOver(x, y, w, h)){

    fill(practiceButtonHover);

  } else {

    fill(practiceButtonColor);
  }

  noStroke();

  rect(x, y, w, h, 20);

  fill(255);

  textFont(fonteTextoQuestoes);
  textSize(18);

  textAlign(LEFT, CENTER);

  text(label, x + 18, y + h/2);
}

void drawAnswerButton(
  float x,
  float y,
  float w,
  float h,
  String label,
  color baseColor,
  color hoverColor
){

  if(mouseOver(x, y, w, h)){

    fill(hoverColor);

  } else {

    fill(baseColor);
  }

  stroke(answersText);
  strokeWeight(4);

  rect(x, y, w, h, 20);

  fill(255);

  textAlign(CENTER, CENTER);

  textFont(fonteTextoQuestoes);
  textSize(18);

  text(label, x + w/2, y + h/2);
}

void handleAnswersMousePressed(){

  if(answerPage < perguntas.length){

    handleAnswerPageClick();

  } else {

    handlePracticeMoreClick();
  }
}

void handleAnswerPageClick(){

  if(mouseOver(width - 200, height - 100, 175, 75)){

    if(answerPage < perguntas.length - 1){

      answerPage++;

    } else {

      answerPage = perguntas.length;
    }

  } else if(mouseOver(25, height - 100, 175, 75)){

    if(answerPage == 0){

      questionsState = QUESTIONS_FINISHED;
      screen = QUESTIONS;

    } else {

      answerPage--;
    }
  }
}

void handlePracticeMoreClick(){

  for(int i = 0; i < practiceMoreLabels.length; i++){

    if(mouseOver(50, 220 + i * 100, practiceButtonWidth(i), 44)){

      link(practiceMoreUrls[i]);
      return;
    }
  }

  if(mouseOver(25, height - 100, 175, 75)){

    answerPage = perguntas.length - 1;

  } else if(mouseOver(width - 220, height - 100, 195, 75)){

    resetQuestions();
    screen = QUESTIONS;
  }
}

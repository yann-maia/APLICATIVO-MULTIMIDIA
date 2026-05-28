String creditsFormUrl = "https://docs.google.com/forms/d/e/1FAIpQLSfH_7Em7GYxZwA2c6TfvZxOPaDwU_WdgWtOBDcxglC9nOiSdg/viewform";

String[] linhasCreditos = {
  "Arthur Torres - Estrutura de navega\u00e7\u00e3o",
  "Iago da Silva e Thiago Hecke - Desenvolvimento das telas de teoria",
  "Kaique - Desenvolvimento da tela de revis\u00e3o",
  "Matheus Almerim - Desenvolvimento das telas de quest\u00f5es",
  "Yanni Maia - Desenvolvimento das telas de gabarito",
  "Davi Sequinel - Pesquisa sobre a mat\u00e9ria 'Consumo de Energia'"
};

void drawCredits(){

  credits.drawScreen();

  drawTitle("CR\u00c9DITOS");

  fill(255);
  textAlign(LEFT);
  textSize(22);

  for(int i = 0; i < linhasCreditos.length; i++){

    text(
      linhasCreditos[i],
      width * 0.16,
      height * 0.20 + i * height * 0.055,
      width * 0.72,
      height * 0.045
    );
  }

  textSize(21);
  textLeading(28);
  text(
    "Muito obrigado por ter complementado o seu estudo utilizando nosso aplicativo!\n\n"
    + "Por favor, n\u00e3o deixe de responder o formul\u00e1rio abaixo deixando sua avalia\u00e7\u00e3o e sugest\u00f5es de melhoria. Sua opini\u00e3o \u00e9 muito importante para a gente!",
    width * 0.16,
    height * 0.58,
    width * 0.68,
    height * 0.18
  );

  drawCreditsFormButton();
  backButton.display();
}

void drawCreditsFormButton(){

  float x = width * 0.16;
  float y = height * 0.80;
  float w = 360;
  float h = 52;

  if(mouseOver(x, y, w, h)){

    fill(175, 20, 75);

  } else {

    fill(120, 0, 45);
  }

  noStroke();
  rect(x, y, w, h, 20);

  fill(255);
  textAlign(LEFT, CENTER);
  textSize(20);
  text("Responder formul\u00e1rio", x + 20, y + h/2);
}

void handleCreditsMousePressed(){

  float x = width * 0.16;
  float y = height * 0.80;
  float w = 360;
  float h = 52;

  if(mouseOver(x, y, w, h)){

    link(creditsFormUrl);
  }
}

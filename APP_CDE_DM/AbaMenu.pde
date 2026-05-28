void drawMenu(){

  intro.drawScreen();

  fill(255);
  textAlign(CENTER);
  textFont(createFont("Times New Roman", height * 0.045));
  textSize(height * 0.045);
  text(
    "Consumo de Energia El\u00e9trica - 8\u00b0 Ano",
    width * 0.5,
    height * 0.105
  );

  for(Button b : menuButtons){

    b.display();
  }

  textFont(createFont("Times New Roman", height * 0.028));
  textSize(height * 0.028);
  text(
    "Projeto Extensionista - Extens\u00e3o Universit\u00e1ria PUCPR",
    width * 0.5,
    height * 0.56
  );

  textFont(createFont("SansSerif", 16));
}

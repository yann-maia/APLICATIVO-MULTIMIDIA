String[] topicosSumario = {
  "Pot\u00eancia el\u00e9trica e suas unidades de medida",
  "C\u00e1lculo do consumo de energia em kWh",
  "Convers\u00e3o entre watts, quilowatts e horas de uso",
  "Efici\u00eancia energ\u00e9tica, Selo Procel e escolha de aparelhos",
  "Bandeiras tarif\u00e1rias e impacto no valor da conta de luz"
};

void drawSummary(){

  summary.drawScreen();

  drawTitle("SUM\u00c1RIO");

  fill(255);
  textAlign(LEFT);
  textSize(28);
  text(
    "Principais conte\u00fados trabalhados:",
    width * 0.18,
    height * 0.24
  );

  textSize(24);

  for(int i = 0; i < topicosSumario.length; i++){

    text(
      "- " + topicosSumario[i],
      width * 0.22,
      height * 0.34 + i * height * 0.085,
      width * 0.60,
      height * 0.06
    );
  }

  backButton.display();
}

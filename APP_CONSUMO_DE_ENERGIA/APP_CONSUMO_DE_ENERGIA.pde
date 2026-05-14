int tela = 0;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);

  if (tela == 0) {
    telaIntroducao();
  } else if (tela == 1) {
    telaSumario();
  } else if (tela == 2) {
    telaPrincipal();
  } else if (tela == 3) {
    telaTeoria();
  } else if (tela == 4) {
    telaQuestoes();
  } else if (tela == 5) {
    telaRespostas();
  } else if (tela == 6) {
    telaRevisao();
  } else if (tela == 7) {
    telaCreditos();
  }
  
}

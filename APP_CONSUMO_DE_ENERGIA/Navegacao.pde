int tela = 0;

void controlarTelas(){
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

void controlarCliques(){
  if (tela == 0){
    cliqueIntroducao();
  } else if (tela == 1){
    cliqueSumario();
  } else if (tela == 2){
    cliquePrincipal();
  } else if (tela == 3){
    cliqueTeoria();
  } else if (tela == 4){
    cliqueQuestoes();
  } else if (tela == 5){
    cliqueRespostas();
  } else if (tela == 6){
    cliqueRevisao();
  } else if (tela == 7){
    cliqueCreditos();
  }
}

import controlP5.*;

ControlP5 cp5;

Textlabel quizTitle;
Textlabel quizSubtitle;

Textlabel summaryTitle;
Textlabel summarySection1;
Textlabel summarySection2;
Textlabel summarySection3;
Textlabel summarySection4;
Textlabel summarySection5;
Textlabel summarySection6;
Textlabel summarySection7;
Textlabel summarySubtitle1;
Textlabel summarySubtitle2;
Textlabel summarySubtitle3;
Textlabel summarySubtitle4;
Textlabel summarySubtitle5;
Textlabel summarySubtitle6;
Textlabel summarySubtitle7;

Textlabel creditsTitle;
Textlabel creditsAuthor1;
Textlabel creditsAuthor2;
Textlabel creditsAuthor3;
Textlabel creditsAuthor4;
Textlabel creditsAuthor5;
Textlabel creditsAuthor6;
Textlabel creditsAuthor7;
Textlabel creditsRole1;
Textlabel creditsRole2;
Textlabel creditsRole3;
Textlabel creditsRole4;
Textlabel creditsRole5;
Textlabel creditsRole6;
Textlabel creditsRole7;

void setupUI() {

  cp5 = new ControlP5(this);

  setupSummaryUI();
  setupQuizUI();
  setupCreditsUI();
  
}

void setupQuizUI() {

  quizTitle = cp5.addTextlabel("quizTitle")
    .setText("QUIZ DE ENERGIA ELÉTRICA")
    .setColorValue(color(255))
    .setFont(createFont("Times New Roman", 32))
    .setPosition(width * 0.30, height * 0.18);

  quizSubtitle = cp5.addTextlabel("quizSubtitle")
    .setText("Teste seus conhecimentos")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.32, height * 0.24);
}

void updateQuizUI() {

  if (quizTitle != null) {

    quizTitle.setPosition(width * 0.30, height * 0.18);
    quizTitle.setFont(createFont("Arial", height * 0.04));
  }

  if (quizSubtitle != null) {

    quizSubtitle.setPosition(width * 0.32, height * 0.24);
    quizSubtitle.setFont(createFont("Arial", height * 0.022));
  }
}

void showQuizUI() {

  if (quizTitle != null) quizTitle.setVisible(true);
  if (quizSubtitle != null) quizSubtitle.setVisible(true);
}

void hideQuizUI() {

  if (quizTitle != null) quizTitle.setVisible(false);
  if (quizSubtitle != null) quizSubtitle.setVisible(false);
}

void setupSummaryUI() {

  summarySection1 = cp5.addTextlabel("summarySection1")
    .setText("1. Início")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.26, height * 0.22);

  summarySubtitle1 = cp5.addTextlabel("summarySubtitle1")
    .setText("Tela principal do sistema")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.26, height * 0.27);

  summarySection2 = cp5.addTextlabel("summarySection2")
    .setText("2. Sumário")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.26, height * 0.38);

  summarySubtitle2 = cp5.addTextlabel("summarySubtitle2")
    .setText("Organização do conteúdo")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.26, height * 0.43);

  summarySection3 = cp5.addTextlabel("summarySection3")
    .setText("3. Créditos")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.26, height * 0.54);

  summarySubtitle3 = cp5.addTextlabel("summarySubtitle3")
    .setText("Autores e contribuições")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.26, height * 0.59);

  summarySection4 = cp5.addTextlabel("summarySection4")
    .setText("4. Teoria")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.26, height * 0.70);

  summarySubtitle4 = cp5.addTextlabel("summarySubtitle4")
    .setText("Explicações e conceitos")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.26, height * 0.75);

  summarySection5 = cp5.addTextlabel("summarySection5")
    .setText("5. Questões")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.58, height * 0.22);

  summarySubtitle5 = cp5.addTextlabel("summarySubtitle5")
    .setText("Teste seus conhecimentos")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.58, height * 0.27);

  summarySection6 = cp5.addTextlabel("summarySection6")
    .setText("6. Respostas")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.58, height * 0.38);

  summarySubtitle6 = cp5.addTextlabel("summarySubtitle6")
    .setText("Correção das atividades")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.58, height * 0.43);

  summarySection7 = cp5.addTextlabel("summarySection7")
    .setText("7. Revisão")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 32))
    .setPosition(width * 0.58, height * 0.54);

  summarySubtitle7 = cp5.addTextlabel("summarySubtitle7")
    .setText("Resumo rápido do conteúdo")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 22))
    .setPosition(width * 0.58, height * 0.59);
}

void updateSummaryUI() {

  // ESQUERDA
  if (summarySection1 != null) {
    summarySection1.setPosition(width * 0.26, height * 0.22);
    summarySection1.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle1 != null) {
    summarySubtitle1.setPosition(width * 0.26, height * 0.27);
    summarySubtitle1.setFont(createFont("Arial", height * 0.026));
  }

  if (summarySection2 != null) {
    summarySection2.setPosition(width * 0.26, height * 0.38);
    summarySection2.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle2 != null) {
    summarySubtitle2.setPosition(width * 0.26, height * 0.43);
    summarySubtitle2.setFont(createFont("Arial", height * 0.026));
  }

  if (summarySection3 != null) {
    summarySection3.setPosition(width * 0.26, height * 0.54);
    summarySection3.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle3 != null) {
    summarySubtitle3.setPosition(width * 0.26, height * 0.59);
    summarySubtitle3.setFont(createFont("Arial", height * 0.026));
  }

  if (summarySection4 != null) {
    summarySection4.setPosition(width * 0.26, height * 0.70);
    summarySection4.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle4 != null) {
    summarySubtitle4.setPosition(width * 0.26, height * 0.75);
    summarySubtitle4.setFont(createFont("Arial", height * 0.026));
  }

  // DIREITA
  if (summarySection5 != null) {
    summarySection5.setPosition(width * 0.58, height * 0.22);
    summarySection5.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle5 != null) {
    summarySubtitle5.setPosition(width * 0.58, height * 0.27);
    summarySubtitle5.setFont(createFont("Arial", height * 0.026));
  }

  if (summarySection6 != null) {
    summarySection6.setPosition(width * 0.58, height * 0.38);
    summarySection6.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle6 != null) {
    summarySubtitle6.setPosition(width * 0.58, height * 0.43);
    summarySubtitle6.setFont(createFont("Arial", height * 0.026));
  }

  if (summarySection7 != null) {
    summarySection7.setPosition(width * 0.58, height * 0.54);
    summarySection7.setFont(createFont("Arial", height * 0.038));
  }

  if (summarySubtitle7 != null) {
    summarySubtitle7.setPosition(width * 0.58, height * 0.59);
    summarySubtitle7.setFont(createFont("Arial", height * 0.026));
  }
}

void showSummaryUI() {

  if (summarySection1 != null) summarySection1.setVisible(true);
  if (summarySubtitle1 != null) summarySubtitle1.setVisible(true);

  if (summarySection2 != null) summarySection2.setVisible(true);
  if (summarySubtitle2 != null) summarySubtitle2.setVisible(true);

  if (summarySection3 != null) summarySection3.setVisible(true);
  if (summarySubtitle3 != null) summarySubtitle3.setVisible(true);

  if (summarySection4 != null) summarySection4.setVisible(true);
  if (summarySubtitle4 != null) summarySubtitle4.setVisible(true);

  if (summarySection5 != null) summarySection5.setVisible(true);
  if (summarySubtitle5 != null) summarySubtitle5.setVisible(true);

  if (summarySection6 != null) summarySection6.setVisible(true);
  if (summarySubtitle6 != null) summarySubtitle6.setVisible(true);

  if (summarySection7 != null) summarySection7.setVisible(true);
  if (summarySubtitle7 != null) summarySubtitle7.setVisible(true);
}

void hideSummaryUI() {

  if (summarySection1 != null) summarySection1.setVisible(false);
  if (summarySubtitle1 != null) summarySubtitle1.setVisible(false);

  if (summarySection2 != null) summarySection2.setVisible(false);
  if (summarySubtitle2 != null) summarySubtitle2.setVisible(false);

  if (summarySection3 != null) summarySection3.setVisible(false);
  if (summarySubtitle3 != null) summarySubtitle3.setVisible(false);

  if (summarySection4 != null) summarySection4.setVisible(false);
  if (summarySubtitle4 != null) summarySubtitle4.setVisible(false);

  if (summarySection5 != null) summarySection5.setVisible(false);
  if (summarySubtitle5 != null) summarySubtitle5.setVisible(false);

  if (summarySection6 != null) summarySection6.setVisible(false);
  if (summarySubtitle6 != null) summarySubtitle6.setVisible(false);

  if (summarySection7 != null) summarySection7.setVisible(false);
  if (summarySubtitle7 != null) summarySubtitle7.setVisible(false);
}

void setupCreditsUI() {

  creditsAuthor1 = cp5.addTextlabel("creditsAuthor1")
    .setText("Arthur Marques Torres")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.18, height * 0.18);

  creditsRole1 = cp5.addTextlabel("creditsRole1")
    .setText("Programação")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.18, height * 0.23);

  creditsAuthor2 = cp5.addTextlabel("creditsAuthor2")
    .setText("Davi Sequinel Pereira")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.55, height * 0.18);

  creditsRole2 = cp5.addTextlabel("creditsRole2")
    .setText("Pesquisa")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.55, height * 0.23);
    
  creditsAuthor3 = cp5.addTextlabel("creditsAuthor3")
    .setText("Iago Piaceski da Silva")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.18, height * 0.38);

  creditsRole3 = cp5.addTextlabel("creditsRole3")
    .setText("Aba Teoria")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.18, height * 0.43);

  creditsAuthor4 = cp5.addTextlabel("creditsAuthor4")
    .setText("Kaique Eduardo de Abreu Buchoski")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.55, height * 0.38);

  creditsRole4 = cp5.addTextlabel("creditsRole4")
    .setText("Aba Revisão")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.55, height * 0.43);

  creditsAuthor5 = cp5.addTextlabel("creditsAuthor5")
    .setText("Matheus Almerim de Campos")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.18, height * 0.58);

  creditsRole5 = cp5.addTextlabel("creditsRole5")
    .setText("Aba Questões")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.18, height * 0.63);

  creditsAuthor6 = cp5.addTextlabel("creditsAuthor6")
    .setText("Tiago Serrano Campelo Hecke")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.55, height * 0.58);

  creditsRole6 = cp5.addTextlabel("creditsRole6")
    .setText("Aba Teoria")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.55, height * 0.63);

  creditsAuthor7 = cp5.addTextlabel("creditsAuthor7")
    .setText("Yanni Maia")
    .setColorValue(color(255))
    .setFont(createFont("Arial", 24))
    .setPosition(width * 0.18, height * 0.78);

  creditsRole7 = cp5.addTextlabel("creditsRole7")
    .setText("Programação")
    .setColorValue(color(180))
    .setFont(createFont("Arial", 18))
    .setPosition(width * 0.18, height * 0.83);
}

void updateCreditsUI() {

  if (creditsAuthor1 != null) {
    creditsAuthor1.setPosition(width * 0.18, height * 0.18);
    creditsAuthor1.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole1 != null) {
    creditsRole1.setPosition(width * 0.18, height * 0.23);
    creditsRole1.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor2 != null) {
    creditsAuthor2.setPosition(width * 0.55, height * 0.18);
    creditsAuthor2.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole2 != null) {
    creditsRole2.setPosition(width * 0.55, height * 0.23);
    creditsRole2.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor3 != null) {
    creditsAuthor3.setPosition(width * 0.18, height * 0.38);
    creditsAuthor3.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole3 != null) {
    creditsRole3.setPosition(width * 0.18, height * 0.43);
    creditsRole3.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor4 != null) {
    creditsAuthor4.setPosition(width * 0.55, height * 0.38);
    creditsAuthor4.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole4 != null) {
    creditsRole4.setPosition(width * 0.55, height * 0.43);
    creditsRole4.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor5 != null) {
    creditsAuthor5.setPosition(width * 0.18, height * 0.58);
    creditsAuthor5.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole5 != null) {
    creditsRole5.setPosition(width * 0.18, height * 0.63);
    creditsRole5.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor6 != null) {
    creditsAuthor6.setPosition(width * 0.55, height * 0.58);
    creditsAuthor6.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole6 != null) {
    creditsRole6.setPosition(width * 0.55, height * 0.63);
    creditsRole6.setFont(createFont("Arial", height * 0.022));
  }

  if (creditsAuthor7 != null) {
    creditsAuthor7.setPosition(width * 0.18, height * 0.78);
    creditsAuthor7.setFont(createFont("Arial", height * 0.032));
  }

  if (creditsRole7 != null) {
    creditsRole7.setPosition(width * 0.18, height * 0.83);
    creditsRole7.setFont(createFont("Arial", height * 0.022));
  }
}

void showCreditsUI() {

  if (creditsAuthor1 != null) creditsAuthor1.setVisible(true);
  if (creditsRole1 != null) creditsRole1.setVisible(true);

  if (creditsAuthor2 != null) creditsAuthor2.setVisible(true);
  if (creditsRole2 != null) creditsRole2.setVisible(true);

  if (creditsAuthor3 != null) creditsAuthor3.setVisible(true);
  if (creditsRole3 != null) creditsRole3.setVisible(true);

  if (creditsAuthor4 != null) creditsAuthor4.setVisible(true);
  if (creditsRole4 != null) creditsRole4.setVisible(true);

  if (creditsAuthor5 != null) creditsAuthor5.setVisible(true);
  if (creditsRole5 != null) creditsRole5.setVisible(true);

  if (creditsAuthor6 != null) creditsAuthor6.setVisible(true);
  if (creditsRole6 != null) creditsRole6.setVisible(true);

  if (creditsAuthor7 != null) creditsAuthor7.setVisible(true);
  if (creditsRole7 != null) creditsRole7.setVisible(true);
}

void hideCreditsUI() {

  if (creditsAuthor1 != null) creditsAuthor1.setVisible(false);
  if (creditsRole1 != null) creditsRole1.setVisible(false);

  if (creditsAuthor2 != null) creditsAuthor2.setVisible(false);
  if (creditsRole2 != null) creditsRole2.setVisible(false);

  if (creditsAuthor3 != null) creditsAuthor3.setVisible(false);
  if (creditsRole3 != null) creditsRole3.setVisible(false);

  if (creditsAuthor4 != null) creditsAuthor4.setVisible(false);
  if (creditsRole4 != null) creditsRole4.setVisible(false);

  if (creditsAuthor5 != null) creditsAuthor5.setVisible(false);
  if (creditsRole5 != null) creditsRole5.setVisible(false);

  if (creditsAuthor6 != null) creditsAuthor6.setVisible(false);
  if (creditsRole6 != null) creditsRole6.setVisible(false);

  if (creditsAuthor7 != null) creditsAuthor7.setVisible(false);
  if (creditsRole7 != null) creditsRole7.setVisible(false);
}

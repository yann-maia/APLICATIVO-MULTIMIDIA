int telaTeoria = 1;

float virarTeoria = 0;
boolean animandoTeoria = false;

int direcaoTeoria = 1;

PFont fonteTituloTeoria;
PFont fonteSubtituloTeoria;
PFont fonteTextoTeoria;

int livroTeoriaL = 1250;
int livroTeoriaA = 730;

int livroTeoriaX;
int livroTeoriaY;

void setupTheory(){

  fonteTituloTeoria = createFont("Times New Roman", 46);
  fonteSubtituloTeoria = createFont("Times New Roman", 28);
  fonteTextoTeoria = createFont("Verdana", 20);

  livroTeoriaX = width/2 - livroTeoriaL/2;
  livroTeoriaY = height/2 - livroTeoriaA/2;
}

void drawTheory(){

  background(theoryBackground);

  for(int i = 0; i < width; i += 35){

    stroke(120, 85, 55, 45);
  }

  noStroke();

  // SOMBRA
  fill(0, 45);

  rect(
    livroTeoriaX + 22,
    livroTeoriaY + 22,
    livroTeoriaL,
    livroTeoriaA,
    30
  );

  // CAPA
  fill(theoryBook);

  rect(
    livroTeoriaX,
    livroTeoriaY,
    livroTeoriaL,
    livroTeoriaA,
    30
  );

  // DETALHES
  stroke(180, 140, 70);
  strokeWeight(4);

  line(
    livroTeoriaX + 35,
    livroTeoriaY + 35,
    livroTeoriaX + livroTeoriaL - 35,
    livroTeoriaY + 35
  );

  line(
    livroTeoriaX + 35,
    livroTeoriaY + livroTeoriaA - 35,
    livroTeoriaX + livroTeoriaL - 35,
    livroTeoriaY + livroTeoriaA - 35
  );

  noStroke();

  // PÁGINA
  fill(theoryPage);

  int paginaX = livroTeoriaX + 45;
  int paginaY = livroTeoriaY + 45;
  int paginaL = livroTeoriaL - 90;
  int paginaA = livroTeoriaA - 90;

  rect(
    paginaX,
    paginaY,
    paginaL,
    paginaA,
    14
  );

  int centroLivro = livroTeoriaX + livroTeoriaL/2;

  stroke(190, 170, 140);
  strokeWeight(2);

  line(
    centroLivro,
    paginaY,
    centroLivro,
    paginaY + paginaA
  );

  // PÁGINAS
  if(telaTeoria == 1){
    paginaTeoria1();
  }

  if(telaTeoria == 2){
    paginaTeoria2();
  }

  if(telaTeoria == 3){
    paginaTeoria3();
  }

  if(telaTeoria == 4){
    paginaTeoria4();
  }

  // ANIMAÇÃO
  if(animandoTeoria){

    virarTeoria += 0.035;

    float larguraFolha = map(
      sin(virarTeoria * HALF_PI),
      0,
      1,
      0,
      paginaL/2
    );

    noStroke();

    fill(
      lerpColor(
        theoryPage,
        color(230,220,200),
        0.5
      )
    );

    rect(
      centroLivro - larguraFolha,
      paginaY,
      larguraFolha,
      paginaA
    );

    fill(0, 25);

    rect(
      centroLivro - larguraFolha,
      paginaY,
      10,
      paginaA
    );

    if(virarTeoria >= 1){

      virarTeoria = 0;
      animandoTeoria = false;

      telaTeoria += direcaoTeoria;

      if(telaTeoria > 4){
        telaTeoria = 1;
      }

      if(telaTeoria < 1){
        telaTeoria = 4;
      }
    }
  }

  backButton.display();
}

void paginaTeoria1(){

  desenharTextoTeoria(
    "P\u00e1gina 1",
    "  F\u00f3rmula b\u00e1sica",
    "  Pot\u00eancia -> medida em W \n"
    + "  1000 W = 1 kW\n\n"
    + "  E = P * t\n"
    + "  E = energia\n"
    + "  P = pot\u00eancia\n"
    + "  t = tempo"
  );
}

void paginaTeoria2(){

  desenharTextoTeoria(
    "P\u00e1gina 2",
    "  Convers\u00f5es",
    "  Convers\u00e3o\n"
    + "  1000 W = 1 kW\n\n"
    + "  Exemplo:\n"
    + "  1 kW * 2 h = 2 kWh"
  );
}

void paginaTeoria3(){

  desenharTextoTeoria(
    "P\u00e1gina 3",
    "  Como calcular o gasto",
    "  C\u00e1lculo:\n\n"
    + "  Verde -> sem taxa\n"
    + "  Amarela -> m\u00e9dia\n"
    + "  Vermelha -> alta"
  );
}

void paginaTeoria4(){

  desenharTextoTeoria(
    "P\u00e1gina 4",
    "  Efici\u00eancia energ\u00e9tica",
    "  Selo Procel A = mais econ\u00f4mico\n"
    + "  LED consome menos energia\n"
    + "  Mais efici\u00eancia = menos gasto\n"
    + "  Incandescente gasta mais energia\n"
    + "  Mais tempo ligado = maior consumo"
  );
}

void desenharTextoTeoria(
  String capitulo,
  String subtituloTexto,
  String conteudo
){

  fill(theoryText);

  textAlign(LEFT, BASELINE);

  textFont(fonteTituloTeoria);
  textSize(46);

  text(
    capitulo,
    livroTeoriaX + 70,
    livroTeoriaY + 150
  );

  textFont(fonteSubtituloTeoria);
  textSize(28);

  text(
    subtituloTexto,
    livroTeoriaX + 70,
    livroTeoriaY + 215
  );

  textFont(fonteTextoTeoria);
  textSize(20);

  text(
    conteudo,
    livroTeoriaX + 70,
    livroTeoriaY + 300
  );

  botaoTeoria();
}

void botaoTeoria(){

  int bxAnterior = livroTeoriaX + 100;
  int by = livroTeoriaY + 575;

  noStroke();

  fill(theoryButton);

  rect(
    bxAnterior,
    by,
    175,
    75,
    15
  );

  fill(255);

  textAlign(CENTER, CENTER);
  textFont(fonteSubtituloTeoria);
  textSize(24);

  text(
    "Anterior",
    bxAnterior + 87,
    by + 37
  );

  int bxProximo = livroTeoriaX + livroTeoriaL - 283;

  fill(theoryButton);

  rect(
    bxProximo,
    by,
    175,
    75,
    15
  );

  fill(255);

  text(
    "Pr\u00f3xima",
    bxProximo + 87,
    by + 37
  );

  textAlign(LEFT, BASELINE);
}

void handleTheoryMousePressed(){

  int by = livroTeoriaY + 575;
  int bxProximo = livroTeoriaX + livroTeoriaL - 283;
  int bxAnterior = livroTeoriaX + 100;

  if(
    mouseX > bxProximo &&
    mouseX < bxProximo + 175 &&
    mouseY > by &&
    mouseY < by + 75
  ){

    if(!animandoTeoria){

      animandoTeoria = true;
      virarTeoria = 0;
      direcaoTeoria = 1;
    }
  }

  if(
    mouseX > bxAnterior &&
    mouseX < bxAnterior + 175 &&
    mouseY > by &&
    mouseY < by + 75
  ){

    if(!animandoTeoria){

      animandoTeoria = true;
      virarTeoria = 0;
      direcaoTeoria = -1;
    }
  }
}

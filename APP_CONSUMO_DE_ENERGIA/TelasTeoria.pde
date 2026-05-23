int tela = 1;

float virar = 0;
boolean animando = false;

int direcao = 1;

PFont titulo;
PFont subtitulo;
PFont texto;

// =========================
// TAMANHO DO LIVRO
// =========================

// LIVRO MAIOR
int livroL = 1250;
int livroA = 730;

int livroX;
int livroY;

// =========================

void setup() {

  fullScreen(JAVA2D);
  smooth(8);

  titulo = createFont("Times New Roman", 46);
  subtitulo = createFont("Times New Roman", 28);
  texto = createFont("Verdana", 20);

  // CENTRALIZA
  livroX = width/2 - livroL/2;
  livroY = height/2 - livroA/2;
}

void draw() {

  // =====================================
  // FUNDO
  // =====================================

   background(225, 210, 190);

  for (int i = 0; i < width; i += 35) {

    stroke(120, 85, 55, 45);
   
  }

  noStroke();

  // =====================================
  // SOMBRA
  // =====================================

  fill(0, 45);

  rect(
    livroX + 22,
    livroY + 22,
    livroL,
    livroA,
    30
  );

  // =====================================
  // CAPA
  // =====================================

  fill(92, 51, 23);

  rect(
    livroX,
    livroY,
    livroL,
    livroA,
    30
  );

  // =====================================
  // DETALHES DOURADOS
  // =====================================

  stroke(180, 140, 70);
  strokeWeight(4);

  line(
    livroX + 35,
    livroY + 35,
    livroX + livroL - 35,
    livroY + 35
  );

  line(
    livroX + 35,
    livroY + livroA - 35,
    livroX + livroL - 35,
    livroY + livroA - 35
  );

  // =====================================
  // PÁGINAS
  // =====================================

  noStroke();

  fill(245, 235, 210);

  int paginaX = livroX + 45;
  int paginaY = livroY + 45;

  int paginaL = livroL - 90;
  int paginaA = livroA - 90;

  rect(
    paginaX,
    paginaY,
    paginaL,
    paginaA,
    14
  );

  // =====================================
  // CENTRO DO LIVRO
  // =====================================

  int centroLivro = livroX + livroL/2;

  stroke(190, 170, 140);
  strokeWeight(2);

  line(
    centroLivro,
    paginaY,
    centroLivro,
    paginaY + paginaA
  );

  // =====================================
  // CONTEÚDO
  // =====================================

  if (tela == 1) {
    pagina1();
  }

  if (tela == 2) {
    pagina2();
  }

  if (tela == 3) {
    pagina3();
  }

  if (tela == 4) {
    pagina4();
  }

  // =====================================
  // ANIMAÇÃO DA PÁGINA
  // =====================================

 if (animando) {

  virar += 0.035;

  float larguraFolha = map(
    sin(virar * HALF_PI),
    0,
    1,
    0,
    paginaL/2
  );
  

  noStroke();
  fill(230, 220, 200);

  rect(centroLivro - larguraFolha, paginaY, larguraFolha, paginaA);

  fill(0, 25);
  rect(centroLivro - larguraFolha, paginaY, 10, paginaA);

  if (virar >= 1) {

    virar = 0;
    animando = false;

    // 🔥 ÚNICO LUGAR QUE MUDA TELA
    tela += direcao;

    if (tela > 4) tela = 1;
    if (tela < 1) tela = 4;
   }
  }
}
// =====================================================
// PÁGINAS
// =====================================================

void pagina1() {

  desenharTexto(
    "Página 1",
    "  Fórmula básica",
    "  Potência -> medida em W \n" 
    + "  1000 W = 1 kW)\n\n"
    + "  E=P*t\n" 
    + "  E = energia\n  "
    + "P = potência\n"
    + "  t = tempo"
  );
}

void pagina2() {

  desenharTexto(
    "Página 2",
    "  Conversões",
    "  Conversão\n"
   + "  1000W=1kW\n\n" 
   + "  Exemplo:\n"
   + "  1kW*2h=2kWh"
  );
}

void pagina3() {

  desenharTexto(
    "Página 3",
    "  Como calcular o gasto",
    "  Cálculo:\n\n"
    + "  Verde -> sem taxa\n"
    + "  Amarela -> média\n"
    + "  Vermelha -> alta\n"
  
  );
}

void pagina4() {

  desenharTexto(
    "Página 4",
    "  Eficiência energética",
    "  Selo Procel A = mais econômico\n"
    + "  LED consome menos energia\n"
    + "  Mais eficiência = menos gasto\n"
    + "  Incandescente gasta mais energia\n"
    + "  Mais tempo ligado = maior consumo"
  );
}

// =====================================================
// TEXTO
// =====================================================

void desenharTexto(
  String capitulo,
  String subtituloTexto,
  String conteudo
) {

  fill(40);

  textFont(titulo);
  textSize(46);

  text(
    capitulo,
    livroX + 70,
    livroY + 150
  );

  textFont(subtitulo);
  textSize(28);

  text(
    subtituloTexto,
    livroX + 70,
    livroY + 215
  );

  textFont(texto);
  textSize(20);

  text(
    conteudo,
    livroX + 70,
    livroY + 300
  );

  botao();
}

// =====================================================
// BOTÃO
// =====================================================

void botao() {

   // =====================================
  // BOTÃO ANTERIOR
  // =====================================

  int bxAnterior = livroX + 100;
  int by = livroY  + 575;

  noStroke();

  fill(110, 70, 45);

  rect(
    bxAnterior,
    by,
    175,
    75,
    15
  );

  fill(255);

  textAlign(CENTER, CENTER);

  textFont(subtitulo);
  textSize(24);

  text(
    "Anterior",
    bxAnterior + 87,
    by + 37
  );

  // =====================================
  // BOTÃO PRÓXIMA
  // =====================================

  int bxProximo = livroX + livroL - 283;

  fill(110, 70, 45);

  rect(
    bxProximo,
    by,
    175,
    75,
    15
  );

  fill(255);

  text(
    "Próxima",
    bxProximo + 87,
    by + 37
  );

  textAlign(LEFT, BASELINE);
}

// =====================================================
// CLIQUE
// =====================================================

void mousePressed() {

  int by = livroY + 575;

  int bxProximo = livroX + livroL - 283;
  int bxAnterior = livroX + 100;

  if (
    mouseX > bxProximo &&
    mouseX < bxProximo + 175 &&
    mouseY > by &&
    mouseY < by + 75
  ) {

    if (!animando) {
      animando = true;
      virar = 0;
      direcao = 1;
    }
  }

  if (
    mouseX > bxAnterior &&
    mouseX < bxAnterior + 175 &&
    mouseY > by &&
    mouseY < by + 75
  ) {

    if (!animando) {
      animando = true;
      virar = 0;
      direcao = -1;
    }
  }

// =========================================================
// DATA — CREDITS
// =========================================================
String creditsFormUrl = "https://docs.google.com/forms/d/e/1FAIpQLSfH_7Em7GYxZwA2c6TfvZxOPaDwU_WdgWtOBDcxglC9nOiSdg/viewform";

String[] creditsLines = {
  "Arthur Torres - Estrutura de navega\u00e7\u00e3o",
  "Iago Piaceski e Thiago Hecke - Desenvolvimento das telas de teoria",
  "Kaique Buchoski - Desenvolvimento da tela de revis\u00e3o",
  "Matheus Almerim - Desenvolvimento das telas de quest\u00f5es",
  "Yanni Maia - Desenvolvimento das telas de gabarito",
  "Davi Sequinel - Pesquisa sobre a mat\u00e9ria 'Consumo de Energia'"
};

// =========================================================
// DATA - SUMMARY
// Prefixo "S:" = título de seção
// Prefixo "I:" = item principal
// Prefixo "T:" = subtópico
// =========================================================

String[] summaryLines = {
  "S:Funcionalidades do app",

  "I:Teoria",
  "T:Pot\u00eancia El\u00e9trica \u2014 f\u00f3rmula P = E \u00f7 t, unidades e derivadas",
  "T:Calculando o Consumo \u2014 Wh, kWh, convers\u00f5es e exerc\u00edcio resolvido",
  "T:Energia no Cotidiano \u2014 transforma\u00e7\u00e3o de energia e aparelhos por faixa",
  "T:Conta de Luz \u2014 kWh, bandeiras tarif\u00e1rias e uso consciente",

  "I:Quest\u00f5es",
  "T:Quiz com 10 perguntas sobre energia el\u00e9trica",
  "T:5 verdadeiro ou falso, 3 m\u00faltipla escolha, 2 de c\u00e1lculo",
  "T:Pontua\u00e7\u00e3o e gr\u00e1fico de resultado ao final",

  "I:Gabarito",
  "T:Resposta e explica\u00e7\u00e3o detalhada de cada quest\u00e3o",
  "T:Links para listas de exerc\u00edcios externos",

  "I:Revis\u00e3o",
  "T:9 flashcards com perguntas e respostas",
  "T:Passe o mouse sobre o card para revelar a resposta",

  "I:Cr\u00e9ditos",
  "T:Equipe e formul\u00e1rio de avalia\u00e7\u00e3o"
};

// =========================================================
// DATA — THEORY
//
// ESTRUTURA DAS 7 PÁGINAS:
//
//  Pág 0 — Potência Elétrica (teoria + fórmula)
//          Direita: Formula.jpeg
//
//  Pág 1 — Consumo de Energia (teoria geral)
//          Direita: texto (exemplos cotidianos)
//
//  Pág 2 — Exercício Passo 1: identificar grandezas e montar a fórmula
//          Direita: Calculo 1.jpeg  (500/20 = P antes de converter)
//
//  Pág 3 — Exercício Passo 2: converter minutos → segundos e recalcular P
//          Direita: Calculo 2-1.jpeg (20×60=1200)
//                   Calculo 2-2.jpeg (500/1200 = P)
//
//  Pág 4 — Exercício Passo 3: calcular consumo mensal em kWh
//          Direita: Calculo 3-1.jpeg (0,42×10×30/1000)
//                   Calculo 3-2.jpeg (zeros simplificados)
//                   Calculo 3-3.jpeg (0,42×3/10 = kWh)
//
//  Pág 5 — Exercício Passo 4: calcular custo em R$
//          Direita: Calculo 4-1.jpeg (42/100 × 80/100)
//                   Calculo 4-2.jpeg (3360/10000 ≈ R$0,3)
//
//  Pág 6 — Conta de Luz e Uso Consciente (conclusão)
//          Direita: texto
// =========================================================

String[] theoryTitles = {
  "Pot\u00eancia El\u00e9trica",
  "Consumo de Energia",
  "Exerc\u00edcio \u2014 Passo 1",
  "Exerc\u00edcio \u2014 Passo 2",
  "Exerc\u00edcio \u2014 Passo 3",
  "Exerc\u00edcio \u2014 Passo 4",
  "Conta de Luz"
};

// ----------------------------------------------------------
// LADO ESQUERDO — teoria e enunciados
// ----------------------------------------------------------
String[] theoryLeft = {

  // Página 0 — Potência Elétrica
  "O que \u00e9 pot\u00eancia el\u00e9trica?\n\n"
  + "A pot\u00eancia el\u00e9trica indica quanta energia\n"
  + "um aparelho utiliza em um certo tempo.\n"
  + "Ela mostra o qu\u00e3o \"forte\" \u00e9 o funcionamento\n"
  + "de um equipamento.\n\n"
  + "F\u00f3rmula:\n\n"
  + "      P = E \u00f7 t\n\n"
  + "  P = pot\u00eancia  (W \u2014 watts)\n"
  + "  E = energia   (J \u2014 joules)\n"
  + "  t = tempo     (s \u2014 segundos)\n\n"
  + "Derivadas da f\u00f3rmula:\n\n"
  + "  E = P \u00d7 t\n"
  + "  t = E \u00f7 P\n\n"
  + "A f\u00f3rmula pode ser lembrada como\n"
  + "\"PET\": P = E \u00f7 t.",

  // Página 1 — Consumo de Energia
  "Como calcular o consumo?\n\n"
  + "Multiplicamos a pot\u00eancia pelo tempo de uso:\n\n"
  + "  Consumo = P \u00d7 t\n\n"
  + "O resultado sai em Wh (watt-hora).\n"
  + "Para converter para kWh, dividimos por 1000:\n\n"
  + "  1000 Wh = 1 kWh\n\n"
  + "A conta de luz usa kWh. Por isso,\n"
  + "antes de calcular o custo, convertemos\n"
  + "watts (W) para quilowatts (kW):\n\n"
  + "  1000 W = 1 kW\n\n"
  + "Aten\u00e7\u00e3o \u00e0s unidades!\n\n"
  + "  t deve estar em horas (h)\n"
  + "  P deve estar em kW\n\n"
  + "Somente assim o resultado ser\u00e1 em kWh.",

  // Página 2 — Exercício Passo 1
  "Exerc\u00edcio completo:\n\n"
  + "Um aparelho gasta 500 J em 20 minutos.\n"
  + "Usado 10 h/dia por 30 dias.\n"
  + "Pre\u00e7o do kWh: R$ 0,80.\n"
  + "Qual o gasto mensal?\n\n"
  + "Passo 1 \u2014 Identificar as grandezas:\n\n"
  + "  Energia = 500 J\n"
  + "  Tempo   = 20 minutos\n"
  + "  Pot\u00eancia = ?\n\n"
  + "Precisamos da pot\u00eancia (n\u00e3o informada),\n"
  + "ent\u00e3o aplicamos a f\u00f3rmula:\n\n"
  + "  P = E \u00f7 t\n\n"
  + "Montamos a conta com os valores dados.\n"
  + "Veja o c\u00e1lculo ao lado \u2192",

  // Página 3 — Exercício Passo 2
  "Passo 2 \u2014 Converter o tempo:\n\n"
  + "A f\u00f3rmula P = E \u00f7 t exige o tempo\n"
  + "em segundos (s).\n\n"
  + "20 minutos n\u00e3o est\u00e3o na unidade correta.\n"
  + "Precisamos converter:\n\n"
  + "  1 minuto = 60 segundos\n"
  + "  20 min \u00d7 60 = 1200 s\n\n"
  + "Agora com os valores corretos:\n\n"
  + "  P = 500 \u00f7 1200\n"
  + "  P \u2248 0,42 W\n\n"
  + "Os c\u00e1lculos est\u00e3o detalhados ao lado \u2192",

  // Página 4 — Exercício Passo 3
  "Passo 3 \u2014 Consumo mensal em kWh:\n\n"
  + "Temos:\n"
  + "  P \u2248 0,42 W\n"
  + "  Uso: 10 h/dia por 30 dias\n\n"
  + "Para converter W \u2192 kW, dividimos por 1000.\n"
  + "O resultado seria muito pequeno, por isso\n"
  + "colocamos tudo em uma express\u00e3o s\u00f3:\n\n"
  + "  kWh = (0,42 \u00d7 10 \u00d7 30) \u00f7 1000\n\n"
  + "H\u00e1 zeros em cima e embaixo da fra\u00e7\u00e3o,\n"
  + "ent\u00e3o simplificamos dividindo por 10:\n\n"
  + "  kWh = (0,42 \u00d7 3) \u00f7 10\n"
  + "  kWh \u2248 0,126 kWh\n\n"
  + "As tr\u00eas etapas do c\u00e1lculo ao lado \u2192",

  // Página 5 — Exercício Passo 4
  "Passo 4 \u2014 Calcular o custo em R$:\n\n"
  + "Temos:\n"
  + "  Consumo \u2248 0,126 kWh\n"
  + "  Pre\u00e7o do kWh = R$ 0,80\n\n"
  + "Custo = kWh \u00d7 pre\u00e7o\n\n"
  + "Como ambos s\u00e3o decimais, convertemos\n"
  + "para fra\u00e7\u00f5es para facilitar:\n\n"
  + "  0,126 \u2248 42/100\n"
  + "  0,80  = 80/100\n\n"
  + "Multiplicamos numeradores e denominadores:\n\n"
  + "  (42 \u00d7 80) \u00f7 (100 \u00d7 100)\n"
  + "  = 3360 \u00f7 10000\n"
  + "  \u2248 R$ 0,30\n\n"
  + "Os c\u00e1lculos com fra\u00e7\u00f5es ao lado \u2192",

  // Página 6 — Conta de Luz e Uso Consciente
  "A conta de luz\n\n"
  + "A conta de luz mostra o consumo mensal\n"
  + "em kWh. As empresas cobram por esse valor.\n\n"
  + "  Custo = consumo (kWh) \u00d7 pre\u00e7o do kWh\n\n"
  + "A conta tamb\u00e9m pode incluir:\n"
  + "  - Impostos\n"
  + "  - Taxas\n"
  + "  - Bandeiras tarif\u00e1rias\n\n"
  + "Bandeiras tarif\u00e1rias:\n\n"
  + "  Verde    \u2192  sem cobran\u00e7a extra\n"
  + "  Amarela  \u2192  pequeno aumento\n"
  + "  Vermelha \u2192  aumento maior\n\n"
  + "Elas existem porque em per\u00edodos de seca,\n"
  + "as hidrel\u00e9tricas produzem menos e\n"
  + "as termel\u00e9tricas (mais caras) assumem."
};

// ----------------------------------------------------------
// LADO DIREITO — texto para páginas sem imagem
// (páginas com imagem ignoram este array no lado direito)
// ----------------------------------------------------------
String[] theoryRight = {

  // Página 0 — direita tem Formula.jpeg (texto ignorado)
  "",

  // Página 1 — Exemplos cotidianos (texto)
  "Exemplos de aparelhos:\n\n"
  + "Baixa pot\u00eancia (at\u00e9 100 W):\n"
  + "  Carregador, l\u00e2mpada LED,\n"
  + "  ventilador pequeno, r\u00e1dio\n\n"
  + "M\u00e9dia pot\u00eancia (100 \u2014 500 W):\n"
  + "  Televis\u00e3o, computador,\n"
  + "  micro-ondas (em espera)\n\n"
  + "Alta pot\u00eancia (acima de 500 W):\n"
  + "  Chuveiro el\u00e9trico, secador,\n"
  + "  ferro de passar, ar-condicionado\n\n"
  + "Aten\u00e7\u00e3o:\n\n"
  + "Um aparelho de baixa pot\u00eancia pode\n"
  + "consumir muita energia se ficar\n"
  + "ligado por muitas horas.\n\n"
  + "A pot\u00eancia fica na etiqueta do aparelho.",

  // Página 2 — direita tem Calculo 1.jpeg (texto ignorado)
  "",

  // Página 3 — direita tem Calculo 2-1 e 2-2 (texto ignorado)
  "",

  // Página 4 — direita tem Calculo 3-1, 3-2, 3-3 (texto ignorado)
  "",

  // Página 5 — direita tem Calculo 4-1 e 4-2 (texto ignorado)
  "",

  // Página 6 — Uso Consciente (texto)
  "Uso consciente da energia:\n\n"
  + "Economizar energia ajuda a reduzir\n"
  + "gastos e preservar recursos naturais.\n\n"
  + "Atitudes simples que fazem a diferen\u00e7a:\n\n"
  + "  \u2022 Apague luzes desnecess\u00e1rias\n"
  + "  \u2022 Desligue aparelhos sem uso\n"
  + "  \u2022 Retire carregadores da tomada\n"
  + "  \u2022 Use l\u00e2mpadas de LED\n"
  + "  \u2022 Reduza o tempo de banho\n\n"
  + "Resultado do exerc\u00edcio:\n\n"
  + "  O aparelho do exemplo gasta cerca\n"
  + "  de R$ 0,30 por m\u00eas no Paran\u00e1 \u2014\n"
  + "  similar ao custo de uma l\u00e2mpada LED."
};

// =========================================================
// DATA — REVIEW (FLASHCARDS)
// =========================================================

String[] reviewQuestions = {
  "Qual \u00e9 a f\u00f3rmula da pot\u00eancia el\u00e9trica?",
  "O que \u00e9 a pot\u00eancia el\u00e9trica?",
  "O que significa cada letra na f\u00f3rmula P = E / t ?",
  "Como calcular energia?",
  "Como calcular o tempo?",
  "Qual a diferen\u00e7a entre pot\u00eancia e consumo de energia?",
  "O que significa cada parte do kWh?",
  "O que influencia no consumo de energia?",
  "O que significa kWh?"
};

String[] reviewAnswers = {
  "P = E / t",
  "Quantidade de energia que um aparelho consome por tempo",
  "P = pot\u00eancia (W)\nE = energia (J)\nt = tempo (s)",
  "E = P x t",
  "t = E / P",
  "Consumo depende do tempo de uso.\nPot\u00eancia \u00e9 o gasto por segundo.",
  "k = mil\nW = pot\u00eancia el\u00e9trica\nh = tempo (hora)",
  "Pot\u00eancia do aparelho e tempo de uso",
  "kWh = energia consumida em 1 hora"
};

// =========================================================
// DATA — QUESTIONS
// =========================================================

class Question {
  String   statement;
  String[] alternatives;
  int      correctAnswer;
  String   answerLabel;
  String   explanation;

  Question(
    String statement,
    String[] alternatives,
    int correctAnswer,
    String answerLabel,
    String explanation
  ) {
    this.statement     = statement;
    this.alternatives  = alternatives;
    this.correctAnswer = correctAnswer;
    this.answerLabel   = answerLabel;
    this.explanation   = explanation;
  }
}

Question[] questions = {

  // 1 - V/F
  new Question(
    "1) Um aparelho desligado da tomada pode continuar consumindo energia.",
    new String[]{"Verdadeiro", "Falso"},
    0,
    "Verdadeiro!",
    "Mesmo desligado, alguns aparelhos continuam consumindo uma pequena\n"
    + "quantidade de energia se permanecerem conectados \u00e0 tomada.\n\n"
    + "Isso acontece porque certos componentes ficam em modo de espera,\n"
    + "como TVs, micro-ondas e carregadores.\n\n"
    + "Esse consumo \u00e9 pequeno, mas ao longo do tempo pode aumentar a conta de luz."
  ),

  // 2 - V/F
  new Question(
    "2) Dois aparelhos com mesma pot\u00eancia sempre consomem a mesma energia.",
    new String[]{"Verdadeiro", "Falso"},
    1,
    "Falso!",
    "Dois aparelhos podem ter a mesma pot\u00eancia, mas consumir quantidades\n"
    + "diferentes de energia dependendo do tempo em que ficam ligados.\n\n"
    + "Por exemplo, dois aparelhos de 1000 W ter\u00e3o consumos diferentes\n"
    + "se um ficar ligado por 1 hora e o outro por 5 horas.\n\n"
    + "O consumo de energia depende da pot\u00eancia e do tempo de uso."
  ),

  // 3 - V/F
  new Question(
    "3) O selo Procel A indica maior efici\u00eancia energ\u00e9tica.",
    new String[]{"Verdadeiro", "Falso"},
    0,
    "Verdadeiro!",
    "O selo Procel A indica que o aparelho possui alta efici\u00eancia energ\u00e9tica,\n"
    + "ou seja, consegue funcionar bem consumindo menos energia el\u00e9trica.\n\n"
    + "Aparelhos com esse selo ajudam a economizar na conta de luz\n"
    + "e tamb\u00e9m reduzem o desperd\u00edcio de energia."
  ),

  // 4 - V/F
  new Question(
    "4) Um aparelho de 1000 W consome 1 kWh em 1 hora.",
    new String[]{"Verdadeiro", "Falso"},
    0,
    "Verdadeiro!",
    "Um aparelho de 1000 W possui pot\u00eancia equivalente a 1 kW.\n\n"
    + "Se ele ficar ligado durante 1 hora, consumir\u00e1 1 kWh de energia el\u00e9trica.\n\n"
    + "Essa \u00e9 a unidade usada para medir o consumo de energia na conta de luz."
  ),

  // 5 - V/F
  new Question(
    "5) L\u00e2mpadas LED transformam mais energia em luz que l\u00e2mpadas incandescentes.",
    new String[]{"Verdadeiro", "Falso"},
    0,
    "Verdadeiro!",
    "As l\u00e2mpadas LED s\u00e3o mais eficientes porque transformam uma maior\n"
    + "parte da energia el\u00e9trica em luz, enquanto as l\u00e2mpadas incandescentes\n"
    + "desperdi\u00e7am muita energia em forma de calor.\n\n"
    + "Por isso, as LEDs iluminam bem consumindo menos energia."
  ),

  // 6 - múltipla escolha
  new Question(
    "6) Um chuveiro de 5500 W ligado por 20 minutos consome aproximadamente:",
    new String[]{"0,9 kWh", "1,8 kWh", "2,2 kWh", "5,5 kWh"},
    1,
    "1,8 kWh de energia!",
    "Primeiro, convertemos de W para kW:\n"
    + "5500 W / 1000 = 5,5 kW\n\n"
    + "Depois, transformamos 20 minutos em horas:\n"
    + "20 min = 1/3 de hora\n\n"
    + "Agora calculamos o consumo:\n"
    + "5,5 \u00d7 1/3 \u2248 1,8 kWh"
  ),

  // 7 - bandeiras
  new Question(
    "7) Relacione as bandeiras tarif\u00e1rias \u00e0s descri\u00e7\u00f5es corretas.",
    new String[]{"Clique para relacionar"},
    0,
    "Verde -> Sem cobran\u00e7a extra\nAmarela -> Pequeno acr\u00e9scimo\nVermelha 1 -> Acr\u00e9scimo moderado\nVermelha 2 -> Maior acr\u00e9scimo",
    "As bandeiras tarif\u00e1rias indicam o custo da produ\u00e7\u00e3o de energia el\u00e9trica.\n\n"
    + "Bandeira verde: gera\u00e7\u00e3o barata, sem taxa extra.\n"
    + "Bandeira amarela: custo um pouco maior, pequeno acr\u00e9scimo.\n"
    + "Bandeira vermelha 1: custo moderado.\n"
    + "Bandeira vermelha 2: maior custo, maior acr\u00e9scimo na conta."
  ),

  // 8 - múltipla escolha
  new Question(
    "8) Uma TV de 200 W ligada 5h por dia durante 30 dias consumir\u00e1:",
    new String[]{"3 kWh", "30 kWh", "300 kWh", "15 kWh"},
    1,
    "30 kWh de energia el\u00e9trica!",
    "Primeiro, convertemos de W para kW:\n"
    + "200 W / 1000 = 0,2 kW\n\n"
    + "Depois, calculamos o total de horas ligadas no m\u00eas:\n"
    + "5 \u00d7 30 = 150 horas\n\n"
    + "Agora calculamos o consumo:\n"
    + "0,2 \u00d7 150 = 30 kWh"
  ),

  // 9 - múltipla escolha
  new Question(
    "9) Uma resid\u00eancia possui 6 l\u00e2mpadas de 15 W ligadas 8h por dia durante 30 dias. O consumo total \u00e9:",
    new String[]{"10,8 kWh", "21,6 kWh", "32,4 kWh", "43,2 kWh"},
    1,
    "21,6 kWh de energia!",
    "Primeiro, somamos a pot\u00eancia das l\u00e2mpadas:\n"
    + "6 \u00d7 15 = 90 W\n\n"
    + "Convertemos de W para kW:\n"
    + "90 W / 1000 = 0,09 kW\n\n"
    + "Calculamos o total de horas no m\u00eas:\n"
    + "8 \u00d7 30 = 240 horas\n\n"
    + "Consumo total:\n"
    + "0,09 \u00d7 240 = 21,6 kWh"
  ),

  // 10 - múltipla escolha
  new Question(
    "10) Um ar-condicionado de 1500 W funciona 6h por dia durante 30 dias. Se o kWh custa R$0,90, o gasto ser\u00e1 aproximadamente:",
    new String[]{"R$81", "R$162", "R$243", "R$324"},
    2,
    "R$ 243,00!",
    "Convertemos de W para kW:\n"
    + "1500 W / 1000 = 1,5 kW\n\n"
    + "Total de horas no m\u00eas:\n"
    + "6 \u00d7 30 = 180 horas\n\n"
    + "Consumo de energia:\n"
    + "1,5 \u00d7 180 = 270 kWh\n\n"
    + "Multiplicamos pelo valor do kWh:\n"
    + "270 \u00d7 0,90 = R$ 243,00"
  )
};

// -------------------------
// TARIFF FLAGS (questão 7)
// -------------------------

String[] flagNames = {
  "Verde",
  "Amarela",
  "Vermelha 1",
  "Vermelha 2"
};

String[] flagDescriptions = {
  "Maior acr\u00e9scimo",
  "Sem cobran\u00e7a extra",
  "Pequeno acr\u00e9scimo",
  "Acr\u00e9scimo moderado"
};

int[] flagCorrectAnswers = { 1, 2, 3, 0 };

// -------------------------
// PRACTICE MORE LINKS
// -------------------------

String[] practiceLabels = {
  "Exerc\u00edcios da Brasil Escola",
  "Exerc\u00edcios da SEDUC (ignorar quest\u00e3o 14)",
  "Exerc\u00edcios da ProCampus Educa\u00e7\u00e3o"
};

String[] practiceUrls = {
  "https://exercicios.brasilescola.uol.com.br/exercicios-fisica/exercicios-sobre-energia-eletrica.htm",
  "https://portal.educacao.go.gov.br/wp-content/uploads/2021/06/Atividade-11-8o-ano-Ciencias-da-natureza-Revisa%CC%83o.pdf",
  "https://www.procampuseducacao.com.br/wp-content/uploads/2020/04/8%C2%BA-Ano-Trabalhos-de-Ci%C3%AAncias-Ensino-Remoto.pdf"
};

float[] practiceLinkWidths = { 270, 450, 360 };

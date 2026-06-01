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
// Estrutura: cada entrada é uma linha.
// Prefixo "S:" = título de seção (aba)
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
//  edite aqui para alterar o conteúdo do livro
// =========================================================

// Títulos grandes (substituem "Página 1", etc.)
String[] theoryTitles = {
  "Pot\u00eancia El\u00e9trica",
  "Calculando o Consumo",
  "Energia no Cotidiano",
  "Conta de Luz"
};

// Conteúdo do lado ESQUERDO de cada virada
String[] theoryLeft = {

  // Virada 1 — Potência Elétrica (esquerda)
  "O que \u00e9 pot\u00eancia el\u00e9trica?\n\n"
  + "A pot\u00eancia el\u00e9trica indica quanta energia\n"
  + "um aparelho utiliza em um certo tempo.\n"
  + "Ela mostra o qu\u00e3o \"forte\" \u00e9 o funcionamento\n"
  + "de um equipamento.\n\n"
  + "F\u00f3rmula:\n\n"
  + "        P = E \u00f7 t\n\n"
  + "  P = pot\u00eancia (W, watts)\n"
  + "  E = energia  (J, joules)\n"
  + "  t = tempo    (s, segundos)\n\n"
  + "Derivadas da f\u00f3rmula:\n\n"
  + "  E = P \u00d7 t\n"
  + "  t = E \u00f7 P",

  // Virada 2 — Calculando o Consumo (esquerda)
  "Como calcular o consumo?\n\n"
  + "Multiplicamos a pot\u00eancia pelo tempo de uso.\n\n"
  + "  Consumo = P \u00d7 t\n\n"
  + "O resultado sai em Wh (watt-hora).\n"
  + "Para converter para kWh, dividimos por 1000:\n\n"
  + "  1000 Wh = 1 kWh\n\n"
  + "A conta de luz usa kWh. Por isso, antes\n"
  + "de calcular o custo, sempre convertemos\n"
  + "watts (W) para quilowatts (kW):\n\n"
  + "  1000 W = 1 kW\n\n"
  + "Exemplo r\u00e1pido:\n"
  + "  Aparelho de 10 W usado por 60 h no m\u00eas\n"
  + "  Consumo = 0,01 kW \u00d7 60 h = 0,6 kWh",

  // Virada 3 — Energia no Cotidiano (esquerda)
  "Energia no dia a dia\n\n"
  + "A energia el\u00e9trica est\u00e1 presente em\n"
  + "praticamente todas as atividades di\u00e1rias.\n\n"
  + "Quando usamos um aparelho el\u00e9trico, ele\n"
  + "transforma energia el\u00e9trica em outro tipo:\n\n"
  + "  L\u00e2mpada   \u2192  luz\n"
  + "  Ventilador \u2192  movimento\n"
  + "  Chuveiro   \u2192  calor\n\n"
  + "O consumo depende de dois fatores:\n\n"
  + "  1. A pot\u00eancia do aparelho\n"
  + "  2. O tempo em que fica ligado\n\n"
  + "Quanto maior a pot\u00eancia ou o tempo de uso,\n"
  + "maior ser\u00e1 o consumo de energia.",

  // Virada 4 — Conta de Luz (esquerda)
  "A conta de luz\n\n"
  + "A conta de luz mostra quanto de energia\n"
  + "el\u00e9trica foi consumida no m\u00eas.\n"
  + "As empresas cobram pelo consumo em kWh.\n\n"
  + "  Custo = consumo (kWh) \u00d7 pre\u00e7o do kWh\n\n"
  + "Al\u00e9m do consumo, a conta pode incluir:\n"
  + "  - Impostos\n"
  + "  - Taxas\n"
  + "  - Bandeiras tarif\u00e1rias\n\n"
  + "Bandeiras tarif\u00e1rias:\n\n"
  + "  Verde    \u2192  sem cobran\u00e7a adicional\n"
  + "  Amarela  \u2192  pequeno aumento\n"
  + "  Vermelha \u2192  aumento maior\n\n"
  + "Elas existem porque em alguns per\u00edodos\n"
  + "produzir energia se torna mais caro."
};

// Conteúdo do lado DIREITO de cada virada
String[] theoryRight = {

  // Virada 1 — Potência Elétrica (direita)
  "Exemplo resolvido:\n\n"
  + "Um aparelho usa 100 J em 10 segundos.\n"
  + "Qual \u00e9 a sua pot\u00eancia?\n\n"
  + "  P = E \u00f7 t\n"
  + "  P = 100 \u00f7 10\n"
  + "  P = 10 W\n\n"
  + "E se eu souber P e quiser saber E?\n\n"
  + "  E = P \u00d7 t\n"
  + "  E = 10 \u00d7 10\n"
  + "  E = 100 J\n\n"
  + "Aten\u00e7\u00e3o com as unidades!\n\n"
  + "Em exerc\u00edcios de conta de luz, usamos\n"
  + "kW e horas, n\u00e3o W e segundos.\n"
  + "Verifique sempre as unidades antes\n"
  + "de calcular.\n\n"
  + "No dia a dia:\n"
  + "  Carregador  \u2192  pot\u00eancia baixa\n"
  + "  Televis\u00e3o  \u2192  pot\u00eancia m\u00e9dia\n"
  + "  Chuveiro    \u2192  pot\u00eancia alta",

  // Virada 2 — Calculando o Consumo (direita)
  "Exerc\u00edcio passo a passo:\n\n"
  + "Um aparelho gasta 500 J em 20 min.\n"
  + "Usado 10 h/dia por 30 dias.\n"
  + "Pre\u00e7o do kWh: R$ 0,80. Qual o gasto?\n\n"
  + "Passo 1 \u2014 Calcular a pot\u00eancia:\n"
  + "  Converter min \u2192 s:  20 \u00d7 60 = 1200 s\n"
  + "  P = 500 \u00f7 1200 \u2248 0,42 W\n\n"
  + "Passo 2 \u2014 Consumo mensal:\n"
  + "  Converter W \u2192 kW: 0,42 \u00f7 1000\n"
  + "  Horas no m\u00eas: 10 \u00d7 30 = 300 h\n"
  + "  kWh = 0,00042 \u00d7 300 \u2248 0,126 kWh\n\n"
  + "Passo 3 \u2014 Custo mensal:\n"
  + "  Custo = 0,126 \u00d7 0,80\n"
  + "  Custo \u2248 R$ 0,10\n\n"
  + "Esse aparelho gasta cerca de R$ 0,10\n"
  + "por m\u00eas \u2014 similar a uma l\u00e2mpada LED.",

  // Virada 3 — Energia no Cotidiano (direita)
  "Aparelhos por faixa de pot\u00eancia:\n\n"
  + "  Baixa pot\u00eancia (at\u00e9 100 W):\n"
  + "    Carregador, l\u00e2mpada LED,\n"
  + "    r\u00e1dio, ventilador pequeno\n\n"
  + "  M\u00e9dia pot\u00eancia (100 \u2014 500 W):\n"
  + "    Televis\u00e3o, computador,\n"
  + "    micro-ondas (em espera)\n\n"
  + "  Alta pot\u00eancia (acima de 500 W):\n"
  + "    Chuveiro, secador de cabelo,\n"
  + "    ferro de passar, ar-condicionado\n\n"
  + "Aten\u00e7\u00e3o:\n\n"
  + "Um aparelho de baixa pot\u00eancia pode\n"
  + "consumir muita energia se ficar\n"
  + "ligado por muitas horas.\n\n"
  + "Um aparelho de alta pot\u00eancia pode\n"
  + "consumir bastante mesmo em pouco tempo.\n\n"
  + "A pot\u00eancia fica na etiqueta do aparelho.",

  // Virada 4 — Conta de Luz (direita)
  "Por que as bandeiras mudam?\n\n"
  + "No Brasil, a maior fonte de energia\n"
  + "s\u00e3o as hidrel\u00e9tricas.\n"
  + "Quando chove pouco, os reservat\u00f3rios\n"
  + "baixam e \u00e9 preciso usar termel\u00e9tricas,\n"
  + "que queimam combust\u00edvel f\u00f3ssil e\n"
  + "custam mais caro.\n\n"
  + "Uso consciente da energia:\n\n"
  + "  - Apague luzes desnecess\u00e1rias\n"
  + "  - Desligue aparelhos sem uso\n"
  + "  - Retire carregadores da tomada\n"
  + "  - Use l\u00e2mpadas de LED\n"
  + "  - Reduza o tempo de banho\n\n"
  + "Economizar energia ajuda tanto\n"
  + "no bolso quanto no meio ambiente.\n\n"
  + "A pot\u00eancia e o pre\u00e7o do kWh ficam\n"
  + "na etiqueta e na conta de luz."
};

// =========================================================
// DATA — REVIEW (FLASHCARDS)
// Edite aqui para alterar perguntas e respostas dos cards.
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
// Edite aqui para alterar perguntas, alternativas,
// respostas corretas, gabaritos e explicações.
// =========================================================

// -------------------------
// QUESTION MODEL
// -------------------------

class Question {
  String   statement;
  String[] alternatives;
  int      correctAnswer;  // índice da alternativa correta
  String   answerLabel;    // texto exibido no gabarito
  String   explanation;    // explicação exibida no gabarito

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

// -------------------------
// QUESTIONS (10 no total)
// -------------------------

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

  // 7 - bandeiras (caso especial, tratado separado)
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

// índice correto em flagDescriptions para cada bandeira
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

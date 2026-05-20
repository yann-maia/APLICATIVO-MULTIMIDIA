// ---------------- TELA 1 ----------------
void telaTeoria1() {
  background(255);

  fill(0);
  textSize(22);
  text("Consumo de energia elétrica no cotidiano", 40, 50);

  textSize(13);
  text(
    "A energia elétrica está presente em praticamente todas as atividades do dia a dia. "
    + "Ela é utilizada para fazer aparelhos funcionarem, iluminar ambientes, aquecer água, "
    + "carregar celulares e alimentar diversos equipamentos.\n\n"

    + "Quando utilizamos um aparelho elétrico, ele transforma a energia elétrica em outro tipo de energia. "
    + "Uma lâmpada transforma energia elétrica em luz. Um ventilador transforma energia elétrica em movimento. "
    + "Um chuveiro transforma energia elétrica em calor.\n\n"

    + "O consumo de energia depende principalmente de dois fatores:\n"
    + "- a potência do aparelho\n"
    + "- o tempo em que ele permanece ligado\n\n"

    + "Quanto maior for a potência ou o tempo de uso, maior será o consumo de energia.\n\n"

    + "A potência elétrica indica quanta energia um aparelho utiliza em determinado tempo. "
    + "Ela mostra o quão 'forte' é o funcionamento de um equipamento elétrico.\n\n"

    + "No Sistema Internacional de Unidades (SI), a potência é medida em watts (W).\n\n"

    + "Exemplos:\n"
    + "carregador de celular -> potência baixa\n"
    + "televisão -> potência média\n"
    + "chuveiro elétrico -> potência alta.",
    40, 90, 720, 550
  );

  fill(100, 180, 255);
  rect(550, 720, 180, 50);

  fill(0);
  textSize(18);
  text("Próxima", 605, 750);
}

void cliqueTeoria1() {
  if (
    mouseX > 550 && mouseX < 730 &&
    mouseY > 720 && mouseY < 770
  ) {
    tela = 2;
  }
}


// ---------------- TELA 2 ----------------
void telaTeoria2() {
  background(255);

  fill(0);
  textSize(22);
  text("Conta de luz e bandeiras tarifárias", 40, 50);

  textSize(13);
  text(
    "A conta de luz mostra quanto de energia elétrica foi consumida durante o mês. "
    + "As empresas de energia cobram pelo consumo em quilowatt-hora (kWh). "
    + "Cada região possui um valor aproximado para cada kWh consumido.\n\n"

    + "Para descobrir o valor gasto, multiplicamos:\n"
    + "- o consumo em kWh\n"
    + "- pelo preço de cada kWh.\n\n"

    + "Além do consumo, a conta de luz também pode incluir:\n"
    + "- impostos\n"
    + "- taxas\n"
    + "- bandeiras tarifárias.\n\n"

    + "As bandeiras tarifárias indicam o custo da produção de energia elétrica no país.\n\n"

    + "Bandeira verde -> sem cobrança adicional\n"
    + "Bandeira amarela -> pequeno aumento no valor\n"
    + "Bandeira vermelha -> aumento maior no valor da energia.\n\n"

    + "Essas bandeiras existem porque, em alguns períodos, produzir energia elétrica se torna mais caro. "
    + "O mais comum é quando há pouca chuva e as hidrelétricas produzem pouca energia, "
    + "sendo preciso usar termelétricas, que precisam queimar combustível fóssil.",
    40, 90, 720, 550
  );

  fill(100, 180, 255);
  rect(50, 720, 180, 50);

  fill(100, 180, 255);
  rect(550, 720, 180, 50);

  fill(0);
  textSize(18);
  text("Voltar", 110, 750);
  text("Próxima", 605, 750);
}

void cliqueTeoria2() {
  if (
    mouseX > 50 && mouseX < 230 &&
    mouseY > 720 && mouseY < 770
  ) {
    tela = 1;
  }

  if (
    mouseX > 550 && mouseX < 730 &&
    mouseY > 720 && mouseY < 770
  ) {
    tela = 3;
  }
}


// ---------------- TELA 3 ----------------
void telaTeoria3() {
  background(255);

  fill(0);
  textSize(22);
  text("Uso consciente e cálculo do consumo", 40, 50);

  textSize(13);
  text(
    "Economizar energia elétrica ajuda a reduzir gastos e evita desperdícios.\n\n"

    + "Algumas atitudes simples podem diminuir o consumo:\n"
    + "- apagar luzes desnecessárias\n"
    + "- desligar aparelhos que não estão sendo usados\n"
    + "- retirar carregadores da tomada\n"
    + "- utilizar lâmpadas de LED\n"
    + "- reduzir o tempo de banho.\n\n"

    + "Para calcular o consumo, multiplicamos a potência elétrica (W) pelo tempo.\n\n"

    + "Exemplo:\n"
    + "Um aparelho de 10W usado por 60 horas no mês:\n"
    + "Consumo = 10 x 60 = 600 Wh (Watt-hora)\n\n"

    + "A potência elétrica pode ser calculada por:\n"
    + "P = E / t\n\n"

    + "Onde:\n"
    + "P = potência elétrica (W)\n"
    + "E = energia (J)\n"
    + "t = tempo (s)\n\n"

    + "Quanto maior a potência e o tempo de uso, maior será o valor da conta de luz.",
    40, 90, 720, 550
  );

  fill(100, 180, 255);
  rect(50, 720, 180, 50);

  fill(0);
  textSize(18);
  text("Voltar", 110, 750);
}

void cliqueTeoria3() {
  if (
    mouseX > 50 && mouseX < 230 &&
    mouseY > 720 && mouseY < 770
  ) {
    tela = 2;
  }
}

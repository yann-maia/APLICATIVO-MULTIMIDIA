## Padrão de código para cada tela do app

Cada pessoa ficará responsável por **sua respectiva tela(s)** do aplicativo. Para manter tudo organizado, cada tela deve ter **duas funções principais**:


void telaNomeDaTela() {
  // Desenha tudo que aparece na tela
}

void cliqueNomeDaTela() {
  // Controla os cliques dessa tela
}


A primeira função desenha a tela.
A segunda função controla o que acontece quando o usuário clica nela.

---

Exemplo: quem ficou com a Tela de Teoria

A pessoa deve criar ou editar o arquivo:

***
TelaTeoria.pde
***

E dentro dele colocar:


void telaTeoria() {
  background(240);

  fill(0);
  textSize(32);
  text("Tela de Teoria", 100, 100);

  // Exemplo de botão
  fill(100, 180, 255);
  rect(300, 400, 200, 60);

  fill(0);
  textSize(20);
  text("Voltar", 370, 438);
}

void cliqueTeoria() {
  // Clique no botão Voltar
  if (mouseX > 300 && mouseX < 500 &&
      mouseY > 400 && mouseY < 460) {
    tela = 2; // volta para a Tela Principal
  }
}


---

## Regra principal

Cada pessoa deve mexer **somente no arquivo da sua tela**, no seu branch, por exemplo:


TelaTeoria.pde
TelaQuestoes.pde
TelaRespostas.pde
TelaRevisao.pde
TelaCreditos.pde


Não precisa mexer no arquivo Navegacao.pde, porque ele já chama automaticamente a tela certa.

---

## Como a navegação funciona

No arquivo Navegacao.pde, já existe isso:


if (tela == 3) {
  telaTeoria();
}


Isso significa:

> Quando a variável *tela* for igual a 3, o Processing vai desenhar a tela de teoria.

E também existe:


if (tela == 3) {
  cliqueTeoria();
}


Isso significa:

> Quando o usuário estiver na tela de teoria e clicar, o Processing vai executar a função *cliqueTeoria()*.

Por isso, quem faz a tela de teoria (por exemplo) só precisa criar essas duas funções:


void telaTeoria() {
  
}

void cliqueTeoria() {
  
}


---

## Como mudar de tela

Para mudar de tela, basta alterar o valor da variável *tela*, dentro da função *cliqueNomedaTela()*.

Exemplo:


tela = 2;


Isso leva para a Tela Principal.

## Tabela dos números:


0 = Introdução
1 = Sumário
2 = Tela Principal
3 = Teoria
4 = Questões
5 = Respostas
6 = Revisão
7 = Créditos

---

## Modelo final que todos devem seguir


void telaNomeDaTela() {
  background(255);

  fill(0);
  textSize(28);
  text("Nome da Tela", 100, 100);

  // Desenhar textos, imagens, botões e elementos visuais aqui
}

void cliqueNomeDaTela() {
  // Verificar aqui se o mouse clicou em algum botão

  if (mouseX > 100 && mouseX < 300 &&
      mouseY > 400 && mouseY < 460) {
    tela = 2;
  }
}

---

A ideia é simples:

**a função *tela...()* desenha a tela.
a função *clique...()* controla os botões dessa tela.**

================================================================================================

Agora, no que se trata da criação de novas telas subordinadas às principais (como telas internas de Teoria e Questões), trabalharemos da seguinte forma:

Quando você criar uma nova tela, crie primeiramente as funções:


void tela[NomeDaTela][Numero]()
void clique[NomeDaTela][Numero]()


Exemplos:


void telaTeoria1()
void cliqueTeoria1()

void telaQuestoes1()
void cliqueQuestoes1()


Essas funções devem ser criadas **apenas no seu próprio arquivo .pde dentro da sua branch**, sem modificar o arquivo Navegacao.pde.

---

## Navegação entre telas internas

Dentro da função de clique, utilize a variável tela para realizar a navegação entre as telas.

O padrão utilizado será:


tela = [numero principal][numero da sub-tela]


Exemplos:


tela = 31;
tela = 32;
tela = 33;


Onde:


3  = Tela principal de Teoria
31 = Tela Teoria 1
32 = Tela Teoria 2
33 = Tela Teoria 3


Outro exemplo:


4  = Tela principal de Questões
41 = Questão 1
42 = Questão 2
43 = Questão 3


Essas alterações também devem ser feitas **somente no seu arquivo**, sem modificar o Navegacao.pde.

---

## Integração no Navegacao.pde

A atribuição das novas funções no arquivo Navegacao.pde, bem como a criação das respectivas condições de navegação (if (tela == 31), por exemplo), será realizada apenas pelo Yanni no momento da integração da branch com a main.

Isso será feito para:

* evitar conflitos de merge;
* impedir duplicações de números de tela;
* manter a navegação centralizada;
* evitar inconsistências no fluxo do aplicativo.

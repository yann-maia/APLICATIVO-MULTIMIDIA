# Padrão de Código e Organização das Telas

Cada pessoa ficará responsável por sua respectiva(s) tela(s) do aplicativo.
Para manter tudo organizado e padronizado, cada tela deve possuir **duas funções principais**:

```java
void telaNomeDaTela() {
  // Desenha tudo que aparece na tela
}

void cliqueNomeDaTela() {
  // Controla os cliques dessa tela
}
```

* A função `tela...()` desenha os elementos visuais da tela.
* A função `clique...()` controla o que acontece quando o usuário clica na tela.

---

# Exemplo: Tela de Teoria

A pessoa responsável pela Tela de Teoria deve criar ou editar o arquivo:

```text
TelaTeoria.pde
```

E dentro dele colocar algo como:

```java
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

  // Clique no botão "Voltar"
  if (
    mouseX > 300 && mouseX < 500 &&
    mouseY > 400 && mouseY < 460
  ) {
    tela = 2; // Volta para a Tela Principal
  }
}
```

---

# Regra Principal

Cada pessoa deve mexer **somente no arquivo da sua própria tela**, dentro da sua branch.

Exemplos:

```text
TelaTeoria.pde
TelaQuestoes.pde
TelaRespostas.pde
TelaRevisao.pde
TelaCreditos.pde
```

Não é necessário modificar o arquivo `Navegacao.pde`, pois ele já realiza automaticamente a chamada da tela correta.

---

# Como a Navegação Funciona

No arquivo `Navegacao.pde`, existe uma estrutura semelhante a esta:

```java
if (tela == 3) {
  telaTeoria();
}
```

Isso significa:

> Quando a variável `tela` for igual a `3`, o Processing desenhará a Tela de Teoria.

Também existe:

```java
if (tela == 3) {
  cliqueTeoria();
}
```

Isso significa:

> Quando o usuário estiver na Tela de Teoria e clicar, o Processing executará a função `cliqueTeoria()`.

Por isso, quem desenvolve uma tela precisa apenas criar:

```java
void telaTeoria() {

}

void cliqueTeoria() {

}
```

---

# Como Mudar de Tela

Para mudar de tela, basta alterar o valor da variável `tela` dentro da função `cliqueNomeDaTela()`.

Exemplo:

```java
tela = 2;
```

Isso levará o usuário para a Tela Principal.

---

# Tabela de Navegação Principal

```text
0 = Introdução
1 = Sumário
2 = Tela Principal
3 = Teoria
4 = Questões
5 = Respostas
6 = Revisão
7 = Créditos
```

---

# Modelo Final Obrigatório

Todos devem seguir este modelo base:

```java
void telaNomeDaTela() {

  background(255);

  fill(0);
  textSize(28);
  text("Nome da Tela", 100, 100);

  // Desenhar textos, imagens, botões e elementos visuais aqui
}

void cliqueNomeDaTela() {

  // Verificar aqui se o mouse clicou em algum botão

  if (
    mouseX > 100 && mouseX < 300 &&
    mouseY > 400 && mouseY < 460
  ) {
    tela = 2;
  }
}
```

---

# Criação de Sub-Telas (Teorias e Questões)

Para a criação de telas internas subordinadas às telas principais (como Teoria 1, Questão 2, etc.), seguiremos o padrão abaixo.

---

## Criação das Funções

Quando você criar uma nova sub-tela, crie primeiro as funções:

```java
void tela[NomeDaTela][Numero]()
void clique[NomeDaTela][Numero]()
```

Exemplos:

```java
void telaTeoria1()
void cliqueTeoria1()

void telaQuestoes1()
void cliqueQuestoes1()
```

Essas funções devem ser criadas **somente no seu próprio arquivo `.pde` dentro da sua branch**, sem modificar o arquivo `Navegacao.pde`.

---

# Navegação Entre Sub-Telas

Dentro da função de clique, utilize a variável `tela` para navegar entre as sub-telas.

O padrão utilizado será:

```java
tela = [numero principal][numero da sub-tela];
```

Exemplos:

```java
tela = 31;
tela = 32;
tela = 33;
```

Onde:

```text
3  = Tela principal de Teoria
31 = Tela Teoria 1
32 = Tela Teoria 2
33 = Tela Teoria 3
```

Outro exemplo:

```text
4  = Tela principal de Questões
41 = Questão 1
42 = Questão 2
43 = Questão 3
```

Essas alterações também devem ser feitas somente no seu próprio arquivo, sem modificar o `Navegacao.pde`.

---

# Integração no Navegacao.pde

A atribuição das novas funções no arquivo `Navegacao.pde`, bem como a criação das respectivas condições de navegação:

```java
if (tela == 31)
```

será realizada apenas pelo Yanni no momento da integração da branch com a `main`.

Isso será feito para:

* evitar conflitos de merge;
* impedir duplicações de números de tela;
* manter a navegação centralizada;
* evitar inconsistências no fluxo do aplicativo.

# IMPORTANTE:

A importação da biblioteca ControlP5, bem como a declaração do objeto cp5, já serão feitos no arquivo principal! 
Por isso, não há a necessidade de fazer estas referências novamente no seu arquivo.

!! UTILIZEM APENAS AS FUNÇÕES DE *.TEXTLABEL* E *.TEXTAREA* EXPLICADOS NO ARQUIVO **BIBLIOTECA CONTROLP5**, PORQUE A FUNÇÃO DE BOTÕES PRECISARIA DE UMA ESTRUTURA DE APP MAIS COMPLEXA PARA SER IMPLEMENTADA !! 

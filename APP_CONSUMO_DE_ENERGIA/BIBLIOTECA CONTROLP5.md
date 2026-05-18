# Introdução ao ControlP5 no Processing

# O que é o ControlP5

O ControlP5 é uma biblioteca para o Processing que facilita a criação de interfaces gráficas. Com ela, podemos adicionar:

* botões;
* caixas de texto;

Sem essa biblioteca, seria necessário programar manualmente toda a lógica de clique e aparência dos elementos da interface.

---

# Como baixar o ControlP5

No Processing:

```plaintext
Sketch → Import Library → Add Library
```

Depois:

1. Pesquise por:

```plaintext
ControlP5
```

2. Clique em instalar.

Para utilizar no código:

```java
import controlP5.*;
```

---

# Como um botão funciona no ControlP5

Um botão no ControlP5 funciona através de:

1. criação do componente;
2. definição de posição e aparência;
3. criação de uma função com o mesmo nome do botão.

Exemplo:

```java
cp5.addButton("entrar");
```

Aqui o botão se chama:

```plaintext
entrar
```

Então o Processing procurará automaticamente:

```java
void entrar() {

}
```

Quando o usuário clicar no botão, essa função será executada.

---

# Exemplo básico completo

```java
import controlP5.*;

// Declaração do objeto para a criação dos elementos de interface
ControlP5 cp5;

void setup() {
  size(600, 400);

  // "Ativação" do objeto
  cp5 = new ControlP5(this);

  // Criação dos elementos básicos botão (será melhor explicado mais adiante)
  cp5.addButton("entrar")
     .setPosition(220, 150)
     .setSize(160, 60)
     .setLabel("ENTRAR");
}

void draw() {
  background(220);
}

// Função relacionada ao botão(será executada no momento do clique)
void entrar() {
  println("Botão clicado!");
}
```

---

# Trabalhando com as principais funções do botão

---

# cp5.addButton()

Cria o botão.

```java
cp5.addButton("jogar")
```

O nome `"jogar"` será associado à função:

```java
void jogar() {

}
```

---

# .setPosition()

Define a posição do botão na tela.

```java
.setPosition(200, 150)
```

* primeiro valor = posição X;
* segundo valor = posição Y.

Exemplo:

```java
.setPosition(50, 300)
```

Coloca o botão:

* 50 pixels da esquerda;
* 300 pixels do topo.

---

# .setSize()

Define o tamanho do botão.

```java
.setSize(200, 60)
```

* primeiro valor = largura;
* segundo valor = altura.

---

# .setLabel()

Define o texto exibido no botão.

```java
.setLabel("INICIAR")
```

Sem isso, o botão mostraria seu nome interno.

---

# Alterando as cores do botão

Para modificar melhor a aparência, normalmente guardamos o botão em uma variável.

Exemplo:

```java
Button botao;
```

---

# botao.setColorBackground()

Define a cor padrão do botão.

```java
botao.setColorBackground(color(0, 120, 255));
```

Exemplo:

* azul quando parado.

---

# botao.setColorForeground()

Define a cor quando o mouse passa sobre o botão.

```java
botao.setColorForeground(color(0, 180, 255));
```

Exemplo:

* azul mais claro ao passar o mouse.

---

# botao.setColorActive()

Define a cor enquanto o botão está sendo clicado.

```java
botao.setColorActive(color(255, 100, 100));
```

Exemplo:

* vermelho durante o clique.

---

# botao.setColorLabel()

Define a cor do texto do botão.

```java
botao.setColorLabel(color(255));
```

Exemplo:

* texto branco.

---

# Alterando a fonte do texto

---

# botao.getCaptionLabel().setFont(createFont())

Permite mudar a fonte.

```java
botao.getCaptionLabel().setFont(
  createFont("Arial", 24)
);
```

* `"Arial"` = nome da fonte;
* `24` = tamanho inicial.

---

# botao.getCaptionLabel().setSize()

Define o tamanho do texto.

```java
botao.getCaptionLabel().setSize(24);
```

---

# Exemplo completo estilizado

```java
import controlP5.*;

// Declaração do objeto para a criação dos elementos de interface
ControlP5 cp5;

Button botao;

void setup() {

  size(700, 500);
  
  // "Ativação" do objeto
  cp5 = new ControlP5(this);

  // Criação dos elementos básicos do botão
  botao = cp5.addButton("jogar") // nome da função
              .setPosition(250, 200) // posição x e y (lembre-se: o eixo 0,0 é no canto superior esquerdo, não no centro)
              .setSize(200, 80) // tamanho em pixels do botão
              .setLabel("JOGAR"); // texto do botão

  botao.setColorBackground(color(50, 120, 255)); // cor de fundo do botão

  botao.setColorForeground(color(80, 180, 255)); // cor de fundo do botão ao passar o mouse por cima

  botao.setColorActive(color(255, 120, 120)); // cor de fundo do botão no momento do clique

  botao.setColorLabel(color(255)); // cor do texto do botão

  botao.getCaptionLabel().setFont(
    createFont("Arial", 24)
  ); // atribuição da fonte + tamanho inicial da fonte

  botao.getCaptionLabel().setSize(24); // tamanho final da fonte
}

void draw() {

  background(30, 30, 50);
}

// Função relacionada ao botão(será executada no momento do clique)
void jogar() {

  println("Iniciando jogo...");
}
```

---

# Como criar uma borda utilizando rect()

Os botões do ControlP5 não possuem uma função própria de borda detalhada. Uma solução comum é desenhar um `rect()` atrás do botão.

Exemplo:

```java
void draw(){
  
  fill(0);
  rect(246, 196, 208, 88);
}
```

Esse `rect()` cria:

* um retângulo preto;
* um pouco maior que o botão.

Se o botão estiver em:

```java
.setPosition(250, 200)
.setSize(200, 80)
```

a borda precisa ser ligeiramente maior:

```java
rect(246, 196, 208, 88);
```

---

# Resultado visual

```plaintext
┌──────────────────────┐
│      JOGAR           │
└──────────────────────┘
```

---
# Caixas de texto no ControlP5

## Como uma caixa de texto funciona no ControlP5

No ControlP5, existem componentes próprios para exibir textos na tela. Eles ajudam a organizar títulos, subtítulos, explicações e descrições sem precisar escrever tudo manualmente com `text()`.

Os dois componentes mais úteis para isso são:

| Componente  | Para que serve                                |
| ----------- | --------------------------------------------- |
| `Textlabel` | textos curtos, como títulos e subtítulos      |
| `Textarea`  | textos maiores, como explicações e descrições |

---

# 1. Criando título e subtítulo com `Textlabel`

O `Textlabel` serve para criar textos simples na tela.

Exemplo completo:

```java
import controlP5.*;

ControlP5 cp5;

void setup() {
  size(700, 400);

  // Cria o objeto principal do ControlP5
  cp5 = new ControlP5(this);

  // Cria um título usando Textlabel
  cp5.addTextlabel("titulo")
     .setText("Consumo de Energia")
     .setPosition(180, 60)
     .setColorValue(color(0))
     .setFont(createFont("Arial", 30));

  // Cria um subtítulo usando Textlabel
  cp5.addTextlabel("subtitulo")
     .setText("Aprenda a economizar energia elétrica")
     .setPosition(160, 110)
     .setColorValue(color(80))
     .setFont(createFont("Arial", 18));
}

void draw() {
  background(230);
}
```

## Explicação das funções

```java
.addTextlabel("titulo")
```

Cria um texto simples chamado `"titulo"`.

```java
.setText("Consumo de Energia")
```

Define o texto que aparecerá na tela.

```java
.setPosition(180, 60)
```

Define a posição do texto:

* `180` é a posição no eixo X;
* `60` é a posição no eixo Y.

```java
.setColorValue(color(0))
```

Define a cor do texto.

```java
.setFont(createFont("Arial", 30))
```

Define a fonte e o tamanho do texto.

---

# 2. Criando uma caixa de texto grande com `Textarea`

O `Textarea` serve para textos maiores, como explicações, instruções ou descrições.

Exemplo completo:

```java
import controlP5.*;

ControlP5 cp5;

// Variável que guarda a caixa de texto grande
Textarea textoExplicativo;

void setup() {
  size(750, 500);

  // Cria o objeto principal do ControlP5
  cp5 = new ControlP5(this);

  // Cria a caixa de texto grande
  textoExplicativo = cp5.addTextarea("explicacao")
                        .setPosition(100, 120)
                        .setSize(550, 250)
                        .setFont(createFont("Arial", 18))
                        .setColor(color(0))
                        .setLineHeight(26)
                        .setColorBackground(color(245))
                        .setColorForeground(color(200));

  // Define o texto que aparecerá dentro da caixa
  textoExplicativo.setText(
    "O consumo de energia elétrica faz parte do nosso dia a dia.\n\n" +
    "Quando usamos lâmpadas, chuveiro, televisão e computador,\n" +
    "estamos utilizando energia.\n\n" +
    "Economizar energia ajuda o meio ambiente e também reduz gastos."
  );
}

void draw() {
  background(220);
}
```

## Pequenas diferenças em relação ao `Textlabel`

Algumas funções funcionam de forma parecida:

```java
.setPosition(100, 120)
```

Define onde a caixa aparece.

```java
.setSize(550, 250)
```

Define largura e altura da caixa.

```java
.setFont(createFont("Arial", 18))
```

Define a fonte do texto.

```java
.setColor(color(0))
```

Define a cor do texto dentro da caixa.

A principal diferença é que o `Textarea` cria uma área maior, com fundo, tamanho definido e várias linhas de texto.

---

## Funções importantes do `Textarea`

```java
.setLineHeight(26)
```

Define o espaçamento entre as linhas do texto.

Quanto maior o número, maior o espaço entre uma linha e outra.

```java
.setColorBackground(color(245))
```

Define a cor de fundo da caixa de texto.

```java
textoExplicativo.setText()
```

Define o texto que aparecerá dentro da caixa.

Exemplo:

```java
textoExplicativo.setText("Texto dentro da caixa");
```

---

# O que significa `\n`?

O símbolo:

```java
\n
```

significa **quebra de linha**.

Exemplo:

```java
"Primeira linha\nSegunda linha\nTerceira linha"
```

O resultado será:

```text
Primeira linha
Segunda linha
Terceira linha
```

Para pular uma linha em branco, usamos dois:

```java
"\n\n"
```

Exemplo:

```java
"Parágrafo 1.\n\nParágrafo 2."
```

Resultado:

```text
Parágrafo 1.

Parágrafo 2.
```

---

# Resumo final

Use:

```java
Textlabel
```

para títulos, subtítulos e textos curtos.

Use:

```java
Textarea
```

para explicações, descrições e textos maiores.

O `Textlabel` é mais simples. O `Textarea` é mais completo, porque permite criar uma caixa grande com fundo, tamanho definido, espaçamento entre linhas e textos organizados.

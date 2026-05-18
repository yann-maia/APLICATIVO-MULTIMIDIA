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

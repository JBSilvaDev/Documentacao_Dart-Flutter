# Widgets de Composição para Parâmetros que Compõem Outros Widgets

***

## ClipOval

- Usado para envolver seu filho em uma área circular/oval
- Composição:
  - child: Recebe um widget

***

## FittedBox

- Usado para redimensionar automaticamente seus filhos de acordo com a tela do usuário
- Composição:
  - child: Recebe um widget que será redimensionado de acordo com a tela (normalmente uma imagem)
  - fit: Recebe BoxFit.DIMENSION

***

## Image

- Usado para adicionar imagens ***Importante configurar a tag assets no .yaml***
- É possível colocar imagens iguais, porém de tamanhos diferentes, para serem usadas de acordo com a resolução do aparelho.
- Com base na imagem original, basta criar pastas com nomes como 2.0x para uma imagem 2x maior, 3.0x para uma imagem 3x maior e assim por diante. O Flutter irá reconhecer o tamanho da tela e escolherá a melhor imagem para exibir. A imagem menor fica na pasta raiz, e as maiores ficam nas pastas correspondentes, como 2.0x, 3.0x, 4.0x, etc.
- Composição:
  - image: Recebe um widget de imagem
    - NetworkImage ou AssetImage, que receberão o link da imagem
- Pode ser passado da seguinte forma:
  - Image.asset() recebe o link local da imagem
  - Image.network() recebe o link online da imagem

## CircleAvatar()

- Usado para definir imagens em formato circular (comum em imagens de perfil)
- Composição:
  - backgroundImage: NetworkImage (link online da imagem) ou AssetImage (link local da imagem) 
  - child: Recebe um widget para exibição dentro do CircleAvatar (na frente da imagem)
  - maxRadius: Tamanho máximo
  - minRadius: Tamanho mínimo

***

## Text

- Usado para exibir textos nos aplicativos, o texto é passado diretamente nos parênteses
- Composição:
  - style: Recebe um [TextStyle()](./WidgetsTree.md#TextStyle)

### TextStyle

- Usado para estilizar textos
- Composição:
  - backgroundColor: Recebe Colors.cor (cor de fundo do texto)
  - fontSize: Tamanho da fonte
  - fontFamily: Família à qual a fonte pertence
  - color: Recebe Colors.cor (cor do texto)
  - fontWeight: Peso da fonte (negrito, normal, etc.)
  - decoration: Recebe TextDecoration.ALGO

***

## EdgeInsets

- Usado para definir valores de margem e preenchimento (padding)
  - EdgeInsets.
    - EdgeInsets.all(valor) define o mesmo valor para todos os lados
    - EdgeInsets.fromLTRB(valorEsquerda, valorTopo, valorDireita, valorBase) define valores diferentes para cada lado
    - EdgeInsets.only(left: valor, top: valor, right: valor, bottom: valor) define valores específicos para cada lado
    - EdgeInsets.symmetric(horizontal: valor, vertical: valor) define valores iguais para os lados horizontais e verticais
***

## BoxDecoration

- É um conjunto de configurações para o widget pai.
- Composto por:
  - gradient: Recebe um [LinearGradient()](./WidgetsTree.md#LinearGradient).
  - color: Cor do widget, utiliza-se a classe Colors.
  - image: Recebe um [DecorationImage()](./WidgetsTree.md#DecorationImage).
  - borderRadius: Recebe um [BorderRadius()](./WidgetsTree.md#BorderRadius).
  - boxShadow: Recebe uma lista de configurações de sombreamento, como [BoxShadow()](./WidgetsTree.md#BorderRadius).
  - border: Recebe um [Border()](./WidgetsTree.md#border).
  - shape: Recebe um BoxShape....

## Border

- Usado para configurações de bordas específicas.
- Composto por:
  - top: Recebe um [BorderSide()](./WidgetsTree.md#borderside) para configurar a borda superior.
  - bottom: Recebe um [BorderSide()](./WidgetsTree.md#borderside) para configurar a borda inferior.
  - left: Recebe um [BorderSide()](./WidgetsTree.md#borderside) para configurar a borda esquerda.
  - right: Recebe um [BorderSide()](./WidgetsTree.md#borderside) para configurar a borda direita.

## BorderSide

- Usado para formatação de bordas.
- Composto por:
  - color: Recebe uma cor utilizando a classe Colors.
  - width: Recebe a largura das bordas.
  - style: Recebe um BorderStyle.nome ou BorderStyle.solid.

## LinearGradient

- Usado para passar mais de uma cor a um widget.
- Composto por:
  - colors: Recebe uma lista de cores, como [Colors.red, Colors.green, Colors.blue].

## BorderRadius

- Usado para definir o arredondamento das bordas de um widget.
- Composto por:
  - BorderRadius.all: Recebe um [Radius()](./WidgetsTree.md#Radius).
  - BorderRadius.horizontal: Recebe left e right, ambos [Radius()](./WidgetsTree.md#Radius).
  - BorderRadius.vertical: Recebe top e bottom, ambos [Radius()](WidgetsTree.md#Radius).
  - BorderRadius.only: Recebe topLeft, topRight, bottomLeft e bottomRight, todos [Radius()](./WidgetsTree.md#Radius).
  - BorderRadius.circular: Recebe um valor para o raio dos cantos.

## Radius

- Usado para passar valores ao BorderRadius.
- Composto por:
  - Radius.circular: Recebe um valor para o raio do canto circular.
  - Radius.elliptical: Recebe dois valores, um para o topo e outro para a base da elipse.

## DecorationImage

- Usado para adicionar uma imagem ao widget.
- Composto por:
  - image: Recebe um AssetImage(Link da imagem) ou um NetworkImage(Url da imagem).
  - fit: Recebe um BoxFit que define o preenchimento da imagem.

## BoxShadow

- Usado para passar valores de sombreamento.
- Composto por:
  - color: Recebe uma cor (Colors.black).
  - blurRadius: Recebe um inteiro para definir a tonalidade da sombra.
  - offset: Recebe um Offset(int, int) para definir a posição da sombra. Valor positivo para direita e inferior, valor negativo para esquerda e superior.
- É possível definir mais de

 um BoxShadow.

***

## Buttons

- Widgets utilizados nas composições de botões.

## TextButton.styleFrom()

- Utilizado em TextButton().
- Composto por:
  - primary: Recebe a cor do texto.
  - padding: Recebe um [EdgeInsets](./WidgetsTree.md#EdgeInsets).
  - minimumSize: Recebe um Size(largura, altura) para definir o tamanho mínimo.
  - shape: Recebe um [RoundedRectangleBorder](./WidgetsTree.md#RoundedRectangleBorder) para formatar o botão quando clicado.

## ElevatedButton.styleFrom()

- Utilizado em ElevatedButton().
- Composto por:
  - primary: Recebe a cor do texto.
  - padding: Recebe um [EdgeInsets](./WidgetsTree.md#EdgeInsets).
  - minimumSize: Recebe um Size(largura, altura) para definir o tamanho mínimo.
  - shape: Recebe um [RoundedRectangleBorder](./WidgetsTree.md#RoundedRectangleBorder) para formatar o botão.

## Icons

- Utilizado para ícones.
- Composto por:
  - Icon.icone_desejado.
  - size: Recebe o tamanho do ícone.
  - color: Recebe uma cor utilizando a classe Colors.

## ButtonStyle

- Utilizado para estilização de botões.
- Composto por:
  - shadowColor: Recebe a cor da sombra do botão utilizando [MaterialStateProperty](./WidgetsTree.md#materialstateproperty).
  - minimumSize: Recebe o tamanho mínimo do botão utilizando [MaterialStateProperty](./WidgetsTree.md#materialstateproperty).
  - backgroundColor: Recebe a cor de fundo do botão utilizando [MaterialStateProperty](./WidgetsTree.md#materialstateproperty).
  - shape: Recebe a formatação utilizando [MaterialStateProperty](./WidgetsTree.md#materialstateproperty).

## MaterialStateProperty

- Utilizado para passar propriedades de estado, por exemplo, em [ButtonStyle](./WidgetsTree.md#ButtonStyle).
  - .all: Quando utilizado, o valor passado será atribuído ao widget em todos os estados.
  - .resolveWith((state) {}): Utilizado para passar valores como cor, tamanho e sombra para cada estado.
    - Exemplo: 
      - Se o estado contiver desabilitado, a cor será vermelha.
      - Se for pressionado, a cor será azul.
      - ```dart
        if (states.contains(MaterialState.disabled)) return Colors.red;
        if (states.contains(MaterialState.pressed)) return Colors.blue;
        ```
- Composto por:
> Recebe propriedades a serem passadas para o widget, podendo aceitar outros widgets como:
  - MaterialStateProperty.all:
    - Colors.cor.
    - Size(largura, altura).
    - [RoundedRectangleBorder()](./WidgetsTree.md#RoundedRectangleBorder).
> Pode receber uma função com condições para aplicar uma propriedade.
- É recomendado fazer a tipagem, por exemplo: cor ```<Color>```, tamanho ```<Size>```, etc.
  - MaterialStateProperty.resolveWith```<Tipo>```((state) {```Condições```})

## RoundedRectangleBorder

- Utilizado para aplicar formatação de bordas a um widget.
- Composto por:
  - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius) para definir o raio das bordas.
  - side: Recebe um BorderSide(color: Colors.red) para definir a cor das bordas.
  - shadowColor: Recebe a cor da sombra.

***

## Divider

- Utilizado para criar uma separação visual entre itens, geralmente utilizado em listas.
- Composto por:
  - color: Recebe a cor do divisor.
  - thickness: Recebe a espessura do divisor.
  - height: Recebe a altura de cada item dividido.
  - indent: Recebe a posição inicial da linha divisória.
  - endIndent: Recebe a posição final da linha divisória.

***

## Duration

- Utilizado em conjunto com `Future.delayed(Duration aqui)`.
- Utilizado para atrasar a execução de uma ação ou aguardar um determinado tempo.
- Composto por:
  - days: Recebe um número inteiro para definir o número de dias de espera.
  - hours: Recebe um número inteiro para definir o número de horas de espera.
  - microseconds: Recebe um número inteiro para definir o número de microssegundos de espera.
  - milliseconds: Recebe um número inteiro para definir o número de milissegundos de espera.
  - minutes: Recebe um número inteiro para definir o número de minutos de espera.
  - seconds: Recebe um número inteiro para definir o número de segundos de espera.

***

## InputDecoration

- Utilizado para formatar campos de formulário.
- Composto por:
  - labelText: Recebe uma String que representa o rótulo do campo.
  - border: Recebe `OutlineInputBorder()`, que define a formatação da borda, composto por:
    - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius) para definir o raio da borda.
    - borderSide: Recebe [BorderSide](./WidgetsTree.md#BorderSide) para definir a formatação da linha da borda.
  - labelStyle: Recebe [TextStyle](./WidgetsTree.md#TextStyle) para definir a formatação do rótulo do campo.
  - isDense: Recebe um valor booleano (true ou false) para definir a densidade do campo.
  - enabledBorder: Define a formatação da borda quando o campo está ativo, recebendo `OutlineInputBorder()`, que é composto por:
    - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius) para definir o raio da borda.
    - borderSide: Recebe [BorderSide](./WidgetsTree.md#BorderSide) para definir a formatação da linha da borda.
  - focusedBorder: Define a formatação da borda quando o campo está selecionado, recebendo `OutlineInputBorder()`, que é composto por:
    - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius) para definir o raio da borda.
    - borderSide: Recebe [BorderSide](./WidgetsTree.md#BorderSide) para definir a formatação da linha da borda.
  - errorBorder: Define a formatação da borda quando há um erro no campo, recebendo `OutlineInputBorder()`, que

 é composto por:
    - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius) para definir o raio da borda.
    - borderSide: Recebe [BorderSide](./WidgetsTree.md#BorderSide) para definir a formatação da linha da borda.

## Align

- Utilizado para alinhar widgets.
- Composto por:
  - alignment: Recebe Alignment.posicao para definir a posição de alinhamento.
  - child: Recebe o widget que será alinhado.

## Positioned

- Utilizado para posicionar um widget em posições específicas.
- Composto por:
  - bottom: Recebe um valor para a posição inferior.
  - left: Recebe um valor para a posição esquerda.
  - right: Recebe um valor para a posição direita.
  - top: Recebe um valor para a posição superior.
  - child: Recebe o widget que será alinhado.

## BottomNavigationBarItem

- Utilizado como item do [BottomNavigationBar](./WidgetGeral.md#bottomnavigationbar).
- Composto por:
  - icon: Recebe um ícone que será exibido como botão na barra.
  - label: Recebe uma String que será exibida na barra.

## TweenAnimationBuilder

- Utilizado para definir os valores de animações.
- Composto por:
  - tween: Recebe `Tween` que define o valor inicial e final da animação (begin/end).
  - duration: Recebe a duração da animação.
  - builder: Recebe uma função anônima com 3 parâmetros *(contexto, valorFinal, child)* e retorna o widget que será animado.
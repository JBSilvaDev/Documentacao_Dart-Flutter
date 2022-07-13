# Widgets diversos

## Composição do corpo nos aplicativos

- [Documentação](https://docs.flutter.dev/reference/widgets)
- Widgets em sua maioria *filhos e netos* do [Scaffold](../Principais/Scaffold.md)
- Modelos usados sao para Android, para IOS usar [Cupertino](https://docs.flutter.dev/development/ui/widgets/cupertino)

## SizedBox()

- Usado para dar espaçamento entre widgets
- Compoe:
  - height: Recebe altura
  - width: Recebe largura

## Center()

- Todo conteudo deste widget fica centralizado na tela
- Recebe um unico filho
  - child: Widget

## Container()

- Conteiner representa uma caixa que pode conter um ou varios conteudos
- Compoe:
  - width: Largura do container, caso nao seja definica ele tomara todo espaço disponivel
  - height: Altura do container, caso nao seja definica ele tomara todo espaço disponivel
  - color: Cor do container
  - margin: Recebe um valor em [EdgeInserts](./WidgetsTree.md#edgeinsets) para definir as margens,
  - padding: Recebe um valor em [EdgeInserts](./WidgetsTree.md#edgeinsets) para definir as padding,
  - decoration: Quando usado a opção color do widget nao ira mais funcionar pois este parametro tem sua propria definição de cor, Usado com [BoxDecoration](./WidgetsTree.md#boxdecoration)
  - child: Recebe o widget filho para composição
  - OBS: É possivel adicionar um Container dentro do outro

## IntrinsicHeight() / IntrinsicWidth()

- Passa para seus filhos o tamanho necessario para conter seus dados, um para altura, outro para largura
- Compoe:
    - child: Recebe widget que ira ter somente o tamanho necessario para seus dados

## Expanded()

- Passa para seus filhos o tamanho restante disponivel da tela para assim ocupar este espaço
- Compoe:
    - child: Recebe widget que ira ocupar todo espaço restante na tela.


## Rows() & Columns()

- Rows
  - Organiza seus filhos em linhas da esqueda para direitra
  - Compoe:
    - children: Recebe uma lista de outros widgets
    - crossAxisAlignment: Recebe CrossAxisAlignment... ira organizar os filhos na coluna
      - CrossAxisAlignment.center = No meio da coluna
      - CrossAxisAlignment.start = Top da coluna
      - CrossAxisAlignment.end = Fim da coluna
      - CrossAxisAlignment.spaceAround = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela
      - CrossAxisAlignment.spaceEvenly = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela, espaço igual.
      - CrossAxisAlignment.spaceBetween = Da um espacamento igual entre os itens da coluna.
    - mainAxisAlignment: Recebe MainAxisAlignment... ira organizar os filhos na coluna
      - MainAxisAlignment.center = No meio da linha coluna
      - MainAxisAlignment.start = Direita da linha da coluna
      - MainAxisAlignment.end = Esquerda da linha da coluna
- Columns
  - Organiza seus filhos em colunas de cima para baixo
  - Compoe:
    - children: Recebe uma lista de outros widgets
    - mainAxisAlignment: Recebe MainAxisAlignment... ira organizar os filhos na coluna
      - MainAxisAlignment.center = No meio da coluna
      - MainAxisAlignment.start = Top da coluna
      - MainAxisAlignment.end = Fim da coluna
      - MainAxisAlignment.spaceAround = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela
      - MainAxisAlignment.spaceEvenly = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela, espaço igual.
      - MainAxisAlignment.spaceBetween = Da um espacamento igual entre os itens da coluna.
    - crossAxisAlignment: Recebe CrossAxisAlignment... ira organizar os filhos na coluna
      - CrossAxisAlignment.center = No meio da linha coluna
      - CrossAxisAlignment.start = Direita da linha da coluna
      - CrossAxisAlignment.end = Esquerda da linha da coluna
    - mainAxisSize: MainAxisSize.min,

## Buttons

- TextButton()
- Compoe:
  - onPressed: Recebe uma função de ação ao clicar (){}
  - child: Recebe widget de texto ou icone para exibir dentro do botao,
  - style: Formatação do texto, recebe um [TextButton.styleFrom()](./WidgetsTree.md#textbuttonstylefrom) ou [ButtonStyle](./WidgetsTree.md#ButtonStyle)
- ElevatedButton()
- Compoe:
  - onPressed: Recebe uma função de ação ao clicar (){}
  - child: Recebe widget de texto ou icone para exibir dentro do botao,
  - style: Formatação do texto, recebe um [ElevatedButton.styleFrom()](./WidgetsTree.md#elevatedbuttonstylefrom)) ou [ButtonStyle](./WidgetsTree.md#ButtonStyle)
- ElevatedButton.icon()
- Compoe:
  - onPressed: Recebe uma função de ação ao clicar (){}
  - Recebe um widget de [icone](WidgetsTree.md#Icons)
  - label: Recebe widget de texto,
- FloatingActionButton()
- Compoe:
  - onPressed: Recebe uma função de ação ao clicar (){}
  - tooltip: Recebe texto a ser exebido ou parar mouse ou longpress
  - child: Recebe widget de texto ou icone para exibir dentro do botao
- IconButton()
- Compoe:
  - onPressed: Recebe uma função de ação ao clicar (){}
  - icon: Recebe um widget de [icone](WidgetsTree.md#Icons)
- InkWell()
- Compoe:
  - onTap: Recebe uma função de ação ao clicar (){}
  - child: Recebe widget de texto,
  - borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius)
- GestureDetector()
- Compoe:
  - child: Recebe widget de texto,
  - onTap: Recebe uma função de ação ao clicar (){}
  - ao fazer algo: Recebe uma funcao que execulta uma ação ao fazer algo (onHorizontalDragStart, onVerticalDragStart, etc...)
- floatingActionButton : Este botão encontra-se dentro da [Scaffold](../Principais/Scaffold.md)

## Text()

- Usado para definir strings na aplicação
- Compoe:
  - *Conteudo String*
  - style: Recebe um [TextStyle](./WidgetsTree.md#textstyle)

## RotatedBox()

- Faz a rotação de outro widget
- Compoe:
  - quarterTurns: Recebe o valor da rodação (negativo esquerda, positivo direira)
  - child: Recebe o widget que sera rotacionado.

## SnackBar()

- Usado para mensagens rapidas na tela, pode ou nao conter interações com usuario.
- Dentro do onPressed ou similar invocamos a snackbar e enviamos seu conteudo para o ScaffoldMessenger
- Declarada uma variavel que recebe SnackBar() <= O snackbar pode ser passado diretamente no paramentro do .showSnackBar
- Por padrão as SnackBar sao fixas, para alterar adicione a propriedade behavior *Complet compose*
  - Quando a snackbar esta fixa o width nao funciona.
- [Simple compoe](../../img/simpleSnack.png):
  - context: Conteudo da snackbar
- [Action compoe](../../img/actionSnack.png):
  - context: Conteudo da snackbar
  - action: Recebe SnackBarAction que compoe:
    - label: Texto exibido (string solta sem uso do Text())
    - onPressed: Funcao anonima de ação ao ser clicada
- [Complet compose](../../img/completSnack.png):
  - context: Conteudo da snackbar, aceita widgets
  - action: Recebe SnackBarAction que compoe:
    - label: Texto exibido (string solta sem uso do Text())
    - onPressed: Funcao anonima de ação ao ser clicada
    - duration: Recebe um [Duration](./WidgetsTree.md#duration)
    - padding: Recebe [EdgeInserts](./WidgetsTree.md#edgeinsets)
    - behavior: Recebe SnackBarBehavior.floating
    - width: Largura da SnackBar
    - shape: Recebe [RoundedRectangleBorder](./WidgetsTree.md#roundedrectangleborder)
- Invoca-se o *```ScaffoldMessenger.of(context).showSnackBar(snackbar);```*
  - Passa como parametro do .of o [context](../Fundamentos.md#buildcontext)
  - Passa como paramentro do .showSnackBar a variavel que a contem.

## Stack()

- Usado para posicionar widgets em locais desejados
- Stack nao alinha os widget um ao lado do outro ou debaixo do outro, ele sobrepoe um ao outro, cabe ao usuario definir uma posição para cada widget dentro do stack.
- Compoe:
  - children: Recebe um ou mais widgets
    - Os widgets sao empilhados um sobre o outro
    - Para definir a posição de cada widget usa-se o [Align](./WidgetsTree.md#align) ou [Positioned](./WidgetsTree.md#positioned) como pai
      - Stakc => Align => Widget

## IndexedStack()

- Usado para posicionar widgets um sobre o outro, exibindo um por vez de acordo com o index passado
- Compoe:
  - index: Recebe o index de um dos itens da lista para ser exibido (padrao é 0)
  - children: Recebe um ou mais widgets que serao exibidos de acordo com seu index

## Card()

- Sua exibição ao usuario é similar a [container](./WidgetGeral.md#container)
- Compoe:
  - elevation: Recebe valor da sombra do card
  - shape: Recebe [RoundedRectangleBorder](./WidgetsTree.md#roundedrectangleborder)
  - child: Recebe widget

## BottomNavigationBar()

- Usado para passar botes na barra inferior da pagina
- Para navegacao ou troca de widget na tela
  - Necessario lista de items a serem exibidos ou executados para cada botao na barra
    - Cada item possui um index na lista.
  - Necessario uma variavel int para ser o index dos itens na lista -> ```int _indiceAtual = 0;```
  - Necessario funcao que ira receber o index atual e passar o valor para varaivel
  - Exemplo -> [Clique aqui](../../Img/listaItems.jpg)
  - Compoe:
    - items: Recebe uma lista de [BottomNavigationBarItem](./WidgetsTree.md#bottomnavigationbaritem), ***Necessario ter 2 ou mais itens na lista***
    - onTap: Recebe index do botao clicado passando-o para outra funcao que ira executar uma acao de acordo com o valor de index
    - currentIndex: Recebe a variavel
    - Exemplo -> [Clique aqui](../../Img/listaItems2.jpg)
- Para açõe na tela
  - Necessario uma funcao para receber o index do onTap
  - Necessario um comparador como o switch case para execultar algo de acordo com o index recebido
  - Exemplo -> [Clique aqui](../../Img/listaItems3.jpg)
  - Compoe:
    - items: Recebe uma lista de [BottomNavigationBarItem](./WidgetsTree.md#bottomnavigationbaritem),
    - onTap: Recebe index do botao clicado passando-o para outra funcao que ira executar uma acao de acordo com o valor de index
    - Exemplo -> [Clique aqui](../../Img/listaItems4.jpg)

## MaterialBanner

- Possue a mesma estrutura da [snackBar](./WidgetGeral.md#snackbar)
- Invoca-se o *ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);*
- Ocultar o *ScaffoldMessenger.of(context).hideCurrentMaterialBanner();*
  - Passa como parametro do .of o [context](../Fundamentos.md#buildcontext)
  - Passa como paramentro do .showMaterialBanner a variavel que a contem o MaterialBanner()
- Compoe:
  - actions: Recebe uma lista de ações (exemplo botoes) - *Obrigatorio*
  - content: Recebe o conteudo a ser exibido no banner
  - backgroundColor: Recebe Colors.cor
  - forceActionsBelow: Recebe true ou false, para determinar se botoes de ação ficam na parte debaixo do banner ou nao, padrao é false
- Banners nao somem automaticamente da tela apos serem exibidos, esta ação deve ser feita por um botao de ação dentro das actions

## Visibility

- Usado para exibir widget se uma condição for atendida (similar ao if)
- Compoe:
  - visible: condição a ser atendida
  - child: widget que sera exbido se a condição for true

## CheckBox

- Caixa de seleção, execulta alguma ação ao ser selecionada
- Exemplo: [Check - SnackBar](../../Img/checkBox.jpg)
- Compoe:
  - onChanged: Função a ser execultada quando selecionado
  - value: valor selecionado (true ou false),

# Widgets diversos
## Composição do corpo nos aplicativos

-   [Documentação](https://docs.flutter.dev/reference/widgets)
-   Widgets em sua maioria *filhos e netos* do [Scaffold](Scaffold.md)
-   Modelos usados sao para Android, para IOS usar [Cupertino](https://docs.flutter.dev/development/ui/widgets/cupertino)
>SizedBox()
-   Usado para dar espaçamento entre widgets
-   Compoe:
    -   height: Recebe altura
    -   width: Recebe largura
>Center()
-  Todo conteudo deste widget fica centralizado na tela
-  Recebe um unico filho
    - child: Widget
>Container()
-   Conteiner representa uma caixa que pode conter um ou varios conteudos
- Compoe:
    -   width: Largura do container, caso nao seja definica ele tomara todo espaço disponivel
    -   height: Altura do container, caso nao seja definica ele tomara todo espaço disponivel
    -   color: Cor do container
    -   margin: Recebe um valor em [EdgeInserts](./WidgetsTree.md) para definir as margens,
    -   padding: Recebe um valor em [EdgeInserts](./WidgetsTree.md) para definir as padding,
    -   decoration: Quando usado a opção color do widget nao ira mais funcionar pois este parametro tem sua propria definição de cor, Usado com [BoxDecoration](./WidgetsTree.md#BoxDecoration)
    -   child: Recebe o widget filho para composição
    -   OBS: É possivel adicionar um Container dentro do outro
>Rows() & Columns()
- Rows
    -   Organiza seus filhos em linhas da esqueda para direitra
    -   Compoe:
        - children: Recebe uma lista de outros widgets 
        -   crossAxisAlignment: Recebe CrossAxisAlignment... ira organizar os filhos na coluna
            -   CrossAxisAlignment.center = No meio da coluna
            -   CrossAxisAlignment.start = Top da coluna
            -   CrossAxisAlignment.end = Fim da coluna
            -   CrossAxisAlignment.spaceAround = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela
            -   CrossAxisAlignment.spaceEvenly = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela, espaço igual.
            -   CrossAxisAlignment.spaceBetween = Da um espacamento igual entre os itens da coluna.
        -   mainAxisAlignment: Recebe MainAxisAlignment... ira organizar os filhos na coluna
            -   MainAxisAlignment.center = No meio da linha coluna
            -   MainAxisAlignment.start = Direita da linha da coluna
            -   MainAxisAlignment.end = Esquerda da linha da coluna
- Columns
    -   Organiza seus filhos em colunas de cima para baixo
    -   Compoe:
        -   children: Recebe uma lista de outros widgets 
        -   mainAxisAlignment: Recebe MainAxisAlignment... ira organizar os filhos na coluna
            -   MainAxisAlignment.center = No meio da coluna
            -   MainAxisAlignment.start = Top da coluna
            -   MainAxisAlignment.end = Fim da coluna
            -   MainAxisAlignment.spaceAround = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela
            -   MainAxisAlignment.spaceEvenly = Da um espacamento entre os itens da coluna seu topo e seu final baseado no espaço total dela, espaço igual.
            -   MainAxisAlignment.spaceBetween = Da um espacamento igual entre os itens da coluna.
        -   crossAxisAlignment: Recebe CrossAxisAlignment... ira organizar os filhos na coluna
            -   CrossAxisAlignment.center = No meio da linha coluna
            -   CrossAxisAlignment.start = Direita da linha da coluna
            -   CrossAxisAlignment.end = Esquerda da linha da coluna
>Buttons
-   TextButton()
-   Compoe:
    -   onPressed: Recebe uma função de ação ao clicar (){}
    -   child: Recebe widget de texto,
    -   style: Formatação do texto, recebe um [TextButton.styleFrom()](./WidgetsTree.md#TextButton.styleFrom()) ou [ButtonStyle](./WidgetsTree.md#ButtonStyle)
-   ElevatedButton()
-   Compoe:
    -   onPressed: Recebe uma função de ação ao clicar (){}
    -   child: Recebe widget de texto,
    -   style: Formatação do texto, recebe um [ElevatedButton.styleFrom()](./WidgetsTree.md#ElevatedButton.styleFrom()) ou [ButtonStyle](./WidgetsTree.md#ButtonStyle)
-   ElevatedButton.icon()
-   Compoe:
    -   onPressed: Recebe uma função de ação ao clicar (){}
    -   Recebe um widget de [icone](WidgetsTree.md#Icons)
    -   label: Recebe widget de texto,
-   InkWell()
-   Compoe:
    -   onTap: Recebe uma função de ação ao clicar (){}
    -   child: Recebe widget de texto,
    -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius)
-   GestureDetector()
-   Compoe:
    -   child: Recebe widget de texto,
    -   onTap: Recebe uma função de ação ao clicar (){}
    -   ao fazer algo: Recebe uma funcao que execulta uma ação ao fazer algo (onHorizontalDragStart, onVerticalDragStart, etc...)

>Text()

>RotatedBox()
-   Faz a rotação de outro widget
-   Compoe:
    -   quarterTurns: Recebe o valor da rodação (negativo esquerda, positivo direira)
    -   child: Recebe o widget que sera rotacionado.

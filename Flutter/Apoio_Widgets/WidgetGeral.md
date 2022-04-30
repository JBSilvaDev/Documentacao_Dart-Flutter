# Widgets diversos
## Composição do corpo nos aplicativos

-   [Documentação](https://docs.flutter.dev/reference/widgets)
-   Widgets em sua maioria *filhos e netos* do [Scaffold](Scaffold.md)

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
    -   decoration: Quando usado a opção color do widget nao ira mais funcionar pois este parametro tem sua propria definição de cor, Usado com [BoxDecoration](./WidgetsTree.md#boxdecoration)
    -   child: Recebe o widget filho para composição
    -   OBS: É possivel adicionar um Container dentro do outro
>Rows & Columns
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
        

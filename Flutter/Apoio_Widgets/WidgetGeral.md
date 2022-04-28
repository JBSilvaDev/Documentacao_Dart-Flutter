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
    -   decoration: Quando usado a opção color do widget nao ira mais funcionar pois este parametro tem sua propria definição de cor, Usado com [BoxDecoration](./WidgetsTree.md)
    -   child: Recebe o widget filho para composição

# Tela dinamica, com rolagem

## SingleChildScrollView
- Usado para rolegem dos itens na tela evitando que "estourem" o limite da tela
- Compoe:
    - child: Recebe widget
---
## ListView
- Usado empilhar os itens em formato de lista evitando assim que "estourem" o limite da tela
- Compoe:
    - children: Recebe uma lista de widgets
## ListTile
- Usado para itens de lista
- Compoe:
    -   title: Recebe widget de texto par titulo
    -   subtitle: Recebe widget de texto com subtitulo
    -   leading: Recebe um widget para lado esquedo
    -   trailing: Recebe um widget para lado direito
## ListView.builder()
- Usado para empilhar itens de um contexto, carregando-os conforme a necessidade
- Compoe:
    - itemCount: Recebe a quantidade de itens que tera na lista
    - itemBuilder: Recebe uma funcao anonima de (context, index){} onde seu retorno é um widget com conteudo da lista, como um [Container](./WidgetGeral.md#container) ou um [ListTile](./Scroll_List.md#listtile)
## ListView.separated
- Usado para empilhar itens de um contexto, carregando-os conforme a necessidade
- Compoe:
    - separatorBuilder: Recebe uma funcao anonima de (context, index){} onde seu retorno é um [divisor](./WidgetsTree.md#divider) ou qualquer outro widget que sirva para separar os itens, [Container](./WidgetGeral.md#container) por exemplo.
    - itemCount: Recebe a quantidade de itens que tera na lista
    - itemBuilder: Recebe uma funcao anonima de (context, index){} onde seu retorno é um widget com conteudo da lista, como um [Container](./WidgetGeral.md#container) ou um [ListTitle](./Scroll_List.md#listtitle)
## ListBody
- Usado para empilhar itens em listas (um abaixo d outro)
- Compoe:
    - children: Recebe uma lista de widgets que ira compor seu conteudo empilhado
    - reverse: Recebe true ou false para determinar a ordem dos itens na lista

# PopupMenuButton()
- Usado com conjunto com [Enum](../../Dart/Lista_Map_Set_Enum/Enums.md) assim evitando erros de digitação usando seus itens para intanciar um valor (Enum Usado ***PopupMenuPages***)
- Usado em actions dentro da [AppBar()](AppBar.md)
## Utilização
-   PopupMenuButton é tipado pelo tipo do enum declarado
-   Compoe:
    -   icon: [Opcional] Icone a ser usado
    -   onSelected: Recebe uma funcao que em seu parametro recebe os valores de PopupMenuPages
        -   No Switch Case é passado o valor recebido do PopupMenuPages
        -   Caso este valor seja *PopupMenuPages.container* use [Navege](../Navegacao.md) para pagina correspondente, o mesmo valor para *PopupMenuPages.rows_columns*.
    -   itemBuilder: Recebe uma função que em seu paramentro recebe o contexto passado no builder.
        -   Essa funcao retorna uma lista de items para o menu
        -   A lista é composta por varios outros *PopupMenuItem< PopupMenuPages >* e cada um deles passa um valor diretente para o contexto do builder:
            -   value: Valor do Enum PopupMenuPages
            -   child: Texto exibido no menu
    -   OBS: A lista no retorno é tipada como *<PopupMenuItem< PopupMenuPages >>* - Opcional
        -   A lista é um tipo de manu que em seu conteudo tera itens do Enum *PopupMenuPages*
    -   OBS: Os itens da lista sao tipados como *PopupMenuItem< PopupMenuPages >*
        - Os itens fazem parte do menu, e seu conteudo compoe o valor do menu
    -   OBS: caso nao deseje usar Enum, subitituir a tipagem *PopupMenuPages* pelo valor desejado, (String, int, etc...), para este caso o valor passado no value deve ser do mesmo tipo (String, int, etc...)
    -   OBS: o exemplo abaixo é para navegação, necessario configurar os routers no [MaterialApp](MateralApp.md)
>Enum
```dart
enum PopupMenuPages {
  container,
  rows_columns
}
```
>PopupMenuButton
```dart
PopupMenuButton<PopupMenuPages>(
    icon: Icon(Icons.menu),
    onSelected: (PopupMenuPages valueSelected) {
        switch (valueSelected) {
        case PopupMenuPages.container:
        Navigator.of(context).pushNamed('/container');
        break;
        case PopupMenuPages.rows_columns:
        Navigator.of(context).pushNamed('/rows_columns');
        break;
        }}, itemBuilder: (BuildContext context) {
            return <PopupMenuItem<PopupMenuPages>>[

              PopupMenuItem<PopupMenuPages>(
                value: PopupMenuPages.container,
                child: Text('Container'),
              ),
              PopupMenuItem<PopupMenuPages>(
                value: PopupMenuPages.rows_columns,
                child: Text('Rows & Columns'),
              ),];
          })
```
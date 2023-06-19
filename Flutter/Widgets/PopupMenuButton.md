# PopupMenuButton()
- Utilizado em conjunto com [Enum](../../Dart/Lista_Map_Set_Enum/Enums.md) para evitar erros de digitação ao usar seus itens para instanciar um valor (Enum utilizado: ***PopupMenuPages***).
- Usado nas ações dentro do widget [AppBar()](../Principais/AppBar.md).

## Utilização
- O `PopupMenuButton` é tipado com o tipo do enum declarado.
- Composição:
    - `icon`: [Opcional] Ícone a ser utilizado.
    - `onSelected`: Recebe uma função que, em seu parâmetro, recebe os valores de `PopupMenuPages`.
        - Utilize um `switch case` para tratar o valor recebido de `PopupMenuPages`.
        - Se o valor for *PopupMenuPages.container*, navegue para a página correspondente utilizando [Navegação](../Principais/Navegacao.md). Faça o mesmo para o valor *PopupMenuPages.rows_columns*.
    - `itemBuilder`: Recebe uma função que, em seu parâmetro, recebe o contexto fornecido no `builder`.
        - Essa função retorna uma lista de itens para o menu.
        - A lista é composta por vários `PopupMenuItem<PopupMenuPages>`, em que cada um deles fornece um valor diretamente para o contexto do `builder`:
            - `value`: Valor do Enum `PopupMenuPages`.
            - `child`: Texto exibido no menu.
    - OBS: A lista de retorno é tipada como `<PopupMenuItem<PopupMenuPages>>` [Opcional].
        - A lista é um tipo de menu que contém itens do Enum `PopupMenuPages`.
    - OBS: Os itens da lista são tipados como `PopupMenuItem<PopupMenuPages>`.
        - Os itens fazem parte do menu, e seu conteúdo representa o valor do menu.
    - OBS: Caso não deseje utilizar um Enum, substitua a tipagem `PopupMenuPages` pelo tipo desejado (String, int, etc.). Nesse caso, o valor fornecido em `value` deve ser do mesmo tipo (String, int, etc.).
    - OBS: O exemplo abaixo é para navegação, portanto é necessário configurar as rotas no [MaterialApp](../Principais/MateralApp.md).

> Enum
```dart
enum PopupMenuPages {
  container,
  rows_columns
}
```
> PopupMenuButton
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
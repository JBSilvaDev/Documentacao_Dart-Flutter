# Diálogo

```dart
import 'package:flutter/material.dart';

class DialogCustom extends Dialog {
  DialogCustom(BuildContext context)
      : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Título X'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Fechar Diálogo'),
                ),
              ],
            ),
          ),
        );
}
```

A classe `DialogCustom` foi corrigida e formatada adequadamente. Ela estende `Dialog` e pode ser usada como uma caixa de diálogo personalizada. No construtor da classe, é fornecido um parâmetro `BuildContext context`, que é necessário para as ações nos botões dentro da caixa de diálogo, como o `pop`.

Dentro da herança (`super`), foram definidos:

- `shape`: Recebe um `RoundedRectangleBorder` que define as bordas arredondadas da caixa de diálogo.
- `child`: Recebe um container que será o corpo da caixa de diálogo. Neste exemplo, o container contém um título e um botão para fechar o diálogo.

## Invocando uma caixa de diálogo

```dart
@override
Widget build(BuildContext contextBuilderPage) {
  /* <= Contexto a ser passado no context no onPressed */
  return Scaffold(
    appBar: AppBar(
      title: const Text('Diálogos'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Texto do botão'),
          ),
        ],
      ),
    ),
  );
}
```

### Diálogo Personalizado

Para invocar o diálogo personalizado, use o `onPressed` ou algo similar. Por padrão, ao clicar fora da caixa de diálogo, ela será fechada. Para desabilitar isso, é utilizado o `barrierDismissible`.

O `context` recebe o contexto do construtor da página (`contextBuilderPage`). O `builder` recebe uma função anônima que recebe um parâmetro qualquer. Seu retorno é a própria classe que compõe a caixa de diálogo, passando no parâmetro do construtor o contexto qualquer que foi passado no parâmetro do `builder`.

```dart
onPressed: () {
  showDialog(
    barrierDismissible: false,
    context: contextBuilderPage,
    builder: (paramQualquer) {
      return DialogCustom(paramQualquer);
    },
  );
},
```

### Simple Dialog

Para invocar o Simple Dialog, use o `onPressed` ou algo similar. Por padrão, ao clicar fora da caixa, ela será fechada. Para desabilitar isso, é utilizado o `barrierDismissible`.

O `context` recebe o contexto do construtor da página (`contextBuilderPage`). O `builder` recebe uma função anônima que recebe um parâmetro qualquer. Seu retorno é um `SimpleDialog()` que é composto por:

- `title`: Título da caixa de diálogo.
- `contentPadding`: Recebe um `EdgeInsets` que define o espaçamento

 interno do conteúdo.
- `children`: Recebe uma lista de Widgets que serão exibidos dentro da caixa de diálogo.

O contexto passado no `Navigator` é o mesmo que está no `builder`.

```dart
onPressed: () {
  showDialog(
    barrierDismissible: false,
    context: contextBuilderPage,
    builder: (paramQualquer) {
      return SimpleDialog(
        title: Text('Simple Dialog'),
        contentPadding: EdgeInsets.all(10),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Título X'),
          ),
          TextButton(
            onPressed: () => Navigator.of(paramQualquer).pop(),
            child: Text('Fechar Diálogo'),
          ),
        ],
      );
    },
  );
},
```

### AlertDialog

Para invocar o AlertDialog, use o `onPressed` ou algo similar. Por padrão, ao clicar fora da caixa, ela será fechada. Para desabilitar isso, é utilizado o `barrierDismissible`.

O `context` recebe o contexto do construtor da página (`contextBuilderPage`). O `builder` recebe uma função anônima que recebe um parâmetro qualquer. Seu retorno é um `AlertDialog()` que é composto por:

- `title`: Título da caixa de diálogo.
- `content`: Recebe um conteúdo para a caixa de diálogo. No exemplo, é utilizado um `SingleChildScrollView` que tem como child um `ListBody`, mas poderia ser qualquer outro widget, como um `Container`.
- `actions`: Recebe uma lista de Widgets que serão exibidos dentro da caixa de diálogo como botões para executar alguma ação.

O contexto passado no `Navigator` é o mesmo que está no `builder`.

```dart
onPressed: () {
  showDialog(
    barrierDismissible: false,
    context: contextBuilderPage,
    builder: (paramQualquer) {
      return AlertDialog(
        title: Text('Alert Dialog'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Deseja salvar??? (Exemplo aqui não salva nada)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(paramQualquer).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(paramQualquer).pop(),
            child: Text('Confirmar'),
          ),
        ],
      );
    },
  );
},
```

### Timer Picker

O Timer Picker é usado para obter ou enviar horários. É utilizado `async`/`await` para recuperar o valor informado pelo usuário.

Use o `onPressed` ou algo similar para invocar o `showTimePicker`. Dentro do `onPressed`, foi definida uma variável que aguardará e receberá o valor selecionado pelo `showTimePicker`.

O `context` recebe o contexto do construtor da página (`contextBuilderPage`). O `initialTime` recebe `TimeOfDay.now()`, que representa o horário atual no dispositivo em uso.

No final, o valor selecionado pelo usuário é exibido no console.

```dart
onPressed: () async {
  final selectedTime = await showTimePicker(
    context: contextBuilderPage,
    initialTime: TimeOfDay.now(),
  );
  print('Horário selecionado: $selectedTime');
},
```

### Date Timer

O Date Timer é usado para obter ou enviar datas. É utilizado

 `async`/`await` para recuperar o valor informado pelo usuário.

Use o `onPressed` ou algo similar para invocar o `showDatePicker`. Dentro do `onPressed`, foi definida uma variável que aguardará e receberá o valor selecionado pelo `showDatePicker`.

O `context` recebe o contexto do construtor da página (`contextBuilderPage`). `initialDate` recebe `DateTime.now()`, que exibirá a data atual no dispositivo em uso. `firstDate` recebe `DateTime(anoInicial)`, que é o ano mínimo que o calendário exibirá. `lastDate` recebe `DateTime(anoFinal)`, que é o ano máximo que o calendário exibirá.

No final, o valor selecionado pelo usuário é exibido no console.

```dart
onPressed: () async {
  final dataSelecionada = await showDatePicker(
    context: contextBuilderPage,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  print('A data escolhida foi $dataSelecionada');
},
```
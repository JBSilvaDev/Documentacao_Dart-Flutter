# Dialoag
- Usados para interagir com usuario em uma caixa de dialogo flutuante
- Modelo de caixa de dialogo custumizada em uma classe
- Todos os dialogs podem retornar um future e para recupera algum dado dele usa-se o [async await](../../Dart/Dart_OO/Async.md), Exemplo usado em [TimePicker](./Dialogs.md#timer-picker) e [DateTime](./Dialogs.md#date-timer)
```dart
class DialogCuston extends Dialog {
  DialogCuston(BuildContext context) : super(
    shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
    child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Titulo X'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Fechar Dialog'),
                ),
              ],
            ),
          ));
}
```
- Classe que extente Dialog, assim herdando seus atributos
- Definido um contrutor que herda seu superior (pai) recebendo como paramentro um (BuildContext context) que é necessario para ações em botoes que estao na caixa de dialogo, exemplo o [pop](../Principais/Navegacao.md#utilização)
- Dentro desta herança (super), foi definido:
    - shape: Recebe um [RoundedRectangleBorder](./WidgetsTree.md#roundedrectangleborder)
    - child: Recebe um container que sera o corpo da caixa de dialogo
        -    Este container ira conter botoes onde executara uma ação (opcional)

## Invocando caixa de dialogo
```dart
@override
  Widget build(BuildContext contextBuilderPage) { /* <= Contexto a ser passado no context no onPressed */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed:(){}, child: Text('Texto do botao'))
```
### Custon Dialog
- Usando onPressed ou similar para invocar o dialog
- Por padrao ao clicar fora da caixa ela é fechada, para desabilidar isso implementa-se o *barrierDismissible*
- O context recebe o contexto do builder da pagina *contextBuilderPage*
- O builder recebe uma funcao anonima que recebe um parametro qualquer
- Seu retorno é a propria classe que compoe a caixa de dialogo, passando em seu paramentro o contexto quaquer que foi passado no paramentro do builder.
```dart
 onPressed: () {
    showDialog(
        barrierDismissible: false,
        context: contextBuilderPage,
        builder: (paramQualquer) {
        return DialogCuston(paramQualquer);
        },
    );
    },
```
### Simple Dialog
- Usando onPressed ou similar para invocar o dialog
- Por padrao ao clicar fora da caixa ela é fechada, para desabilidar isso implementa-se o *barrierDismissible*
- O context recebe o contexto do builder da pagina *contextBuilderPage*
- O builder recebe uma funcao anonima que recebe um parametro qualquer
- Seu retorno é um SimpleDialog() que é composto por:
    - title: Titulo da caixa de dialogo
    - contentPadding: Recebe um [EdgeInsets](./WidgetsTree.md#edgeinsets)
    - children: Recebe lista de Widgets que ira conter dentro da caixa de dialogo
- O context passado no [navigator](../Principais/Navegacao.md#utilização) é o mesmo que esta no builder
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
                child: Text('Titulo X'),
            ),
            TextButton(
                onPressed: () => Navigator.of(paramQualquer).pop(),
                child: Text('Fechar Dialog'),
            ),],
        );},
    );},
```
### AlertDialog
- Usando onPressed ou similar para invocar o dialog
- Por padrao ao clicar fora da caixa ela é fechada, para desabilidar isso implementa-se o *barrierDismissible*
- O context recebe o contexto do builder da pagina *contextBuilderPage*
- O builder recebe uma funcao anonima que recebe um parametro qualquer
- Seu retorno é um AlertDialog() que é composto por:
    - title: Titulo da caixa de dialogo
    - content: Recebe um conteudo para a caixa de dialogo, no exemplo -> [SingleChildScrollView](./Scroll_List.md#singlechildscrollview) que em seu child recebe [ListBody](./Scroll_List.md#listbody)
    - actions: Recebe lista de Widgets que ira conter dentro da caixa de dialogo como botoes para execultar alguma ação.
- O context passado no [navigator](../Principais/Navegacao.md#utilização) é o mesmo que esta no builder
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
                    child: Text(
                        'Deseja salvar??? (Exemplo aqui nao salva nada)'),
                    ),
                ],
                ),
            ),
            actions: [
                TextButton(
                    onPressed: () => Navigator.of(paramQualquer).pop(),
                    child: Text('Cancelar')),
                TextButton(
                    onPressed: () => Navigator.of(paramQualquer).pop(),
                    child: Text('Confirmar'))],
                );}
            );},
```
### Timer Picker
- Usado para obter ou enviar horarios
- Utilizado o async await para recupera valor informado pelo usuario
- Usando onPressed ou similar para invocar o showTimePicker
- Dentro do onPressed foi definida uma variavel que ira aguardar e receber o valor do showTimePicker
- O context recebe o contexto do builder da pagina *contextBuilderPage*
- O initialTime recebe o TimeOfDay.now() que é a hora atual no aparelho em uso
- Ao final exibe o valor selecionado pelo usuario no console
```dart
onPressed: () async {
    final selectedTime = await showTimePicker(
        context: contextBuilderPage,
        initialTime: TimeOfDay.now(),
    );
    print('Selecionou o horario $selectedTime');
    },
``` 

### Date Timer
- Usado para obter ou enviar horarios
- Utilizado o async await para recupera valor informado pelo usuario
- Usando onPressed ou similar para invocar o showDatePicker
- Dentro do onPressed foi definida uma variavel que ira aguardar e receber o valor do showDatePicker
- O context recebe o contexto do builder da pagina *contextBuilderPage*
- initialDate: Recebe DateTime.now(), que ira exibir a data atual no aparelho em uso
- firstDate: Recebe DateTime(ano inicial) pois é o ano minimo que o calendario ira exibir
- lastDate: DateTime(ano final) pois é o ano maximo que o calendario ira exibir
- Ao final exibe o valor selecionado pelo usuario no console
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
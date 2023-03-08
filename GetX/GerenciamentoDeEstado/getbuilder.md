# GetX GetBuilder
- Usado para fazer o rebuilde de uma parte da tela por completo, similar ao Builder() ou StatefulBuilder()
> Controller usado
```dart
class GetBuilderController extends GetxController {
  var nome = 'JB';

  int conter = 0;

  alterarNome() {
    nome = 'JB Silva';
    update();
  }

  increment() {
    conter++;
    update(['contador']);
  }
}
```
- No exemplo todos os itens dentro de Column() serão rebuildados ao precionar o botão
```dart
GetBuilder<GetBuilderController>(builder: (controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(controller.nome),
        ElevatedButton(
            onPressed: () {
              controller.alterarNome();
            },
            child: const Text('Alterar nome')),
      ],
    );
  }),
```
- Neste exemplo apenas os itens que correspondem ao id passado serao rebuildados.
```dart
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ 
      GetBuilder<GetBuilderController>(
          id: 'contador',
          builder: (control) {
            return Text(controller.conter.toString());
          }),
      ElevatedButton(
          onPressed: () {
            controller.increment();
          },
          child: const Text('Increment')),
    ],
  );
```
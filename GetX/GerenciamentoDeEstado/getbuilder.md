# GetX GetBuilder

O `GetBuilder` é usado para reconstruir completamente uma parte da tela, de forma similar ao `Builder()` ou ao `StatefulBuilder()`.

## Controller utilizado

Aqui está um exemplo de um controller utilizado com o `GetBuilder`:

```dart
class GetBuilderController extends GetxController {
  var nome = 'JB';

  int contador = 0;

  void alterarNome() {
    nome = 'JB Silva';
    update();
  }

  void incrementar() {
    contador++;
    update(['contador']);
  }
}
```

## Rebuild de todos os itens dentro de um widget

No exemplo a seguir, todos os itens dentro do `Column()` serão rebuildados quando o botão for pressionado:

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
        child: const Text('Alterar nome'),
      ),
    ],
  );
}),
```

## Rebuild seletivo com identificadores

No exemplo a seguir, apenas o item que corresponde ao ID especificado será rebuildado:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    GetBuilder<GetBuilderController>(
      id: 'contador',
      builder: (controller) {
        return Text(controller.contador.toString());
      },
    ),
    ElevatedButton(
      onPressed: () {
        controller.incrementar();
      },
      child: const Text('Incrementar'),
    ),
  ],
);
```

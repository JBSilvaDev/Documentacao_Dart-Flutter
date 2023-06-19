# GetX Widget

O GetX oferece um widget chamado `GetX` que serve como uma alternativa ao uso de `Obx`. Ao usar o `GetX` widget, não é necessário passar os bindings na rota. Em vez disso, você passa a classe controladora usando a propriedade `init` e, em seguida, na propriedade `builder`, você define uma função com um parâmetro que recebe a instância da controller. Isso permite que você acesse o conteúdo da classe controladora usando a variável do parâmetro.

## Classe utilizada

Aqui está um exemplo de classe controladora que será utilizada:

```dart
class GetxWidgetController extends GetxController {
  final _nome = 'Jb Silva'.obs;

  String get nome => _nome.value;

  void alterarNome(String nomeNovo) {
    _nome(nomeNovo);
  }
}
```

## Utilização para consulta e alteração

Tanto o widget exibidor quanto o botão que faz a alteração estão envoltos no `GetX` Widget, pois eles precisam da instância da controller.

```dart
GetX(
  init: GetxWidgetController(),
  builder: (controller) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(controller.nome),
      ElevatedButton(
        onPressed: () {
          controller.alterarNome('Nome alterado');
        },
        child: const Text('Alterar nome'),
      ),
    ],
  ),
),
```

Nesse exemplo, o `GetX` widget é iniciado com a classe `GetxWidgetController`. No `builder`, você tem acesso à instância da controller através do parâmetro `controller`. Você pode usar essa instância para exibir o nome e para chamar o método `alterarNome` quando o botão for pressionado.
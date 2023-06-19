# GetX Controller

O `GetX Controller` é uma classe fornecida pelo GetX que pode ser estendida para criar uma classe controladora. Ela possui três métodos que podem ser sobrescritos para executar ações em momentos específicos:

1. `onInit()`: Executado sempre que a página é iniciada.
2. `onReady()`: Executado sempre que a página é completamente carregada.
3. `onClose()`: Executado sempre que a página é fechada.

Aqui está um exemplo de uma classe controladora que estende `GetXController`:

```dart
class Controller extends GetxController {
  final _nome = 'JB Silva'.obs;

  String get nome => _nome.value;

  @override
  void onInit() {
    print('TODO: implementar onInit');
    super.onInit();
  }

  @override
  void onReady() {
    print('TODO: implementar onReady');
    super.onReady();
  }

  @override
  void onClose() {
    print('TODO: implementar onClose');
    super.onClose();
  }

  void alterarDados(String nomeNovo) {
    _nome(nomeNovo);
  }
}
```

Para utilizar essa classe controladora em uma rota, você precisa passá-la como um binding usando `BindingsBuilder.put()` juntamente com a página que usará os dados dessa controller:

```dart
GetPage(
  name: '/getxController',
  binding: BindingsBuilder.put(() => Controller()),
  page: () => const GetxControllerPage(),
),
```

Os valores da classe controladora podem ser acessados usando `Get.find<Controller>()`. Por exemplo, para exibir o nome em um widget:

```dart
Text(Get.find<Controller>().nome),
```

E para alterar os dados:

```dart
ElevatedButton(
  onPressed: () {
    Get.find<Controller>().alterarDados('Novo nome');
  },
  child: Text('Alterar nome'),
),
```

Dessa forma, os dados da classe controladora estão disponíveis para consulta e alteração, pois a controller foi passada como binding juntamente com a rota de navegação.
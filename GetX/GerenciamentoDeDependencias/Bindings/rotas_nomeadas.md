# Bindings

- Classe a ser instanciada:
```dart
class BindingsController {
  String nome;
  BindingsController({
    required this.nome,
  });
}
```

- Instanciando diretamente na rota na tag `getPages` dentro do `GetMaterialApp()` com `BindingsBuilder()`, normalmente usado quando se tem apenas uma instância a ser disponibilizada para a página:
```dart
getPages: [
  GetPage(
    name: '/rota',
    binding: BindingsBuilder(() {
      Get.put(BindingsController(nome: 'Inicializado diretamente na rota'));
    }),
    page: () => PageName(),
  ),
],
```

- Também é possível chamar a instância na rota já executando o `put` no builder com `BindingsBuilder.put()`:
```dart
getPages: [
  GetPage(
    name: '/rota',
    binding: BindingsBuilder.put(
      () => BindingsController(nome: 'Inicializado diretamente na rota'),
    ),
    page: () => PageName(),
  ),
],
```

- Para usar mais de um tipo de instância no binding, é correto criar uma nova classe que estenda o `Bindings` do GetX:
```dart
class BindingsExample extends Bindings {
  @override
  void dependencies() {
    Get.put(BindingsController(nome: 'Inicializado dentro do Binding'));
  }
}
```

- Neste modelo, a invocação na rota é a seguinte:
```dart
getPages: [
  GetPage(
    name: '/rota',
    binding: BindingsExample(),
    page: () => PageName(),
  ),
],
```

- A navegação é comum, pode ser feita com `Navigator.of(context).pushNamed('/rota')` ou com `Get.toNamed('/rota')`.

- A página para a qual está navegando deve conter o `Get.find()` da instância que está sendo passada para ter acesso ao seu conteúdo:
```dart
Text(Get.find<BindingsController>().nome),
```


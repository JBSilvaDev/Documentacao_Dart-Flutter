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

- A navegação é comum, porém deve ser feita somente com o ***Get***.
> Método 1 com `BindingsBuilder.put()`:
```dart
ElevatedButton(
  onPressed: () => Get.to(
    const HomeBindings(),
    binding: BindingsBuilder.put(
      () => BindingsController(
        nome: 'Inicializando sem rota nomeada',
      ),
    ),
  ),
  child: const Text('Binding Sem rota nomeada'),
),
```

> Método 2 com `BindingsBuilder()` puro:
```dart
ElevatedButton(
  onPressed: () => Get.to(
    const HomeBindings(),
    binding: BindingsBuilder(() {
      Get.put(BindingsController(
        nome: 'Inicializado diretamente na rota 2',
      ));
    }),
  ),
  child: const Text('Binding Sem rota nomeada'),
),
```

- A página para a qual está navegando deve conter o `Get.find()` da instância que está sendo passada para ter acesso ao seu conteúdo:
```dart
Text(Get.find<BindingsController>().nome),
```

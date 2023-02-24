# Bindings
- Classe a ser instanciada
```dart
class BindingsController {
  String nome;
  BindingsController({
    required this.nome,
  });
}
```
- Instanciando diretamente na rota na tag ***getPages*** dentro do ```GetMaterialApp()``` com ```BindingsBuilder()```, normalmente usado quando se tem apenas 1 instancia a ser disponibilizada para a pagina
```dart
  getPages: [
    GetPage(
      name: '/rota',
      binding: BindingsBuilder(() {
        Get.put(BindingsController(nome: 'Inicializado diretamente na rota'));
        }),
      page: () =>  PageName(),
    ),
  ],
```
- Tambem é possivel chamar a instancia na rota ja executando o put no builder com BindingsBuilder.put()
```dart
  getPages: [
    GetPage(
      name: '/rota',
      binding: BindingsBuilder.put(() => BindingsController(nome: 'Inicializado diretamente na rota')),
        ),
      page: () =>  PageName(),
    ),
  ],
```
- Para usar mais de um tipo de instancia no bind é correto criar uma nova classe que extenda o Bindings do Getx
```dart
class BindingsExample extends Bindings {
  @override
  void dependencies() {
    Get.put(BindingsController(nome: 'Inicializado dentro do Binding'));
  }
}
```
- Neste modelo a invocação na rota é a seguinte:
```dart
  getPages: [
    GetPage(
      name: '/rota',
      binding: BindingsExample(),
      page: () =>  PageName(),
    ),
  ],
```
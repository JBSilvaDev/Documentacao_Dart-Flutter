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
- 
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
- A navegação é comum, porem deve ser feita somente com ***Getx***
> Metodo 1 com ```BindingsBuilder.put()```
```dart
ElevatedButton(
  onPressed: () => Get.to(const HomeBindings(),
      binding: BindingsBuilder.put(
        () => BindingsController(
            nome: 'Inicializando sem rota nomeada'),
      )),
  child: const Text('Binding Sem rota nomeada'),
),
```
> Metodo 2 com ```BindingsBuilder()``` puro
```dart
ElevatedButton(
  onPressed: () =>
      Get.to(const HomeBindings(), binding: BindingsBuilder(() {
        Get.put(BindingsController(nome: 'Inicializado diretamente na rota 2'));
      })),
  child: const Text('Binding Sem rota nomeada'),
),
```
- A pagina a qual esta navegando deve conter o ```Get.find()``` da instancia a qual esta passando para ter acesso a seu conteudo
```dart
Text(Get.find<BindingsController>().nome),
```
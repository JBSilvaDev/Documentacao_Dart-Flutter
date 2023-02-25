# GetX Controller
- GetX controller é uma classe do GetX que é extendida por uma classe controladora onde possui 3 atributos
> onInit(){}
- Executado sempre que a pagina é iniciada
> onReady(){}
- Executado sempre que a pagina é carregada
> onClose(){}
- Executado sempre que a pagina é fechada
***
- Classe controlladora usada
```dart
class Controller extends GetxController {

  final _nome = 'JB silva'.obs;

  String get nome => _nome.value;

  @override
  void onInit() {
    print('TODO: implement onInit');
    super.onInit();
  }

  @override
  void onReady() {
    print('TODO: implement onReady');
    super.onReady();
  }

  @override
  void onClose() {
    print('TODO: implement onClose');
    super.onClose();
  }

  void alterarDados(String nomeNovo) {
    _nome(nomeNovo);
  }
}
```
- Na rota deve-se passar o binding indicando a classe controlladora, usando o ```BindingsBuilder.put()``` e a pagina a qual ira usar os dados desta cotroller.
```dart
GetPage(
    name: '/getxController',
    binding: BindingsBuilder.put(() => Controller()),
    page: () => const GetxControllerPage()
  ),
```
- O uso dos valores na classe controladores é o uso padrao ja mostrado
> Exibição
```dart
Text(Get.find<Controller>().nome);
```
> Alteração
```dart
ElevatedButton(
  onPressed: () {
    Get.find<Controller>().alterarDados('Novo nome');
  },
  child: Text('Alterar nome'),
  )
```
> Os dados estao disponiveis para consulta e alteração pois a controller foi passada no binding junto com a rota de navegação.

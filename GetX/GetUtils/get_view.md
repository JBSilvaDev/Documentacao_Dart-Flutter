# Getx GetView
- Usado em conjunto com [GetController](../GerenciamentoDeEstado/getx_controller.md), o ```GetView``` assume papel de controlador da pagina substituindo o widget que a pagina é extendida (stateless ou statefull).
> Metodo de uso:
- Classe controladora
```dart
class GetViewController extends GetxController {
  var _nome = 'JB'.obs;

  String get nome => _nome.value;

  void alterarNome(String novoNome) {
    _nome.value = 'JB Silva';
  }

  @override
  void onReady() {
    print('on Read Chamado');
  }
}
```
- Uso na pagina que sera controloda
  - Principal diferença do GetView e da variavel controller com Get.find é que caso o binding seja lazy a controller so sera chamada com o uso e nao na abertura da pagina
```dart
class GetViewPage extends GetView<GetViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get View Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() { 
                    return Text(controller.nome);
                }
              ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                controller.alterarNome('JB Silva');
              },
              child: const Text('Alterar nome'),
            )
          ],
        ),
      ),
    );
  }
}
```

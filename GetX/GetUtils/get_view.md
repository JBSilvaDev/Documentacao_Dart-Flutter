# GetX GetView
- Usado em conjunto com [GetController](../GerenciamentoDeEstado/getx_controller.md), o ```GetView``` assume o papel de controlador da página, substituindo o widget do qual a página é estendida (Stateless ou Stateful).
> Método de uso:
- Classe controladora:
```dart
class GetViewController extends GetxController {
  var _nome = 'JB'.obs;

  String get nome => _nome.value;

  void alterarNome(String novoNome) {
    _nome.value = novoNome;
  }

  @override
  void onReady() {
    print('onReady chamado');
  }
}
```
- Uso na página que será controlada:
  - A principal diferença entre o uso de ```GetView``` e a obtenção do controlador com ```Get.find``` é que, caso o binding seja preguiçoso (lazy), o controlador só será chamado quando utilizado, e não na abertura da página.
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
            }),
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
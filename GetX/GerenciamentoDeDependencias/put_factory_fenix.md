# Get LazyPut, Factory, fenix
## lazyPut
- Inicialização tardia de uma instancia, a mesma é declarada no construtos da pagina a qual deseja instanciar, porem ao contrario do put que cria a instancia assim que a pagina é montada, no layPut so é criada quando invocada.
> Classe usada
```dart
class LazyPutController {
  String nome = 'JB Silva';
  LazyPutController(){
     print('LazyPutController foi inicializado');
  }
}
```
> Declaração no contrutor da pagina
```dart
class LazyPutPage extends StatefulWidget {
  LazyPutPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => LazyPutController());
  }
```
- Deste modo o Get guarda a instancia para cria-la quando necessario, chama-se usando o ```Get.find()```
> Criando a instancia chamando-a com ```Get.find()```
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Nome: $nome'),
    ElevatedButton(
      onPressed: () {
        final controller = Get.find<LazyPutController>();
        setState(() {
          nome = controller.nome;
        });
      },
      child: const Text('Buscar nome'),
    ),
    ])
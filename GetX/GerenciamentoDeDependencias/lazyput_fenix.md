# Get LazyPut, Fenix
## lazyPut
- Inicialização tardia de uma instancia, a mesma é declarada no construtos da pagina a qual deseja instanciar, porem ao contrario do put que cria a instancia assim que a pagina é montada, no layPut so é criada quando invocada.
- Esta instancia não é mantida, ao sair da pagina a mesma é finalizada
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
  }
```
- Deste modo o Get guarda a instancia para cria-la quando necessario, chama-se usando o ```Get.find()```
> Criando a instancia chamando-a com ```Get.find()```
```dart
class _LazyPutPageState extends State<LazyPutPage> {
  String nome = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Put page'),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
```
## fenix
- Inicialização tardia de uma instancia, a mesma é declarada no construtos da pagina a qual deseja instanciar, porem ao contrario do put que cria a instancia assim que a pagina é montada, no layPut so é criada quando invocada.
- Esta instancia é mantida, ao sair da pagina a mesma não é finalizada em paginas seguintes a que foi iniciada
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
class LazyPutFenixController {
  String nomeFenix = 'JB Silva';
  LazyPutFenixController(){
     print('LazyPutFenixController foi inicializado');
  }
}
```
- Deste modo o Get guarda a instancia para cria-la quando necessario, chama-se usando o ```Get.find()```
> Criando a instancia chamando-a com ```Get.find()```
```dart
class _LazyPutPageState extends State<LazyPutPage> {
  String nomeFenix = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Put page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nome: $nomeFenix'),
          ElevatedButton(
            onPressed: () {
              final controller = Get.find<LazyPutFenixController>();
              setState(() {
                nomeFenix = controller.nomeFenix;
              });
            },
            child: const Text('Buscar nomeFenix'),
          ),
        ],
      ),
    );
  }
}
```
# Get LazyPut e Fenix

## LazyPut
- O `LazyPut` permite a inicialização tardia de uma instância. Ela é declarada no construtor da página em que se deseja instanciá-la. Ao contrário do `put`, que cria a instância assim que a página é montada, o `lazyPut` só cria a instância quando é invocada.
- Essa instância não é mantida, ou seja, ao sair da página, ela é finalizada.
> Classe usada:
```dart
class LazyPutController {
  String nome = 'JB Silva';
  LazyPutController() {
    print('LazyPutController foi inicializado');
  }
}
```
> Declaração no construtor da página:
```dart
class LazyPutPage extends StatefulWidget {
  LazyPutPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => LazyPutController());
  }
}
```
Dessa forma, o GetX guarda a instância para criá-la quando necessário, e ela é chamada usando o `Get.find()`.

> Criando a instância e chamando-a com `Get.find()`:
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

## Fenix
- O `Fenix` também permite a inicialização tardia de uma instância. A diferença é que essa instância é mantida, ou seja, ao sair da página, ela não é finalizada e pode ser usada em páginas subsequentes àquela em que foi iniciada.
> Classe usada:
```dart
class LazyPutFenixController {
  String nomeFenix = 'JB Silva';
  LazyPutFenixController() {
    print('LazyPutFenixController foi inicializado');
  }
}
```
> Declaração no construtor da página:
```dart
class LazyPutFenixPage extends StatefulWidget {
  LazyPutFenixPage({Key? key}) : super(key: key) {
    Get.putAsync(() => LazyPutFenixController());
  }
}
```
Dessa forma, o GetX guarda a instância para criá-la quando necessário, e ela é chamada usando o `Get.find()`.

> Criando a instância e chamando-a com `Get.find()`:
```dart
class _LazyPutFenixPageState extends State<LazyPutFenixPage> {
  String nomeFenix = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy Put Fenix page'),
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
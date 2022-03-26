# Async
- Async Sao processoas ascincronos, ou seja, pode execultar em paraleto ao arquivo principal
- Quando chamamos uma funcao Future dentro do main, o main nao aguarda aquela funcao terminar para seguir o fluxo, sao execultados quase ao mesmo tempo.
>Exemplo 1 - funcao com future:
- Aguarda a funcao para finalizar programa, porem o main nao é interrompido
```dart
void main() {
  print("Iniciou o main");
  p2(); // starta funcao p2
  print("fim do main, aguardando p2");
}
p2() {
  print("Iniciou p2");
  Future.delayed(Duration(seconds: 4), () {
    print("Fim do p2");
  });
}
```
>Exemplo 2 - funcao que retorna algo:
- Aguarda a funcao finalizar obtendo o retorno da mesma dentro do main
```dart
void main() {
  print("Iniciou o main");
  p2().then((msgs) => print('msg: $msgs'));
  print("fim do main, aguardando p2");
}

Future<String>p2() {
  print("Iniciou p2");
 return Future.delayed(Duration(seconds: 2), () => "Fim do p2");
}
```
>Exemplo 3 - tratar, capturar um erro
- Retorna a msg na funcao, caso haja erro o exiba
- É possivel obter o mesmo resultado usando o onError (dentro do then)
  - p2().then((msgs) => print('msg'), onError: (error){print('Erro aqui')}
```dart
void main() {
  print("Iniciou o main");
  p2().then((msgs) => print('msg'))
    .catchError((erro) => print('Achei um erro!')); // starta funcao p2
  print("fim do main, aguardando p2");
}
Future<String>p2() {
  print("Iniciou p2");
 return Future.delayed(Duration(seconds: 2), () {
    throw Exception();
  });
}
```
>Exemplo 4 - Await - processo volta a ser sincrono
- Faz sistema aguardar o retorno ou conclusao da funcao para continuar o main
- Necessario inserir async no main e tranformar o void em um Future<void>
```dart
void main() async {
  print("Iniciou o main");
 var p2msg = await p2();
  print(p2msg);
  print("fim do main, aguardando p2");
  
}

Future<String>p2() {
  print("Iniciou p2");
 return Future.delayed(Duration(seconds: 2), () => 'Acabou p2');
}
```
>Aguardar algum tempo
```dart
Future.delayed(Duration(seconds: 4));
```
>Aguarda um tempo e execulta algum comando
```dart
Future.delayed(Duration(seconds: 4), () {
    print("Execultando");
});
```
>Funcao futura, execulta em paralelo com main()
```dart
// Funcao com retorno, descenessario async pois seu retorno ja é um futuro
Future<String> nomeFuncao() {
  print('Dentro da funcao');
  // Aguarda 2 segundos e retorna algo
  return Future.delayed(Duration(seconds: 2), () => print('Algo'));
}
```
```dart
// Funcao sem retorno (void), necessario async pois nao esta retornando um futuro
Future<void> nomeFuncao() async {
  print('Dentro da Funcao');
  Future.delayed(Duration(seconds: 2), () => print('Algo'));
}
```
>forEach - percorrer listas futuras



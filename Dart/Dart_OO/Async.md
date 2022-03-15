# Async
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


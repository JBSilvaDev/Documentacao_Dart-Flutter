# Streams
- Streams tem as mesmas caracteristica do Future em [async](./Async.md)
- Diferente de Future, Streams pode receber varios valores em seu retorno, pois é uma combinação de Futures
- Ao abrir uma stream ela se manterar aberta ate o usuario ou uma determinação do sistema a fechar
    - Enquanto esta conexao se manter aberta pode-se enviar e receber informações por ela e para ela.
## Stream periodic
- Stream periodic recebe um intervalo que quando concluido execulta o segundo parametro que é uma funcao
- Exemplo usado é que a cada 2 segundo, a stream chama a funcao callback
>Funcao (poderia ser uma funcao anonima dentro da propria stream (){})
```dart
int callback(int value) {
  return (value + 1);
}
```
>Intervalo
```dart
final interval = Duration(seconds: 2);
```
>Utilização 
- await for fica "escutando" a stream, e sempre que um valor novo é atribuida a ela printa o valor
- a cada 2 segundos um novo valor é atribuido a i, e este valor é exibido no print.
- em resumo é um loop infinito, porem nao consome processamento da maquina, pois o await se mantem parado aguardando um retorno da stream, nao fica rodando ifinitamente, so ira ser interrompido pelo usuario ou por uma condição imposta
```dart
final stream = Stream<int>.periodic(interval, callback);
await for (var i in stream) {
    print('Valor de i é: $i');
}
```
<i>[Resultado periodic](../Img/periodic.png)</i>

## Stream take
>Take 
- É um comando onde podemos transformar a stream
- É passado um valor inteiro que determina quantas requisições a stream ira receber
- Quando chegar a quantidade de requisições determinada a "porta" da stream é fechada.
>Seguindo dados do Stream periodic
```dart
final stream = Stream<int>.periodic(interval, callback);
// Apos 5 requisições ou seja, apos callback ser chamado 5 vezes ira encerrar a stream
stream = stream.take(5);
// await for
await for (var i in stream) {
  print('${i - 1} + 1 = $i');
}
```
<i>[Resultado take](../Img/take.png)</i>

>Take While 
- Tem o mesmo principio do take, porem nao recebe um numero inteiro e sim uma funcao onde seu retorno é uma condição
- Exemplo abaixo, ira continuar a stream enquanto o numero for menor que 6
```dart
var stream = Stream<int>.periodic(interval, callback);
// Apos 5 requisições ou seja, apos callback ser chamado 6 vezes ira encerrar a stream, pois a proxima seria igual/maior que 7
stream = stream.takeWhile((int numero) => numero < 7);
// await for
await for (var i in stream) {
  print('${i - 1} + 1 = $i');
}
```
<i>[Resultado take while](../Img/take_while.png)</i>

## Stream Skip
>Skip
- Informa ao programa o que ira "pular", nesse caso ele pula as duas primeiras chamadas do callback
```dart
var stream = Stream<int>.periodic(interval, callback);
stream = stream.take(5).skip(2); 
await for (var i in stream) {
  print('${i - 1} + 1 = $i');
}
  ```
- Usado o take para nao manter a chamada aberta, é possivel usar o skip puro
  - ```dart
    stream = stream.skip(2); 
    ```
<i>[Resultado skip](../Img/skip.png)</i>

>Skip while
- Pula toda chamada enquanto a condição for atendida pelo retorno ou seja, quanto o retorno for false, no caso toda requisicao onde o numero é menor que 5.
```dart
var stream = Stream<int>.periodic(interval, callback);
stream = stream.take(5).skipWhile((numero) {
  print('Pulei numero $numero');
  return numero < 5;
});
await for (var i in stream) {
  print('${i - 1} + 1 = $i');
}
```
- Usado o take para nao manter a chamada aberta, é possivel usar o skip puro
  - ```dart
    stream = stream.skipWhile((numero) {
      print('Pulei numero $numero');
      return numero < 5;
    });
    ```
<i>[Resultado skip while](../Img/skip_while.png)</i>

## Stream toList()
>toList()
- Usado normalmente junto com uma condição de parada (take, takewhile, if, etc...)
- Não exibe o resultado final ate concluir a stream (fechar a porta)
- Salva todas as chamadas feitas e as grava em uma lista
```dart
var stream = Stream<int>.periodic(interval, callback);
stream = stream.take(5);
// Salva os valores dentro de uma lista
final data = await stream.toList();

print(data);
```
<i>[Resultado toList()](../Img/stream_toList.png)</i>

## Stream Listen
>listen
- O Main continua sua execução porem a porta da stream se mantem aberta
- A stream fica "escutando" o que lhe foi passado, e é executada mesmo apos o fim do main
- Usado take no exemplo apenas para nao manter um loop continuo

```dart
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.take(5);
  // Continua a escutar mesmo apos o fim do main
  stream.listen((numero) => print('Escutei o numero $numero'));

  print('Fim do main!');
```
<i>[Resultado listen](../Img/listen.png)</i>




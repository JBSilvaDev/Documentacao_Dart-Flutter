# Streams
- Streams tem as mesmas caracteristica do Future em [async](./Async.md)
- Diferente de Future, Streams pode receber varios valores em seu retorno, pois é uma combinação de Futures
- Ao abrir uma stream ela se manterar aberta ate o usuario ou uma determinação do sistema a fechar
    - Enquanto esta conexao se manter aberta pode-se enviar e receber informações por ela e para ela.
## Stream periodic
- Stream periodic recebe um intervalo que quando concluido execulta o segundo parametro que é uma funcao
- Exemplo usado é que a cada 2 segundo, a stream chama a funcao callback
>Intervalo
```dart
final interval = Duration(seconds: 2);
```
>Funcao (poderia ser uma funcao anonima dentro da propria stream (){})
```dart
int callback(int value) {
  return (value + 1);
}
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


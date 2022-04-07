# Event Loop
- Event loop é um padrao de projeto
- Responsavel por determinar a ordem  de execulção do projeto (filas)
- Existem basicamente dois tipos de itens na fila de eventos, sao eles EVENTS e MICROTASK
- Filas de evento:
    - Sao Sempre em FIFO, assincrono, e baixa prioridade, execulta processos mais pesados
- Filas de microtasks:
    - Sao sempre em FIFO, sincrono, alta prioridade, processos rapidos na execucao.
- MicroTasks sao executadas antes dos events
```dart
void main() {
  print('Inicio Main'); // 1

  scheduleMicrotask(() => print('Microtask #1')); // 3

  Future.delayed(Duration(seconds: 2), ()=> print('Future #1 delayed')); // 7
  Future(() => print('Future #2')); // 5
  Future(() => print('Future #3')); // 6

  scheduleMicrotask(() => print('Microtask #2')); //4

  print('Fim Main'); // 2
}
```
Sequencia de execucao:
- 1º Main()
    - print
- 2º Microtasks
    - scheduleMicrotask((){})
- 3º Events
    - Future.delayed((Duration())(){})
- 4º Microtasks
    - scheduleMicrotask((){})
- 5º Events
    - Future((){})

A sequencia de execucao é determinada pelo tipo de item na fila e nao pela ordenacao do codigo
>Event loop com await
```dart
Future<void> main() async{
  print('Inicio Main'); // 1

  scheduleMicrotask(() => print('Microtask #1')); // 3

  await Future.delayed(Duration(seconds: 2), ()=> print('Future #1 delayed')); // 7
  await Future(() => print('Future #2')); // 5
  await Future(() => print('Future #3')); // 6

  scheduleMicrotask(() => print('Microtask #2')); //4

  print('Fim Main'); // 2
}
```
Sequencia de execucao:
- 1º Main()
    - print
- 2º Microtasks
    - scheduleMicrotask((){})
- 3º Events
    - Future.delayed((Duration())(){})
    - scheduleMicrotask((){})
    - Future((){})
- 4º Microtasks
    - scheduleMicrotask((){})

Com Await a sequencia fica mais sincrona, ou seja, o programa ira aguardar a linha de codigo responder, caso essa linha tenha um delay o programa aproveita essa brecha e executa outra linha enquanto a anterior nao esta pronta.
No caso acima (sequencia 3), é executado o Future.delayed, como ele tem um delay de 1 segundo, o programa aproveita esse tempo e executa a proxima linha, como temos uma microtask na fila e elas sao prioritarias, essa microtask é executada.
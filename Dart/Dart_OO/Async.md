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
 - Exemplo de uso:
    - Buscar em um BD uma lista que precisa ser percorrida.

Exemplo 1 : 
```dart
// Lista a ser percorrida
var nomes = ['JB', 'Graci', 'Dylan', 'Dora'];
```
```dart
// Percorre a lista e exibe o nome com saudação
await Future.forEach<String>(nomes, (nome) async {
    print(await saudacao(nome));
  });
// Saudação para cada nome invocado, intervalo de 1 segundo
Future<String> saudacao(String nome) {
  return Future.delayed(Duration(seconds: 1), () => 'Óla $nome');
}
```
```dart
// Percorre a lista e exibe o nome com saudação
for(var nome in nomes){
  print(await saudacao(nome))
}
// Saudação para cada nome invocado, intervalo de 1 segundo
Future<String> saudacao(String nome) {
  return Future.delayed(Duration(seconds: 1), () => 'Óla $nome');
}
```
Exemplo 2: 
```dart
// Retorna todo o conteudo da lista com map e exibe uma lista com conteudo final
// Variavel nomeFuturo recebe todo o conteudo de nomes assim => ('JB', 'Graci', 'Dylan', 'Dora')
// Chama a funcao saudacao e adiciona o Ola $nome para cada item ficando assim ('Óla JB', 'Óla Graci', 'Óla Dylan', 'Óla Dora')
// O converte para lista ficando assim ['Óla JB', 'Óla Graci', 'Óla Dylan', 'Óla Dora']
var nomesFuturo = nomes.map((nome) => saudacao(nome)).toList();
// Variavel saudacoes aguarda o tempo necessario para o nomesFuturo concluir a opecao e salva o valor final ou seja ['Óla JB', 'Óla Graci', 'Óla Dylan', 'Óla Dora']
var saudacoes = await Future.wait(nomesFuturo);
// Exibe valor final
print(saudacoes);
```


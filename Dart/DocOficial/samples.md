# Language samples
> Esta coleção é apenas uma breve introdução à linguagem para pessoas que gostam de aprender pelo exemplo. Você também pode querer conferir os passos de idioma e biblioteca, ou o codelab de planilha de fraude Dart.

```Tour de idiomas
Um passeio abrangente, com exemplos, da linguagem Dart. A maioria dos links lidos nesta página apontam para o tour de idiomas.
```
```
Visita à biblioteca
Uma introdução baseada em exemplos às bibliotecas principais do Dart. Veja como usar os tipos integrados, coleções, datas e horários, Nuxos e muito mais.
```
## Hello World
- Todo aplicativo tem uma funcão main(). Para exibir textos no console voçê pode usar a funcão print():
```dart
void main() { 
    print('Olá Mundo!');
}
```
## Control flow statements
- Mesmo no código Dart, a maioria das variáveis não precisa de tipos explícitos como String, int, double etc... graças à inferência de tipos:
```dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

[Leia mais](language-tour.md#variables) sobre variaveis em Dart, incluindo palavras chaves como **final**, **const** e tipos **static**

## Control flow statements
- O Dart suporta as instruções de fluxo de controle usuais:
```dart
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}

for (final object in flybyObjects) {
  print(object);
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
```
[Leia mais](language-tour.md#control-flow-statements) sobre as instruções de fluxo de controle no Dart, incluindo **break** and **continue**, **switch** and **case**, e **assert**.

## Functions
- [Recomendo](effective-dart.md#design#types) especificar os tipos de parametros de cada função e o valor de retorno:
```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);
```
Uma sintaxe abreviada => (seta) é útil para funções que contêm uma única instrução. Esta sintaxe é especialmente útil ao passar funções anônimas como parametros:
```dart
flybyObjects.where((name) => name.contains('turn')).forEach(print);
```
Além de mostrar uma função anônima (o parametro para **where()**), este código mostra que você pode usar uma função como um parametro: a função **print()** de  é um parametro para **forEach()**.

[Leia mais](./language/language-tour.md#functions) sobre funções no Dart, incluindo parâmetros opcionais, valores de parâmetros padrão e escopo lexical.

## Comments
- Os comentarios em Dart geralmente começam com //
```dart
// This is a normal, one-line comment.

/// This is a documentation comment, used to document libraries,
/// classes, and their members. Tools like IDEs and dartdoc treat
/// doc comments specially.

/* Comments like these are also supported. */
```
[Leia mais](./language/language-tour#comments) sobre comentários no Dart, incluindo como as ferramentas de documentação funcionam.

## Imports
- Para acessar dados de bibliotecas externas, use a importação.
```dart
// Importando bibliotecas principais
import 'dart:math';

// Importando bibliotecas de pacotes externos
import 'package:test/test.dart';

// Importando arquivos
import 'path/to/my_other_file.dart';
```
[Leia mais](./language/language-tour#libraries-and-visibility) sobre bibliotecas e visibilidade no Dart, incluindo prefixos de biblioteca, **show** e **hide**, e carregamento **lazy** através da palavra-chave **deferred**.

## Classes
- Aqui está um exemplo de uma classe com três propriedades, dois construtores e um método. Uma das propriedades não pode ser definida diretamente, por isso é definida usando um método getter (em vez de uma variável).
```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
```
Voçê pode usar a classe **Spacecraft** assim:
```dart
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();
```
[Leia mais](./language/language-tour#classes) sobre classes no Dart, incluindo listas de inicializadores, **new** e **const** opcionais, redirecionando construtores, **construtores factory**, **getters**, **setters** e muito mais.

## Enums
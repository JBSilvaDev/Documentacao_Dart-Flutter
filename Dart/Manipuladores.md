# Manipuladores
## String

- Exibe o conteudo da String a partir do do index, no exemplo (3)
```dart
var nome = 'String';
var nomeManipulado = nome.substring(3);
print(nomeManipulado);
// Resultado -> ing
```

- Exibe o conteudo da String de acordo com os indexs passado, no exemplo (0, 4)
```dart
var nomeManipulado = nome.substring(0,4);
print(nomeManipulado);
// Resultado -> Stri
```

- Verificando se a string inicia com o valor passado, no exemplo ('S')
```dart
var nomeManipulado = nome.startsWith('S');
print(nomeManipulado);
// Resultado -> true
```

- Tranforma toda String em CAIXA ALTA
```dart
var nomeManipulado = nome.toUpperCase();
print(nomeManipulado);
// Resultado -> STRING
```

- Tranforma toda String em caixa baixa
```dart
var nomeManipulado = nome.toLowerCase();
print(nomeManipulado);
// Resultado -> string
```

- Verifica se contem na string o valor informado, no exemplo ('t')
```dart
var nomeManipulado = nome.contains('t');
print(nomeManipulado);
// Resultado -> true
```

- Retorna uma lista com items da string separados pelo caractere passado, no exemplo ('|')
```dart
var profissao = 'JB Silva|Analista de logista|Estudante Flutter';
var dados = profissao.split('|');
print(dados);
// Resultado -> [JB Silva, Analista de logista, Estudante Flutter]
```

- Caso o lenght(tamanho) da string seja menor do que o valor passado, a completa com o valor passado, no exemplo (tamanho 15, valor '!')
```dart
var nome = "JB Silva".padRight(15, '!');
print(nome);
// Resultado -> JB Silva!!!!!!!
```
## Numeros

- Retorna true ou false verificando se o numero é negativo
```dart
var valor = 20.4;
print(valor.isNegative);
// Resultado -> false
```

- Arredonda o numero para o valor mais proximo
```dart
var n = valor.round();
var n = valorDouble.roundToDouble();
print(n);
// Resultado -> 20
```

- Converte numero String '10' em numero inteiro/decimal
```dart
var inteiro = '10';
var i = int.parse(inteiro);
var decimal = '10.45';
var d = double.parse(decimal);
print('$i é ${i.runtimeType} e $i é ${d.runtimeType}');
// Resultado -> 10 é int e 10 é double
```

- Tenta converter numero String '10' em numero inteiro/decimal, caso falha retorna null
```dart 
var i = int.tryParse('10s'); // retorna null
var d = double.tryParse('10.45x'); // retorna null
print('$i é ${i.runtimeType} e $i é ${d.runtimeType}');
// Resultado -> null é Null e null é Null (pois contem letras que nao podem ser convertidas em numeros)
```

- Define quantidade de casas decimais pelo valor passado
```dart
var valor = 10.985985;
var n = valor.toStringAsFixed(2);
print(n);
// Resultado -> 10.99
```
## Funcoes
>then<br>
- Obtem o que é retornado numa funcao
- Usado com funcoes tipo Future (async)
```dart
void main() {
  var mensage = processo1().then((mensage) {
    print(mensage);
  });
}

Future<String> processo1() {
  return Future.delayed(Duration(seconds: 2), () => 'Retorna isto apos 2 segundos');
}
```

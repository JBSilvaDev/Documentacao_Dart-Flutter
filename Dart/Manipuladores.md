# Manipuladores
## String

```dart
// Exibe o conteudo da String a partir do item indicado, no caso 3
nome.substring(3);

// Exibe o conteudo da String a partir do primeiro item ate o segundo item indicado, no caso de String item na posicao 0 (S) ate o item na posicao 4 (i) Resultado "Stri"
nome.substring(0,4);

// Retorna true ou false, verificando se a primeira letra da String é a indicada
nome.startsWith('S');

// Tranforma toda String em CAIXA ALTA
nome.toUpperCase();

// Tranforma toda String em caixa baixa
nome.toLowerCase();

// Retorna true ou false verificando se há dentro da String o informado
nome.contains('s');

// Faz quebra da String com base num caractere informado, retorna uma lista
var profissao = 'JB Silva|Analista de logista|Estudante Flutter';
var dados = profissao.split('|');

// Caso a String seja menor do que o informado, ira completar com o caracter passado
var nome = "JB Silva".padRight(15, '!');
```
## Numeros

```dart
// Retorna true ou false verificando se o numero é negativo
valor.isNegative;

// Arredonda o numero para o valor mais proximo
valorInt.round();
valorDouble.roundToDouble();

// Converte numero String '10' em numero inteiro/decimal
int.parse('10');
double.parse('10.45');

// Tenta converter numero String '10' em numero inteiro/decimal, caso falha retorna null
int.tryParse('10s'); // retorna null
double.tryParse('10.45x'); // retorna null

// Define quantidade de casas decimais pelo valor passado
var valor = 10.985985;
valor..toStringAsFixed(2);
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
  print('inicio p1');
  return Future.delayed(Duration(seconds: 2), () => 'Fim do p1');
}
```

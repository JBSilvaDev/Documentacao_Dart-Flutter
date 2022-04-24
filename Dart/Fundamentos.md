# Fundamentos
## Variaveis
>String - Recebe valores de textos<br>
Manipuladores - [Clique aqui.](./Manipuladores.md#string)
```dart
String texto = 'texto';
```
>num - Recebe qualquer valor numerico<br>
Manipuladores - [Clique aqui.](./Manipuladores.md#numeros)
```dart
num numero = 1234;
```
>int - Recebe valores numericos inteiros positivos e negativos
```dart
int inteiro = 10;
```
>double - Recebe valores numericos decimais positivos e negativos
```dart
double decimal = 10.5;
```
>bool - Recebe valores verdadeiros e falsos (true/false)
```dart
bool vOUf = true;
```
>var - Recebe qualquer tipo de valor
```dart
var qualquerTipo = '';
```
>List - Recebe valores tipo lista []
```dart
List lista  = ['A', 'B'];
// É uma boa pratica tipar o tipo que for usar
List <String> lista  = ['A', 'B'];
var lista  = <String> ['A', 'B'];
```
>Object - Recebe qualquer tipo de valor
```dart
Object objeto = 'Qualquer valor';
```
>dynamic - Recebe qualquer tipo de valor
```dart
dynamic dinamico = 'Qualquer valor';
```

### Null Safety
>Declarar variaveis sem atribuir valores
- Usar "?" apos a declaração de tipo
```dart
String? variavel;
```
>Verificar se o valor é nulo
```dart
if(variavel != null){
  print("Não é nulo");
  }
  else{
    print("É nulo");
  }
// Ou
  if (variavel == null){
    print("É nulo");
  }else{
    print("Não é nulo");
  }
// Ou
print(variavel = null? 'É nulo' : 'Não é nulo')
// OU
print(variavel != null? 'Não é nulo' : 'É nulo')
// Ou
print(variavel ?? "É nulo") // Neste caso, exiba o valor da variavel, se for nulo exibra "é nulo"
```
### Constantes e Finais
>const
- São imutaveis, ou seja o valor é definido na criação da variavel e nao pode ser alterado, mesmo se for criaca como nula nao aceitara novo valor.
```dart
const String variavel = "valor";
```
>final
- São imutaveis, porem caso seja criado como nula, é possivel atribuir uma unica vez um valor a mesma, se for criada ja com valor nao podera ser mais alterada
```dart
final String variavel;
variavel = "valor";
```
## Operadores Condicionais
>if Padrão
```dart
final idade = 18;
if(idade >= 18){
    print('É de maior');
}else{
    print('É de menor');
}
```
>if Ternário
```dart
final idade = 18;
final maiorIdade = idade >= 18 ? 'Sim é maior': 'Não é maior';
print(maiorIdade);
```
>switch
```dart
final idade = 18;
switch(idade){
    case 17:
        print('Não é maior');
        break;
    case 18:
        print('Maior de idade');
        break;
    default:
        print('Idade diferente de 17 e 18');
}
```
## Console
>print - Escreve textos, numero, variaveis, tipos, etc.. no console
```dart
print('Hello World");
```
>stdout.write - Posibilita escrever algo no console
```dart
stdout.write("Escreva algo ");
```
>stdin.readLineSync() - Obtem o que foi escrito no console
```dart
print(stdin.readLineSync());
```




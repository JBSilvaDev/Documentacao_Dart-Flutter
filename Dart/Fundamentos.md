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
>Object - Recebe qualquer tipo de valor
```dart
Object objeto = 'Qualquer valor';
```
>dynamic - Recebe qualquer tipo de valor
```dart
dynamic dinamico = 'Qualquer valor';
```
>List - Recebe valores tipo lista []
```dart
var lista  = ['A', 'B'];
List lista  = ['A', 'B'];
```
- Tipando tipo de conteudo da lista
  - < Object > - Pode ter qualque valor no seu conteudo
  - < dynamic > - Pode ter qualque valor no seu conteudo
  - < String > - Recebe apenas textos
  - < int > - Recebe apenas inteiros
  - < double > - Recebe apenas decimal
```dart
var lista  = <String> ['A', 'B'];
List <String> lista  = ['A', 'B'];
```
## Constantes e Finais
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
## Null Safety
>Declarar variaveis sem atribuir valores
- Usar "?" apos a declaração de tipo para indicar que a variavel pode ser nula
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
print(variavel == null? 'É nulo' : 'Não é nulo')
print(variavel != null? 'Não é nulo' : 'É nulo')
// Ou
print(variavel ?? "É nulo") // Neste caso, exiba o valor da variavel, se for nulo exibra "é nulo"
```
>Atribuição de nulos
- Verifica se o valor é nulo, caso seja adicona um valor a ele, caso nao mantem o valor atual
```dart
  var imNull;
  var imNotNull = 5;

  imNull ??= 10; // Ira adiconar o valor 10 a variavel pois a mesma foi iniciada como nula
  imNotNull ??= 15; // Ira manter o valor original da variavel pois nao é nulo
```
> Null where operator
- Quando uma variavel pode ser nula sua propriedades nao sao exibidas a nao ser que use o operador "?" ou "!" apos a mesma
- No exemplo o metodo contains(), so ficou disponivel apos o uso do operador "?", para variaveis nao nulas nao se faz necessario.
- O operador "?" é usado quando nao pode-se afirmar que aquela variavel possui conteudo valido
- Recomendado fazer condicional para caso o retorno seja nulo outro valor assumir o contexto
```dart
  String? nullString;
  String notNullString = 'Nao nula string';

  print(notNullString.contains('Nao'));
  print(nullString?.contains('Nao') ?? 'Valor nulo passado');
```
- No exemplo o metodo contains(), so ficou disponivel apos o uso do operador "!", pois para este caso consigo ter certeza que ha um valor valido na variavel
- 
```dart
  String? nullString;
  nullString = 'Nao estou mais nulo';
  print(nullString!.contains('Nao'));
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




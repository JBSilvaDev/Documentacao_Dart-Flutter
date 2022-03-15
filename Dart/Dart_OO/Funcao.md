# Função
## Funções normais
>Invocando funcao
```dart
// Sem parametros
nomeFuncao();
// Com parametros
nomeFuncao('parametros aqui nao ordem solicitada');
// Opcionais nomeados, nao precisa ser em ordem
nomeFuncao(paran1: valor, paran2: valor);
// Opcionais nao nomeados, necessario ser em ordem
nomeFuncao(valor2,valor2);
```
>Funcao anonima
```dart
(){
    // Conteudo da funcao
}
```
>Função basica sem retorno
```dart
void nomeFuncao(){
    // O que a funcao ira fazer aqui dentro
}
```
>Funcao com retorno
```dart
int nomeFuncao(){
    // O que a funcao ira fazer aqui
    return 0; // Esta funcao retorna um valor inteiro que pode ser usado fora dela
}
```
>Funcao com parametros obrigatórios
```dart
int nomeFuncao(int n1, int n2){
    // O que a funcao ira fazer aqui
    return n1 + n2; // Esta funcao retorna um valor inteiro que pode ser usado fora dela
}
```
> Funcao com parametros opcionais nomeados
```dart
double nomeFuncao({double? n1, double? n2}) {
    // Caso os calores sejam nulos assumem o valor de 0
    // Para pular essa verificação usar a palavra required antes do tipo nos parametros, os tornando obrigatorios (required double n1)
    n1 ??= 0;
    n2 ??= 0;
    return n1 + n2;
}
```
>Funcao com parametros opcionais nao nomeados
```dart
double nomeFuncao([double? n1, double? n2]) {
    // Caso os calores sejam nulos assumem o valor de 0
    // Para pular essa verificação usar a palavra required antes do tipo nos parametros, os tornando obrigatorios (required double n1)
    n1 ??= 0;
    n2 ??= 0;
    return n1 + n2;
}
```
>Funcao com valor default
```dart
// Nomeada
double nomeFuncao({double n1 = 0, double n2 = 0}) {
  return n1 + n2;
}
// Nao nomeada
double nomeFuncao([double n1 = 0, double n2 = 0]) {
  return n1 + n2;
}
```
>Funcao com funcao nos parametros
- nomeFuncao
    - Nome da funcao a ser chamada
- funcaoParam
    - Nome da funcao no parametros
- Function(String nome)
    - Tipo de parametros que a funcaoParam ira receber
- String variavel = 'JB';
    - Valor que sera passado para parametros de funcaoParam
- funcaoParam(variavel);
    - funcaoParam recebendo o valor da variavel
- Invocacao:
    - nomeFuncao((nome) => print(nome));
        - (nome) => print(nome) é o paramentro passado para funcaoParam (como se fosse um int, String ou uma funcao anonima).
        - nome recebe o retorno da funcaoParam
        - => Aqui ira definir o que ira fazer com o valor recebido, no caso do exemplo sera impresso no console (print(nome))

```dart
void nomeFuncao(Function(String nome) funcaoParam) {
  String variavel = 'JB';
  funcaoParam(variavel);
/* Para chamar chamarFuncao((nome) => print(nome)); */
}
```
>Manipuladores
## Arrow Function
```dart
int nomeFuncao(int n1, int n2) => n1 + n2;
```

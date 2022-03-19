# Exceptions
>Exceptions são mensagens de erros que retornam uma excessão, ou seja que retorna ao usuario o motivo de alguma linha no codigo ter dado erro
- Exemplo 1:
    - Não se pode transformar texto com letras em numero
```dart
var idade = '30 anos';
int.parse(idade); // Isto irá retornar um erro de formato invalido.
```
- Para tratar o erro acima usa-se por exemplo o try/catch
```dart
try{ // Tente fazer
  int.parse(idade); // Conversao para inteiro
}catch(erro){ // Se nao conseguir salve o erro
   print(erro); // Exiba o erro salvo
   print('Ou digite uma msg personalizada -> Erro ao converter idade');
  }
 ```
 >Exemplo de try/catch personalizado para cada tipo de erro
 ```dart
String nome;
var numero = '1o';
try{
  nome!.toLowerCase() // Ira tentar converter um valor nulo o que retorna um erro
}on FormatException catch(){ // Captura erro de formato
  print('erro ao converter o texto');
}on TypeError catch(){ // Captura erro de tipo
  print('erro de tipo');
}catch(erro){ // Erro geral caso nao seja um dos acima
   print(erro); 
   print('Erro desconhecido');
  }
```

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
 >Quando codigo esta muito grando pode-se usar dois argumentos no catch, assim passando este segundo argumento num print sabera em qual linha esta o erro
 >Se nao for usar os parametro dentro do cath pode remove-los
 ```dart
String nome;
var numero = '1o';
try{
  nome!.toLowerCase() // Ira tentar converter um valor nulo o que retorna um erro
}on FormatException catch(e, s){ // Captura erro de formato
  print('erro ao converter o texto');
}on TypeError catch(e){ // Captura erro de tipo
  print('erro de tipo');
}catch(erro){ // Erro geral caso nao seja um dos acima
   print(erro); 
   print('Erro desconhecido');
  }finally{ // Sempre sera execultado tendo erro ou nao (Pode ser usado por exemplo para fechar conexoes com BD)
    print("Finalizou");
  }
```
>É possivel forçar erros
```dart
String? nome;

try{
    if(nome == null){
        throw Exception();}

// Não pode colocar antes de erros especificos como TypeErro e FormatException
// on Exception so pode vim antes do catch (erro geral) ou uso solo como neste exemplo
} on Exception{
    print('Erro capturado');
}

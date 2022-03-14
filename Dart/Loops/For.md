# For
>Percorrendo lista com for
```dart
var nomes = ['JB', 'Graci', 'Dylan', 'Felipe', 'Dora'];
// Por index
for(var i = 0; i < nomes.length; i++){
    print(nomes[i]);
  }
// operador "in"
for(var nome in nomes){
    print(nome);
  }
```
> For com condição
```dart
// Usando break para parar o loop quando achar o definido 
  for(var nome in nomes){
    if(nome == 'Dylan'){
      print('Achei $nome');
      break;
    }
  }
```

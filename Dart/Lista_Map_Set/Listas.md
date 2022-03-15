# Lista
>Declarando uma lista
```dart
var lista = <int> [1,2,3];
```
## Interações com a lista
>Exibindo itens da lista
```dart
// Exibe o item de index 1 da lista
print(lista[1]);
// Exibe o primeiro e ultimo item da lista
print(lista.first);
print(lista.last);
```
>Adicona conteudo a lista
```dart
// Adiciona novo item ao final da lista
lista.add(4)
// Adicona novo item na posicao indicada
lista.insert(0,6);
```
>Removendo conteudo da lista
```dart
// Remove o item indicado
lista.remove(6);
// Remove item com condição
lista.removeWhere((item) {
    // vai percorrer a lista como se fosse um for e deletar valores que sejam igual ao indicado
    if(item == 3){
      return true;
    }else{
      return false;
    }
  });
```
>Gerar uma lista com valores inteiros
```dart
// Lista com 10 itens criado de 1 em 1
var lista = List.generate(10, (index) => index +1);
// Resultado > [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
>Adiciona conteudo de uma lista dentro da outra
```dart
var lista = [1,2,3];
var listaNova = [...numerica, 4,5,6];
// Resultado > [1, 2, 3, 4, 5, 6]
```
>expand - Desmenbra lista dentro de lista e tranforma em uma unica
```dart
var lista = [[1, 2],[3, 4]];
  
var novaLista = lista.expand((numero) => numero).toList();
print(novaLista);
```
>any - Retorna true ou false caso encontre o conteudo informado dentro da lista
```dart
final lista = ['JB', 'Graci', 'José'];
bool retorno = lista.any((nome) => nome == 'JB');
```
>sort - Organiza a lista
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.sort();
```
>contains - Verifica se o conteudo informado esta na lista, retorna true ou false
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.contains(99);
```



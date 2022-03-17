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
// Metodos de percorrer toda lista exibindo seus itens um a um
lista.forEach(print);
for(var item in lista){
  print(item);}
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
>every - Retorna true ou false caso encontre o conteudo informado dentro de todos itens da lista
```dart
lista.every((nome) => nome.contains('J'))
```
>sort - Organiza a lista
```dart
// Ordenação simples
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.sort();
// Ordenação composta
final lista = ["Juliano|30","Graci|35","Dylan|5"];

lista.sort((nome1, nome2){
  // Separa cada item da lista pelo caractere indicado "|", 
  // Retornando uma nova lista com index 0 e 1(neste caso por serem 2 itens que serao separados)
  var nd1 = nome1.split("|");
  var nd2 = nome2.split("|");
  
  // Tranforma o item 1 do retorno em numero inteiro
  var idade1 = int.parse(nd1[1]);
  var idade2 = int.parse(nd2[1]);
  
  // Verifica se o numero 1 é maior que numero 2 e define sua posicao na nova lista index -1, 0 1
  if(idade1 > idade2){
    return 1;
  }else if(idade1 == idade2){
    return 0;
  }else{
    return -1;
  }
});
  print(lista);
```
>contains - Verifica se o conteudo informado esta na lista, retorna true ou false
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.contains(99);
```
>Transformar lista em set
```dart
pessoas.toSet()
```



# Lista
>Declarando uma lista
```dart
var lista = <int> [1,2,3];
```
## Interações com a lista
>indice - Exibindo itens da lista
```dart
// Exibe o item de index 1 da lista
print(lista[1]);
// Exibe o primeiro e ultimo item da lista
```
>first/last - Exibindo primeiro e ultimo item da lista
```dart
print(lista.first);
print(lista.last);
```
>forEach - Percorre e exibe cada item da lista
```dart
// Metodos de percorrer toda lista exibindo seus itens um a um
lista.forEach(print);
for(var item in lista){
  print(item);}
```
>add - Adicona conteudo a ultima posicao na lista
- Usar addAll() para adiconar mais de um item, passar em formato de lista
```dart
var lista = [1,2,3];
lista.add(4);
```
>insert - Adiciona conteudo a lista numa posicao desejada
- Usar insertAll() para adiconar mais de um item numa posicao especifica, passar em formato de lista
```dart
var lista = [0,1,2,3];
lista.insert(0, -1); // Adiciona -1 na posisao 0 retornando -> [-1, 0, 1, 2, 3]
```
>remove - Removendo conteudo da lista
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
>spred operator - Adiciona conteudo de uma lista dentro da outra
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
>join - Junta conteudo de uma lista e os separa pelo informado
```dart
var lista = [1, 2, 3, 4, 5, 6];
print(lista.join(' '));
// Retorno 1 2 3 4 5 6
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
>where - filtra a lista onde corresponde a uma condição passada
```dart
var lista = [1, 2, 3, 4, 5, 6];
// Exibe somente itens da lista que sao pares (resto da divisao seja igual a 0)
print(lista.where((element) => element % 2 == 0));
```
>fold - Soma os valores na lista
```dart
var lista = [1, 2, 3, 4, 5, 6];
var soma = lista.fold<int>(0,(valor, numero)=> valor = valor + numero);
// Retorno -> 21
```
>sort - Organiza a lista
- Sort organiza a lista original por padrão
```dart
// Ordenação simples
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.sort();
```
```dart
// Ordenação composta
final lista = ["Juliano|30","Graci|35","Dylan|5"];

// Percorre toda lista comparando seus itens
lista.sort((nome1, nome2){ // Obtem de 2 em 2 itens da lista

  var nd1 = nome1.split("|"); // Recebe o valor do item 1 obtido (nome1)
  var nd2 = nome2.split("|"); // Recebe o valor do item 1 obtido (nome2)
  // Retorna duas novas listas com os itens da lista anterior, separando o conteudo de cada item pelo |,
  
  // Tranforma o item 1  em numero inteiro
  var idade1 = int.parse(nd1[1]); // Pega item 1 da nova lista gerada no split
  var idade2 = int.parse(nd2[1]); // Pega item 1 da nova lista gerada no split
  
  // Verifica se o numero 1 é maior que numero 2 e define sua posicao na nova lista index -1, 0 1
  if(idade1 > idade2){
    return 1;
  }else if(idade1 == idade2){
    return 0;
  }else{
    return -1;
  }
});
```
```dart
// Ordenação composta CompareTo
lista.sort((nome1, nome2){

  var nd1 = nome1.split("|"); // Recebe o valor do item 1 obtido (nome1)
  var nd2 = nome2.split("|"); // Recebe o valor do item 1 obtido (nome2)
  // Retorna duas novas listas com os itens da lista anterior, separando o conteudo de cada item pelo |,
  
  // Tranforma o item 1  em numero inteiro
  var idade1 = int.parse(nd1[1]); // Pega item 1 da nova lista gerada no split
  var idade2 = int.parse(nd2[1]); // Pega item 1 da nova lista gerada no split
  
  return idade1.compareTo(idade2); // Compara as idades ordenando por elas
});
```
- Se idade1.compareTo(idade2);
  - retorna do menor para o maior
- Se idade2.compareTo(idade1);
  - retorna do maior para o menor

>contains - Verifica se o conteudo informado esta na lista, retorna true ou false
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.contains(99);
```
>map - Adiciona os itens de uma lista em uma nova lista e execulta funcao ou condicao em cada item.
- map sao comumente usados com lista que contem mapas em seus index
```dart
final pessoas = ["Juliano|30","Graci|35","Dylan|5"];
// Acessa cada item da lista e execulta uma funcao
// Separa cada | de item acessado por , criando uma nova lista e adicionaodo a n
final n = pessoas.map((e) => e.split("|")).toList();
print(n);
//! Retorno - [[Juliano, 30], [Graci, 35], [Dylan, 5]]
// Retorno é uma lista com listas o que pode facilitar a busca de informações especificas pelo index de cada item dentro da lista principal, exemplo quero acesso somente a idade de Dylan, faria isso print(n[2][1])
```
>reduce - Recebe uma funcao e passa 2 atributos a ela
- Reduce, recebe uma funcao e envia para a mesma ate dois argumentos, sendo estes argumentos itens da lista
  - um atributo acumulativo que salva o ultimo valor enviado
    - usado por exemplo para fazer somas ou ou concatenar strings
  - um atributo de valor que recebe o proximo valor a ser usado pelo acumulativo
```dart
// Exemplo com soma (Funcao externa)
// Ira percorrer toda lista mostrando a soma de seus itens
var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
var total = notas.reduce(somar);
print(total);

// Funcao externa invocada no reduce
double somar(double acumulador, double elemento) {
  // Aqui pode-se criar alguma regra que se  faça necessario
  return acumulador + elemento; // retorna Soma os valores da lista
}
// retorno - 58.0
```
```dart
// Exemplo com soma (Arrow Function - Diretamente no reduce/Interna)
// Ira percorrer toda lista mostrando a soma de seus itens
var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
// Recebe os valores e ja efetua a soma dos mesmos
var total = notas.reduce((value, element) => value + element);
print(total);
// retorno - 58.0
```
```dart
// Exemplo de concatecanao (funcao externa)
// Ira percorrer toda lista mostrando a juncao de seus itens
var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];
varnome = nomes.reduce(juntar);
print(nome);
 

String juntar(String acumulador, String elemento) {
  // Aqui pode-se criar alguma regra que se  faça necessario
  return "$acumulador, $elemento";
  }
// retorno - Ana, Bia, Carlos, Daniel, Maria, Pedro
```
```dart
// Exemplo de concatecanao (Arrow Function - Diretamente no reduce/Interna)
// Ira percorrer toda lista mostrando a juncao de seus itens
var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];
// Recebe os valores e ja efetua a jução dos mesmos
print(nomes.reduce((acumulador, proximo)=>'$acumulador, $proximo'));
// retorno - Ana, Bia, Carlos, Daniel, Maria, Pedro
```
>Converter uma lista para um tipo
- Usando o .cast<tipagem>()
  ```dart
  var lista = ['1', '2', '3', '4', '5', '3'];
  var lista2 = nomes.cast<int>()
  // nomes2 retornara como inteiro
  ```
>Transformar lista em set
```dart
pessoas.toSet()
```



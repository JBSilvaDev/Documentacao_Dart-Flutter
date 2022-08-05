# Lista
>Declarando uma lista
```dart
var lista = <int> [1,2,3];
```
## Interações com a lista
>indice - Exibindo itens da lista
- Exibe o item de index 1 da lista
```dart
print(lista[1]);
```
```Resultado -> 1```
>Exibindo primeiro e ultimo item da lista
- first
```dart
print(lista.first);
```
```Resultado -> 1```

- last
```dart
print(lista.last);
```
```Resultado -> 3```

>Percorre cada item da lista, obtendo seus valores
- forEach
```dart
lista.forEach((valor)=>print(valor);
```
```Resultado 1 2 3```

- for in
```dart
for(var item in lista){
  print(item);}
```
```Resultado 1 2 3```

>add - Adicona um unico item ao final da lista
- .add()
```dart
var lista = [1,2,3];
lista.add(4);
```
```Resultado -> [1, 2, 3, 4]```

- .addAll() - Adiciona um ou mais items ao final da lista
```dart
lista.addAll([4,5,6,7,8]); 
print(lista);
```
```Resultado -> [1, 2, 3, 4, 5, 6, 7, 8]```

>Adiciona conteudo a lista numa posicao desejada
- insert() - Adiciona um unico item a lista numa posição determinada
```dart
lista.insert(0,0);
print(lista);
```
```Resultado -> [0,1,2,3]```

- insertAll() - Adiciona um ou mais items numa posição determinada na lista
```dart
lista.insertAll(0,[-1, -2]);
print(lista);
```
```Resultado -> [-1, -2, 1, 2, 3]```

>Removendo conteudo da lista
-   remove() - Remove pelo index
```dart
lista.remove(0);
print(lista);
```
```Resultado -> [2,3]```

-   removeWhere(){} - Remove item que atendem a condição imposta
    - if + return
    ```dart
    lista.removeWhere((item) {
        if(item == 3){
        return true;
        }else{
        return false;
        }
    });
    print(lista);
    ```
    ```Resultado -> [1, 2]```
    
    - ternario
    ```dart
    lista.removeWhere((item) => (item == 3)?true:false);
    print(lista);
    ```
    ```Resultado -> [1, 2]```

>Gerar uma lista automatica
- Gera uma lista com 10 itens adicionando +1 para cada valor
```dart
var lista = List.generate(10, (index) => index +1);
```
```Resultado -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]```


>Adiciona conteudo de uma lista dentro da outra
-   spred operator (...lista)
```dart
var lista = [1,2,3];
var listaNova = [...numerica, 4,5,6];
```
```Resultado -> [1, 2, 3, 4, 5, 6]```


>Desmembra lista dentro de lista e tranforma em uma unica
-   expand() 
```dart
var lista = [[1, 2],[3, 4]];
var novaLista = lista.expand((numero) => numero).toList();
print(novaLista);
```
```Resultado -> [1, 2, 3, 4]```


>Junta conteudo de uma lista e os separa pelo informado
-   join()
```dart
var lista = ['Oi','JB','Silva'];
print(lista.join(' '));  
```
```Resultado -> Oi JB Silva```


>Retorna true ou false caso encontre o conteudo informado dentro da lista
-   any()
```dart
final lista = ['JB', 'Graci', 'José'];
bool retorno = lista.any((nome) => nome == 'JB');
print(retorno);
```
```Resultado -> true```


>Retorna true ou false caso encontre o conteudo informado dentro de cada item da lista
-   every() 
```dart
bool retorno = lista.every((nome) => nome.contains('J'))
print(retorno);
```
```Resultado -> false```


>Filtra o conteudo da lista exibindo quais atendem a condição passada.
-   where(){} 
```dart
final lista = ['JB', 'Graci', 'José'];
var retorno = lista.where((element) => element.contains('J'));
print(retorno);
```
```Resultado -> (JB, José)```

>Soma os valores na lista
-   fold(){}
```dart
var lista = [1, 2, 3, 4, 5, 6];
var soma = lista.fold<int>(0,(valor, numero)=> valor = valor + numero);
```
```Retorno -> 21```

>Organiza a lista
-   sort() - Sort organiza a lista original por padrão
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
lista.sort();
print(lista);
```
```Resultado -> [1, 55, 88, 99, 102, 150, 200]```

-   sort(){} - CompateTo
```dart
final lista = ["Juliano|30","Graci|35","Dylan|5"];
lista.sort((nome1, nome2){

  var nd1 = nome1.split("|");
  var nd2 = nome2.split("|");

  var idade1 = int.parse(nd1[1]);
  var idade2 = int.parse(nd2[1]);
  
  return idade1.compareTo(idade2);
  print(lista);
});
  ```
  ```Resultado -> [Dylan|5, Juliano|30, Graci|35]```

- Se idade1.compareTo(idade2);
  - retorna do menor para o maior
- Se idade2.compareTo(idade1);
  - retorna do maior para o menor

>Verifica se o conteudo informado esta na lista, retorna true ou false
-   contains()
```dart
final lista = [99, 88, 55, 01, 102, 150, 200];
print(lista.contains(99));
```
```Resultado -> true```

>Adiciona os itens de uma lista em uma nova lista e execulta funcao ou condicao em cada item.
-   map(){}
- Mapeia o conteudo da lista, obtendo o valor de cada um deles e retornando uma nova lista, usar .toList() para converter o () em []
```dart
  final lista = [
    {"nome": "Juliano", "idade": 30},
    {"nome": "Dylan", "idade": 5},
    {"nome": "Graci", "idade": 35}
  ];
  
  var n = lista.map((r) => r['nome']);
  print(n);
  ```
  ```Resultado (Juliano, Dylan, Graci) -> com toList() -> [Juliano, Dylan, Graci]```

>Recebe uma funcao e passa 2 atributos a ela
-   reduce ()
- Reduce, recebe uma funcao e envia para a mesma ate dois argumentos, sendo estes argumentos itens da lista
  - um atributo acumulativo que salva o ultimo valor enviado
    - usado por exemplo para fazer somas ou ou concatenar strings
  - um atributo de valor que recebe o proximo valor a ser usado pelo acumulativo
```dart
var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
var total = notas.reduce(somar);
print(total);

double somar(double acumulador, double elemento) {
  return acumulador + elemento;
}
```
```Resultado -> 58.0```

```dart
var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
var total = notas.reduce((value, element) => value + element);
print(total);
```
```Resultado -> 58.0```

```dart
// Exemplo de concatecanao (funcao externa)
// Ira percorrer toda lista mostrando a juncao de seus itens
var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];
var nome = nomes.reduce(juntar);
print(nome);
 
String juntar(String acumulador, String elemento) {
  return "$acumulador, $elemento";
}
```
```Resultado -> Ana, Bia, Carlos, Daniel, Maria, Pedro```

```dart
var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];
var nome = nomes.reduce((acumulador, proximo)=>'$acumulador, $proximo');
print(nome);
```
```Resultado -> Ana, Bia, Carlos, Daniel, Maria, Pedro```

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


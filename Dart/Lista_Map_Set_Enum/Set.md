# Set
>Sets sao listas que nao aceitam duplicidades
- Declaração de um set é por chaves {}
```dart
var sets = <int?>{};
```
>Transforma ser em lista
```dart
pessoas.toList()
```
>Verificar diferenças entre Sets
```dart
var n1 = {1, 2, 3, 4};
var n2 = {0, 6, 3, 4};
// Exibe os numeros que tem no n2 e nao tem no n1
print(n1.difference(n2));
// Exibe os numeros que tem no n1 e nao tem no n2
print(n2.difference(n1));
```
>Verifica valores iguais entre Sets
```dart
n1.intersection(n2);
```
>Unir dois Sets
```dart
n1.union(n2);
```
>Retorna o valor indicado caso o Set o contenha
```dart
n1.lookup(3);
```
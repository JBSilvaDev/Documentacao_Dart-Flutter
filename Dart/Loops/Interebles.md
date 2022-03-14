# Interables
>forEach
```dart
var numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
numeros.forEach((numero) => print(numero));
// Exibe todos os itens da lista
```
>where/forEach
```dart
  numeros
  .where((numero) => numero != 5)
  .forEach((numero) => print(numero));
  // Exibe todos itens da lista que sao diferente de 5
```
>tekeWhile/forEach
```dart
numeros
    .takeWhile((numero) => numero < 5)
    .forEach((numero) => print(numero));
    // Exibe itens da lista que sao menores que 5
```
>skipWhile/forEach
```dart
numeros
    .skipWhile((numero) => numero < 5)
    .forEach((numero) => print(numero));
    // Pula todos os itens menores que 5 da lista
```

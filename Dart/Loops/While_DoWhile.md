# While/Do While
>Percorrendo lista com while
```dart
var nomes = ['JB', 'Graci', 'Dylan', 'Felipe', 'Dora'];
var i = 0;

while(nomes[nomes.length - 1] != nomes[i] ){
  print(nomes[i]);
  i++;
}
```
>Adicionando valor em uma lista com while
```dart
List numeros = [];
var i = 0;
  
while(i <= 5){
  numeros.add(i);
  i++;
}
// Resultado > [0, 1, 2, 3, 4, 5]
```
>Adicionando valor a uma lista com do while
```dart
var numero = 0;
  var listNum = [numero];
  do {
    numero++;
    listNum.add(numero);
  } while(numero <  10);
// Resultado > [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

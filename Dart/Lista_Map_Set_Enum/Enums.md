# Enum
> Enum sao classes que usamos para facilitar preenchimento de informações
- Enumeradores sao uma classe que recebe imformações que sao utilizadas com uma lista de itens que as pertencem
>Criando enum
```dart
enum Cores {
  azul,
  vermelho,
  laranja,
  verde,
  preto,
}
```
>Apos criado facilita a utilização do conteudo chamando a classe .conteudo
```dart
// Isso evita possiveis erros de digitação deixando um conteudo padrao
// Isso evita rolagem de cogido, troca de pagina para verificar como um conteudo foi escrito
Cores.laranja
```
>Exemplo completo comentado
```dart
void main() {
    // Usando a cor dentro do enum
  var cor = Cores.vermelho;
    // retorna somente o nome da cor
  print(Cores.azul.name);
    // retorna um mapa com as cores como value usando numeros inteiros como chave
  var azuli = Cores.values.byName(azul);
  print(azuli);

  var coresMap = Cores.values.asMap();
  print(coresMap); // {0: Cores.azul, 1: Cores.vermelho}
    // retorna um para usando os nomes das cores como chave e valor como value
  var coresNameMap = Cores.values.asNameMap();
  print(coresNameMap); // {azul: Cores.azul, vermelho: Cores.vermelho}

}
// enum definido
enum Cores {
  azul,
  vermelho,
  laranja,
  verde,
  preto,
}
```
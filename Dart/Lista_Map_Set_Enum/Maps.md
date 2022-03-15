# Maps
> Definição de Map
- Maps sao definidos por chaves assim com Sets
- É necessario passar os tipos <String, String> do seu conteudo caso o inicie vazio
- Tem o mesmo formato de um json
- São compostos por chave e valor {"chave": "valor"}
>Declaração/Criação
```dart
var mapa = <String, String>{'nome': 'JB','curso': 'Flutter',};
Map<String, String> mapa = {'nome': 'JB','curso': 'Flutter',};
```
>Adicionando valores a um mapa
```dart
mapa.putIfAbsent('Chave', () => 'Valor');
```
>Alterando um valor dentro do mapa
```dart
mapa.update('Chave', (value) => 'NovoValor');
```
>Tenta atualizar um valor, caso nao encontre sua chave cria uma nova tambem
```dart
mapa.update('Chave',(value) => 'Valor',ifAbsent: () => 'Valor');
```
>Acesso a um conteudo especifico num mapa
```dart
mapa["Chave"];
```
>Acesso a todo conteudo de um mapa
```dart
mapa.forEach((key, value) => print('Chave: $key - valor: $value'));
```
```dart
for (var entry in produtos.entries) {
    print('Chave: ${entry.key} - valor: ${entry.value}');
}
```
```dart
for (var key in produtos.keys) {
    print('Chave: $key');
}
```
```dart
for (var value in produtos.values) {
    print('Valor: $value');
}
```
>Criando um novo mapa igual 
```dart
// Nome do novo mapa
var novMapa = mapa.map((key, value) {
    // Percorre todo mapa obtendo chaves e valores 
    return MapEntry(key, value); // Retorna um novo mapa com as chaves e valores obtidos
});
```


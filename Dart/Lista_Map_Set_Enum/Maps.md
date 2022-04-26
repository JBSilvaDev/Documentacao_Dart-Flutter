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
>Percorrer mapas dentro de lista
- Pegar todos os nomes nos maps e os adicionar em uma nova lista
```dart
var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
];
// Metodo 1
String Function(Map) pegarApenasONome = (aluno) => aluno['nome']; // Obtem os nomes da lista e retorna um objeto
var resultado = alunos.map(pegarApenasONome).toList(); // Converte o objeto em um map e depois em uma lista

// Metodo 2
var listaComNomes = alunos.map((nome) => nome['nome']).toList(); // Acessa todos os itens na lista, e obtem todos os valores na chave nome
// Retorno - [Alfredo, Wilson, Mariana, Guilherme, Ana, Ricardo]
```
- Pegar todos as notas nos maps e soma com *reduce* ( mais detalhes em [Listas](./Listas.md) ) e faz uma media.
```dart
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  var notasFinais = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double).roundToDouble());

var total = notasFinais.reduce((t, a) => t + a);
var media = total / notasFinais.length;

print('Soma: $total');
print('Media: $media');
// retorno - Soma: 51.0 Media: 8.5
```





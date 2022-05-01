# Convertendo json em ListView
- Arquivo base => [Cidades](../Pages/Cidades/)
- Lendo arquivo json e exibindo ao usuario em uma ListView
- Criada uma pagina [Statefull](../Flutter_Topicos.md#tipos-basicos-widgets)
    - Visualizar pagina criada [aqui](../img/jsonToListView.png)
- Para mapear o json foi usado a [orietação a objeto](../../Dart/Resumo_Dart.md#dart-oo)
- Json modelo usado [{"id":"1","cidade":"Sao Paulo", "estado":"SP},{"id":"2","cidade":"Mucuri", "estado":"BA}...]
- Dentro do State, criada variavel cidade que recebe uma lista tipada como < Cidade > *<= Classe Cidade (OBJ)*
- Em @override, foi criado initState() que ira invocar a funcao que busca os dados do json quando a tela for iniciada.
- Para detalhes sobre a funcao que trata o json veja [Async/Await](../../Dart/Dart_OO/Async.md)
- No corpo da pagina usa-se [ListView.builder](./Scroll_List.md#listviewbuilder)
- O conteudo do [ListView.builder](./Scroll_List.md#listviewbuilder):
    -   itemCount: Passado o length da lista 
    -   itemBuilder: Funcao que recebe context e index, seu conteudo:
        -   Variavel que recebe um item da lista baseando-se pelo index do itemBuilder
        -   Retorna um [ListTile](./Scroll_List.md#listtile), seu conteudo:
            -   title: Recebe widget de texto passando a objeto1.chave
            -   subtitle: Recebe widget, para mais de um item colocar [collumn ou row](./WidgetGeral.md#rows--columns)
            -   trailing: Recebeu um [botao icone](./WidgetGeral.md#buttons) para remover os itens da lista
- Resultado na exibição da lista [clique aqui](../img/listacitys.png)
- OBS: Todas as funcoes apos serem usadas invocam o _loadCities() para assim atualizar os itens na tela
- OBS: Para usar o dartion no link foi substituido o *localhost* por *10.0.2.2*.


## Funcoes para interacao com o BD
>Consulta
```dart
  Future<void> _loadCities() async {
    final cidadesJson = await get(Uri.parse('http://10.0.2.2:8000/cidades'));
    setState(() {
      var cidadesList = jsonDecode(cidadesJson.body);
      cidades =
          cidadesList.map<Cidade>((city) => Cidade.fromMap(city)).toList();
    });
  }
```
>Inserir
```dart
  Future<void> _newCities(Cidade cidade) async {
    await post(Uri.parse('http://10.0.2.2:8000/cidades/'),
        body: cidade.toJson(), headers: {'content-type': 'application/json'});

    setState(() {
      _loadCities();
    });
  }
```
>Atualizar
```dart
  Future<void> _updateCities(
      {required Cidade cidade, required String id}) async {
    await put(Uri.parse('http://10.0.2.2:8000/cidades/$id'),
        body: cidade.toJson(), headers: {'content-type': 'application/json'});

    setState(() {
      _loadCities();
    });
  }
```
>Remover
```dart
  Future<void> _removeCities(String id) async {
    await delete(Uri.parse('http://10.0.2.2:8000/cidades/$id'));

    setState(() {
      _loadCities();
    });
  }
```

## Ações nos botoes
>Consulta
```dart
onPressed: () {
    setState(() {
        _loadCities();
    });
    },
```
>Inserir
```dart
  onPressed: () {
    setState(() {
        _newCities(
            Cidade(cidade: "Posto da mata", estado: "BA", id: "8"));
    });
    },
```
>Atualizar
```dart
 onPressed: () {
    setState(() {
        _updateCities(
            id: "5", cidade: Cidade(cidade: 'Itabatã', estado: 'BA'));
    });
    },
```
>Remover
- Botao dentro de cada item da lista
```dart
  onPressed: () {
    _removeCities('${cidade.id}');
    },
```

# Models Estrutura basica
> Segue mesmos principios do [HTTP](/Dependencias/Rest-RestFull/HTTP.md), alterando apenas o metodo de uso.

>Usa-se classes para representar o que o json ira retornar, nos exemplos uso [Cidade](./ClassesModels/cidade.dart).

- Os atributos da classe [Cidade](./ClassesModels/cidade.dart):
    - sao alguns dos items que estao retornando do json [API via CEP](https://viacep.com.br/ws/45936000/json) - [Img Retorno API](../../../Dart/Img/ViaCepAPI.png)..
- O construtor:
    - usa o required para dizer que os itens sao obrigatorios
## Metodos:
- foram criados 4 métodos, métodos sao contrutores e como ja existe um construtor chamado Cidade, usamos um extensor no nome para identifica-los, no caso fromMap.
>Metodo 1 

- ```dart
    factory Cidade.fromMap(Map<String, dynamic> map) {}
    ```
- Ira receber um mapa de String e dynamic de nome map.
- Ira retornar o contrutor Cidade, passando as informações para cada item requerido, caso o json nao retorne um dado passa a informação como vazia
    - ```dart
        return Cidade(
            cep: map['cep'] ?? '')
        ```
>Metodo 2

- ```dart
    factory Cidade.fromJSON(String source) {}
    ```
- Ira receber uma String de nome source
- Em seu conteudo tera uma variavel onde ira converter esta String recebida em modelo de mapa
- Ira retornar o método Cidade.fromMap passando a variavel como parametro que irá efetuar a criação do objeto solicitado:
    - ```dart
        var jsonMap = jsonDecode(source); // Converte a String recebida da API em um mapa
        return Cidade.fromMap(jsonMap);
        ```
>Metodo 3

- ```dart
    Map<String, dynamic> toMap() {
        return {
            'cep': cep
            }
    ```
- Ira converter a instancia/conteudo de Cidade em um mapa, ou seja o conteudo passado para o contrutor ira ser convertido em um mapa, assim sendo possivel usa-lo de modo convencional.
>Metodo 4

- ```dart
    String toJson() => jsonEncode(toMap());
    ```
> Extra:
- Ira converter o conteudo de toMap (Metodo 3) em um json
- Gerar o toString (atalho VScode) para retornar uma string formatada
    - ```dart
        @override
        String toString() {
        return 'Cidade(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro $bairro, localidade: $localidade, uf: $uf, ddd: $ddd)';
        }
        ```

## Utilização do modelo no arquivo principal
- No arquivo principal importar o arquivo com modelo
- Efetuar mesmo processo do [HTTP](/Dependencias/Rest-RestFull/HTTP.md), porem vamos passar o response como parametro de Cidade.fromJson.
```dart
Future<void> buscaCep() async {
  // Json que retorna um Map
  var url = 'https://viacep.com.br/ws/45936000/json';
  var link = Uri.parse(url);
  var response = await http.get(link);

// Verifica se a conexao com API deu retorno positovo
  if (response.statusCode == 200) {
      // Invoca o Metodo 2, convertendo a string recebida pela API em um Json, que em seu retorno invoca o Metodo 1 que ira trasnformar o Json em um mapa
    var cidade = Cidade.fromJSON(response.body);
    // Feita as conversoes, é possivel agora obter o conteudo da API usando OO, puxando pelos atributos da classe
    print(cidade.bairro);

    // Converte o objeto em um mapa
    print(cidade.toMap());
    // Converte o objeto em um json
    print(cidade.toJson());
  }
```
# Models map + list
  
> Segue mesmos principios do [HTTP](/Dependencias/Rest-RestFull/HTTP.md), alterando apenas o metodo de uso.

>Usa-se classes para representar o que o json ira retornar, nos exemplos uso [User Types](./ClassesModels/user_type.dart).

- Os atributos da classe [User](./ClassesModels/user.dart):
    - sao alguns dos items que estao retornando do json [Mocki API](https://5f7cba02834b5c0016b058aa.mockapi.io/api/users/1) - [Img Retorno API](../../../Dart/Img/MockAPI.png).
    - uma das chaves desta API retorna como valor uma lista que possui um map como um dos itens
    - foi necessario criar duas classes, uma para tratamento da API outra para tratamento do retorno como Lista
    - a classe [User Types](./ClassesModels/user_type.dart) fara todo tratamento da lista que contem um map, o models usado é o padrao, o mesmo usado na [API via CEP](https://viacep.com.br/ws/45936000/json), como o conteudo da lista é uma string modelo json/map o tratamento foi o mesmo.
    - a classe [User](./ClassesModels/user.dart) fara o tratamento da API de modo geral porem um de seus atributos é do tipo List assim como é no [Retorno API](../../../Dart/Img/MockAPI.png), e esta lista ira ser do tipo [User Types](./ClassesModels/user_type.dart), ou seja, ira receber o que foi tratado na classe irmã como conteudo para assim montar um objeto unico dando o retorno desejado ao usuario final
        - ```dart
            class User {
                final String id;
                final String name;
                final String userName;
                final List<UserTypes> userTypes;
            ```
## Metodos
- foram criados 4 metodos, assim como no exemplo anterior, porem o tratamento para uma das chaves é diferenciado pois o valor da mesma é uma lista que esta sendo tratada em outra [classe](./ClassesModels/user_type.dart)

>Metodo 1

- ```dart
    factory User.fromMap(Map<String, dynamic> map) {}
  ```
- Ira receber um mapa de String e dynamic de nome map.
- Ira retornar o contrutor Cidade, passando as informações para cada item requerido, caso o json nao retorne um dado passa a informação como vazia
- userTypes
    - ```dart
        return User(
        userTypes: map['user_types']?.map<UserTypes>((type) {
                return UserTypes.fromMap(type);
                }).toList() ??
                <UserTypes>[]);
        ```
- a chave userTypes esta mapeando o valor recebido:
    - map['user_types']? <i>(Se o valor nao for nulo)</i>
    - .map< UserTypes >((type) <i>(Converta para um mapa do tipo [UserTypes](./ClassesModels/user_type.dart)</i>)
    - return UserTypes.fromMap(type);}).toList()<i> (Retorna a invocação de fromMap dentro de [UserTypes](./ClassesModels/user_type.dart) e o transforma em uma lista) </i>
    -  ??< UserTypes >[] <i>(Ou retorna uma lista do tipo [UserTypes](./ClassesModels/user_type.dart) vazia, caso seja um conteudo invalido/nulo)</i>

>Metodo 2

- ```dart
    factory User.fromJSON(String source) => User.fromMap(jsonDecode(source));
    ```
- Faz a mesma coisa do modelo anterior, porem em arrow function e sem uso de variaveis
- Ira receber uma String de nome source
- Ira retornar o método Cidade.fromMap passando a variavel como parametro que irá efetuar a criação do objeto solicitado:

>Metodo 3

- ```dart
    Map<String, dynamic> toMap() {
        return {
        'id': id,
        'user_types': userTypes.map((e) => e.toMap()).toList()
    };
    ```
- Ira converter a instancia/conteudo de Cidade em um mapa, ou seja o conteudo passado para o contrutor ira ser convertido em um mapa, assim sendo possivel usa-lo de modo convencional.
- user_types:
    - userTypes.map((e) <i> (Percorre todo o conteudo)</i>
    - => e.toMap()).toList() <i> (Passa o conteudo para o metodo toMap dentro de [UserTypes](./ClassesModels/user_type.dart) e o converte em lista) </i>
>Metodo 4

- ```dart
    String toJson() => jsonEncode(toMap());
    ```
> Extra:
- Ira converter o conteudo de toMap (Metodo 3) em um json
- Gerar o toString (atalho VScode) para retornar uma string formatada
    - ```dart
        @override
        String toString() {
        return 'Cidade(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro $bairro, localidade: $localidade, uf: $uf, ddd: $ddd)';
        }
        ```

## Utilização do modelo no arquivo principal
- No arquivo principal importar o arquivo com modelo
- Efetuar mesmo processo do [HTTP](/Dependencias/Rest-RestFull/HTTP.md), porem vamos passar o response como parametro de Cidade.fromJson.
```dart
Future<void> buscarUser() async {
  var url = 'https://5f7cba02834b5c0016b058aa.mockapi.io/api/users/1';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var user = User.fromJSON(response.body);
    // Exibe todo conteudo retornado pela API
    print(user);
    // Exibe o item na chave nome
    print(user.nome);
    // Exibe a lista completa (lista que é o conteudo da chave usertypes)
    print(user.userTyper);
    // Exibe um item especifico da lista com base no index
    print(user.userTyper[1]);
  }
}
```
## Usando A IDE a seu favor
- Instalar extensão : <b>[Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=dotup.dart-data-class-generator)</b>
- Com a classe ja criada com seus atributos
    - clique sobre o nome da classe, use <i><b>CTRL+ .</i></b> ou clique na lampada amarela
    - clique em [Generate contructor](../../../Dart/Img/genereteconstructor.png)
        - Irar criar o contrutor para a sua classe automaticamente
    - clique em [Generate JSON serialization](../../../Dart/Img/generetejsonserialization.png)
        - Ira criar basicamente todo o conteudo visto até aqui (sobre models), pode ser necessario efetuar alguns ajustes
    - clique em [Generate toString](../../../Dart/Img/generatetostring.png)
        - Ira criar um @override para exibição do retorno da classe


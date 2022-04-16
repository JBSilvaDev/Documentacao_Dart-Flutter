# HTTP
>HTTP é um pacote do dart que usamos para efetuar requisicoes a um banco de dados atrasvez de API<br>
Docs: [Clique aqui](https://pub.dev/packages/http)<br>
Models: [Clique Aqui](/Dependencias/Rest-RestFull/Models/HTTP_Models.md)
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    http: ^0.13.4 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:http/http.dart';
// OU com alias para referenciar no codigo
import 'package:http/http.dart' as http;
```
- HTTP ira trabalha em conjunto com o convert, necessario para usar o Encode e Decode
```dart
import 'dart:convert';
```
## Principais verbos HTTP
- GET
    - Buscar recursos, fazer solicitações a API
- POST
    - Enviar recurso, fazer um novo registro
- PUT
    - Atualizar um recurso existente
- DELETE
    - Remove um recurso
## Status HTTP (response)
- 1xx Informational
- 2×× Success
- 3×× Redirection
- 4×× Client Error
- 5×× Server Error
[Site referencia](https://www.httpstatuses.com)

>Invocando uma funcao de requição

O metodo de invocar uma requisicao HTTP é o mesmo de um async/await comum
```dart
Future<void> main() async {
  await requisicaoHTTP();
}
```
## Implementação ao codigo
>Efetuando uma requisicao HTTP - (API de exemplo Via CEP)<br>

Para efetuar uma requisão HTTP é necessario converter a URL da API em URI<br>
Como é uma requisao de API é necessario usar o Async/Await para aguardar a resposta da API, pois o retorno é um "futuro"
```dart
Future<void> requisicaoHTTP() async {
var urlAPI = 'https://viacep.com.br/ws/45936000/json'; // Link da API
var convertURI = Uri.parse(urlAPI); // Converte a URL em URI
var response = await http.get(convertURI); // Efetuando a requisicao a API
```
```dart
print(response.statusCode); // Exibe o Status HTTP (Tópico acima)
```
```dart
// response.body é o conteudo retornado da API
// O retorno é uma String, entao se faz necessario converte-lo, ou efetuar o Decode (descodificar)
// IMPORTAR O import 'dart:convert' as convert;
var responseData = jsonDecode(response.body);
```
```dart
// Apos decodificação o retorno pode se tornar um Map ou List
// Para obter o conteudo do retorno do tipo mapa basta exibi-lo diretamente
print(responseData['bairro']);

// Para obter o conteudo do retorno do tipo lista necessario um forEach ou For in
responseData.forEach(((element) => print(element['id']))); // Ira exibir todos os IDs existentes da API

// Para um melhor tratamento é recomendado adicionar os elementos desejados em uma nova lista
var listaDeIds = [];
responseData.forEach(((element) => listaDeIds.add(element['id'])));
print(listaDeIds); // Retorna a lista contendo os IDs
print(listaDeIds['index']); // Retorna um index de um ID desejado
```
```dart
// É uma boa pratica criar uma condição para que se o retorno for positivo (Status HTTP), code 2xx, seguir com codigo, se nao informar ao usuario o ocorrido
if (response.statusCode >= 200 && response.statusCode < 300) {
    // Codigos response aqui
}else{
    print('Erro de requisição: ${response.statusCode}');
}
```
```dart
// Como temos dois tipos de retorno possivel, List e Map, é uma boa pratica criar uma condição para tratar cada tipo de retorno
if (responseData is List) {
    // Tratamento do response em caso de retorno em lista
}else if(responseData is Map){
    // Tratamento do response em caso de retorno em mapa
}
}
```
<b>OBS: Todo codigo acima estaria dentro da mesma funcao <i>requisicaoHTTP</i>, foi separado em blocos para uma melhor legibilidade.</b>
> Enviando dados para API

```dart
Future<void> enviarHTTP() async {
    
    // Link da API
    var link = "https://jsonplaceholder.typicode.com/posts/";
    
    // Convertente URL em URI
    var url = Uri.parse(link);
    
    // Dados a serem enviado devem estar no formato que a API pede, neste caso um mapa do tipo <String><String>
    var mapaRequest = {
        'title': "Post Novo",
        'body': 'Descricao do post',
        'userID': 1,
        };
    
    // Convertendo (Codificando) os dados que serão enviados aos servidor
    var bodyHTTP = jsonEncode(mapaRequest);
    
    /* Efetua o envio dos dados com metodo post
        url - link da API que enviara os dados
        body - conteudo a ser enviado */  
    var response = await http.post(url, body: bodyHTTP);
    print(response.statusCode); // Retorna o Status HTTP
}
```
Seguir os mesmos parametros para DELETE e PUT (Pode se fazer necessario informar o ID do item a ser ataulizado)
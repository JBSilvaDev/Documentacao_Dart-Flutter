>Usado para requisicoes na internet atravez de links (api)
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/http)<br>
[Status conecxões HTTP](https://www.webfx.com/web-development/glossary/http-status-codes/)
```yaml
dependencies:
  http: ^0.13.4 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:http/http.dart' as http;
```
## Utilizazção
>Utilização com pacote convert - import 'dart:convert' as convert;<br>
### Enviar dados para URL
```dart
Future<void> salvarPost() async {
    var link = "LINK HTTP";
    // Converte a URL em URI para acesso aos dados
    var url = Uri.parse(link);
    // Dados a serem enviados (Formato mapa)
    var mapaRequest = {
    'title': "Post Novo",
    'body': 'Descricao do post',
    'userID': 1,};
    // Envia as informações para o link convertendo em json
    var response = await http.post(url, body: convert.jsonEncode(mapaRequest));
    // Verifica status de conexão
    print(response.statusCode);}
```
### Obter informações da URL
```dart
Future<void> buscaCep() async {
    // Obtendo informações pelo CEP
    var url = 'https://viacep.com.br/ws/45936000/json';
    // Converte a URL em URI para acesso aos dados
    var link = Uri.parse(url);
    // Faz a querisição a URI
    var response = await http.get(link);
    // Se obter um status de conexão positivo
    if (response.statusCode == 200) {
        // Converte os valores recebidos em um mapa
        var responseData = convert.jsonDecode(response.body);
        // Se a conversao em mapa for feita, retorne o conteudo da chave bairro
        if (responseData is Map) {
            print(responseData['bairro']);}}}
```

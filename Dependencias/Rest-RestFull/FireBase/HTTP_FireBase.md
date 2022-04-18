# Firebase
- Conexão com banco de dados firebase
- Fazendo principais requisições a um BD
- Seguindo mesmos principios do [HTTP](./../HTTP.md)
- Função mais para ativar as requisições
  - ```dart
    Future<void> main() async {
      // Envia dados para o BD
      await postarFirebase();
      // Consulta dados no BD
      await consultaFirebase();
      // Altera dados no BD
      await atualizarFirebase("-N-tuiiV-XsrH5S0maQk");
      // Tras lista de Ids no BD
      await idsFirebase();
      // Deleta dados no BD
      await delFirebase("Id que ira ser deletado");
    }
    ```

>GET
- Buscar recursos, fazer solicitações a API
  - ```dart
    Future<void> consultaFirebase() async {
      final baseUrl =
          'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
      final url = Uri.parse(baseUrl);
      final response = await get(url);

      final responseData = jsonDecode(response.body);
      // Exibe conteudo do id
      print(responseData["-N-tlkRV-WL4Ga0EZX-L"]);
      }
    ```

>POST
- Enviar recurso, fazer um novo registro
  - ```dart
    Future<void> postarFirebase() async {
      final baseUrl =
          'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
      final url = Uri.parse(baseUrl);
      final mapaBody =
          jsonEncode({"nome": "Deletavel", "preço": "0,00", "tipo": "objeto"});
      // Enviar o Map para o corpo BD
      final response = await post(url, body: mapaBody);
    }
    ```
>PUT/PATCH
- Atualizar um recurso existente
  - ```dart
    Future<void> atualizarFirebase(String Id) async {
      var baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test';
      var url = Uri.parse('$baseUrl/Id.json');
      final mapaBody =
          jsonEncode({"nome": "Camisa", "preço": "50,00", "tipo": "Vestimenta"});
      var response = await put(url, body: mapaBody);

      baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
      url = Uri.parse(baseUrl);
      response = await get(url);

      final responseData = jsonDecode(response.body);
      print(responseData[Id]);
    }
    ```
>DELET
- Remove um recurso
  - ```dart
    Future<void> delFirebase(String Id) async {
      var baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test';
      var url = Uri.parse('$baseUrl/$Id.json');
      var response = await delete(url);

      baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
      url = Uri.parse(baseUrl);
      response = await get(url);
    }
    ```
>Consulta IDs do BD
- Exibe uma lista dos Ids contidos no BD
  - ```dart
    Future<void> idsFirebase() async {
      final baseUrl =
          'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
      final url = Uri.parse(baseUrl);
      final response = await get(url);

      final responseData = jsonDecode(response.body);
      //Exibe o BD
      print(responseData);
      //Exibe as chaves do BD
      responseData.keys.forEach((a) => print(a));
      //Exibe os valores do BD (mapas de cada chave)
      responseData.values.forEach((a) => print(a));
      //Exibe um conteudo especifico de um dos valores do BD
      responseData.values.forEach((a) => print(a["nome"]));
    }
    ```

```dart
import 'package:http/http.dart';
import 'dart:convert';

Future<void> main() async {
  await postarFirebase();
  await consultaFirebase();
  await atualizarFirebase();
  await idsFirebase();
  await delFirebase();
  await idsFirebase();
}

Future<void> postarFirebase() async {
  final baseUrl =
      'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
  final url = Uri.parse(baseUrl);
  final mapaBody =
      jsonEncode({"nome": "Deletavel", "preço": "0,00", "tipo": "objeto"});
  final response = await post(url, body: mapaBody);
}

Future<void> consultaFirebase() async {
  final baseUrl =
      'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
  final url = Uri.parse(baseUrl);
  final response = await get(url);

  final responseData = jsonDecode(response.body);
  print(responseData["-N-tlkRV-WL4Ga0EZX-L"]);
}

Future<void> atualizarFirebase() async {
  var baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test';
  var url = Uri.parse('$baseUrl/-N-tuiiV-XsrH5S0maQk.json');
  final mapaBody =
      jsonEncode({"nome": "Camisa", "preço": "50,00", "tipo": "Vestimenta"});
  var response = await patch(url, body: mapaBody);

  baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
  url = Uri.parse(baseUrl);
  response = await get(url);

  final responseData = jsonDecode(response.body);
  print(responseData["-N-tuiiV-XsrH5S0maQk"]);
}

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
Future<void> delFirebase() async {
  
  var baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test';
  var url = Uri.parse('$baseUrl/-N-u8EQlfkryWhU5cUaz.json');
  var response = await delete(url);

  baseUrl = 'https://testedart-10a61-default-rtdb.firebaseio.com/test.json';
  url = Uri.parse(baseUrl);
  response = await get(url);
}
```

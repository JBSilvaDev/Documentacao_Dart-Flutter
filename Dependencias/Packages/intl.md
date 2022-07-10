>Usado para formatação de valores
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/intl)<br>
```yaml
dependencies:
  intl: ^0.17.0 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:intl/intl.dart';
```
## Utilizazção
>Formatação moeda
- Configurando variavel que ira receber valor a ser formatado de moeda para double
```dart
var formatter = 
NumberFormat.simpleCurrency(
    // Formato do valor a ser recebido
    locale: 'pt_BR',
    // Numero de decimais
    decimalDigits: 2,);
```
- Convertendo o valorRecebido e o convertendo para double
```dart
double valorConvertido = formatter.parse(valorRecebido.text) as double;
```
>Formatação data
- Definir variavel com formato desejado
```dart
final dateFormat = DateFormat('dd/MM/y');
```
- Dentro de um ```Text()``` a variavel é chamada passando a data a ser formatada
```dart
Text(dateFormat.format(DateTime.now())),
```
- Exemplo formatação:
  - [Sem formatação](../../Img/data1.jpg)
  - [Com formatação](../../Img/data2.jpg)

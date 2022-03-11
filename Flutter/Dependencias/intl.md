>Usado para converter valor recebido (numerico) em outro
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
```dart
// Configurando variavel que ira receber valor a ser formatado de moeda para double
var formatter = 
NumberFormat.simpleCurrency(
    // Formato do valor a ser recebido
    locale: 'pt_BR',
    // Numero de decimais
    decimalDigits: 2,);
// Convertendo o valorRecebido e o convertendo para double
double valorConvertido = formatter.parse(valorRecebido.text) as double;
```
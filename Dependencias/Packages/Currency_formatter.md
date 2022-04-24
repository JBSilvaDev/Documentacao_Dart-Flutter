>Usado para formatar para moeda de acordo com o local
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/currency_text_input_formatter)<br>
```yaml
dependencies:
  currency_text_input_formatter: ^2.1.5 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
```
## Utilizazção
```dart
// Formatando campo para moeda pt_BR
CurrencyTextInputFormatter(
    // Local, tipo de formatação
    locale: 'pt_BR',
    // Simbolo da moeda personalizavel
    symbol: '',
    // Quantidade de numeros decimais
    decimalDigits: 0,
    // Se ha ou nao quebra de milhar na numeração
    turnOffGrouping: true,),
```
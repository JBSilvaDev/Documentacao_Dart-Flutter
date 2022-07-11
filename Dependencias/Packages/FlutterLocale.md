# Date Time Picker
>Usado para exibição de calendario.<br>
Docs: [Clique aqui](https://flutter.dev/tutorials/internationalization)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
- Import diferente pois dados ja estao no SDK do flutter, fazer conforma abaixo
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter "^2.1.0" #(Ou qualquer outra versão na documentação)
```
- Efetuar configuração no [MaterialApp](../../Flutter/Principais/MateralApp.md)
```dart
import 'package:flutter_localizations/flutter_localizations.dart';
```
## Utilização
- Passar em lista do ```localizationsDelegates``` do [MaterialApp](../../Flutter/Principais/MateralApp.md) ```GlobalMaterialLocalizations``` e ```GlobalWidgetsLocalizations``` .delegate
- Passar em lista do ```supportedLocales``` do [MaterialApp](../../Flutter/Principais/MateralApp.md) ```const Locale('pt', 'BR'),```
  - Isto ira determinar a linguagem padrão do app
```dart
MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
        
      ],
```



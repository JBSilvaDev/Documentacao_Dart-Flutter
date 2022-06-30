>Usado para adiconar botoes personalisados de logins com redes sociais, Google, Facebook, etc...
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/flutter_signin_button)<br>
```yaml
dependencies:
  flutter_signin_button: ^2.0.0 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:flutter_signin_button/flutter_signin_button.dart';
```
## Utilizazção
```dart
SignInButton(
  Buttons.Google,
  padding: EdgeInsets...
  onPressed: () {},
  shape: OUtLineInputBorder(...)
)

// Com texto personalizado
SignInButton(
  Buttons.Google,
  text: "Login com Google",
  onPressed: () {},
)
```
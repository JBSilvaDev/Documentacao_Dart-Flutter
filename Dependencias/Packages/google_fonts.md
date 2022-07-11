>Usado para estilizar textos
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/google_fonts)<br>
```yaml
dependencies:
  google_fonts: ^3.0.1 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:google_fonts/google_fonts.dart';
```
## Utilizazção
- Passar em tags style o GoogleFonts.FONT()
- Para mais estilo usar dentro do GoogleFonts a tag ```texStyle``` que recebe ```TextStyle()```
```dart
style: GoogleFonts.acme()
style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 10))
```
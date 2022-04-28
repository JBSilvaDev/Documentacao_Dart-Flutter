>Usado para formatar textos
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/google_fonts)<br>
```yaml
dependencies:
  google_fonts: ^2.3.2 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:google_fonts/google_fonts.dart';
```
## Utilizazção
```dart
Text('Formatação com GoogleFonts',style: GoogleFonts.lato(),
```
```dart
Text('This is Google Fonts',style: GoogleFonts.getFont('Lato')),
```
```dart
Text('This is Google Fonts',style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),),)
```
```dart
Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline4),
),
```
```dart
Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.headline4,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  ),
),
```
- No [MaterialApp](../../Flutter/Apoio_Widgets/MateralApp.md)
```dart
final textTheme = Theme.of(context).textTheme;
MaterialApp(
  theme: ThemeData(
    textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
      body1: GoogleFonts.oswald(textStyle: textTheme.body1),
    ),
  ),
);
```

>Usado para adiconar botoes personalisados de logins com redes sociais, Google, Facebook, etc...
# Configuração
## No .yaml
>Documentação: <br>

[fluttericon](https://www.fluttericon.com/) - *Recomendado leve apenas icones selecionados*<br>
[pub.dev](https://pub.dev/packages/fluttericon) - *Completo pesado todos os icones*<br>
```yaml
dependencies:
# Necessario somente se usar o package de pub.dev
  fluttericon: ^2.0.0 # Ou versao desejada
```
```yaml
fonts:
    - family: NomeDoArquivo
      fonts:
        - asset: assets/fonts/NomeDoArquivo.ttf
```
## No Site
>Buscar e selecionar os icones desejados, dar nome ao arquivo e baixar o zip
- Copiar a fonte.ttf para pasta assets/fonts
- Copiar o NomeDoArquivo.dart para uma pasta dentro do projeto *ui (Pasta de estilização)*
- Caso baixe novos icones, substituir o fonte.ttf pelo novo e adicionar a linha static const IconData *nomeIcone* ao arquivo NomeDoArquivo.dart
## No arquivo
>Importar conteúdo do package
```dart
// Necessario somente se usar o package de pub.dev
// Cada icone exige um import diferente
import 'package:fluttericon/typicons_icons.dart'
```
## Utilizazção
```dart
NomeDoArquivo.nomeIcone,
```
```dart
Icon(Typicons.attention),
```

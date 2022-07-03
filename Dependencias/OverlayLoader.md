# Overlay Loader
>SQLite é um banco de dados local que é armazenado no proprio dispositivo que esta em uso.<br>
Docs: [Clique aqui](https://pub.dev/packages/flutter_overlay_loader)<br>
## Utilização
- Importar dependências no arquivo pubspec.yaml
```yaml
dependencies:
    flutter_overlay_loader: ^2.0.0 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
```
## Principais comandos
- Verificar documentação
- Se faz necessario criar uma class que possua Build context para chamar o o load passando o contexto dessa classe
- Aula Criando utilitários de controle de loader, success, error.

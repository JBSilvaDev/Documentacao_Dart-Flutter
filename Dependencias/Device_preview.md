# Device Preview
>Device Preview é um pacote onde se pode emular outros aparelhos dentro de um unico emulador, assim é possivel ver como seu app ficaria em dimenções de telas diferentes<br>
Docs: [Clique aqui](https://pub.dev/packages/device_preview)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
  device_preview: ^1.0.0 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:device_preview/device_preview.dart';
```
-   Para usar o Device preview, devi-se configura-lo no main() especificamente no runApp()
-   Compoe:
    -   enable: Ira definir se o package estara ativo ou nao (Usar !kReleaseMode para definição automatica se ativo ou não, esta opção identifica se o app esta em faze de relese ou nao)
    -   builder: Recebe uma função com um contexto qualquer (_) que ira retornar o MyApp()
    -   ```dart
        void main() {
        runApp(DevicePreview(
            enabled: false,
            builder: (_) => MyApp()));
        }
        ```
-   Dentro do [MaterialApp](../../Flutter/Apoio_Widgets/MateralApp.md), incluir duas novas linhas
    -   ```dart
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        ```
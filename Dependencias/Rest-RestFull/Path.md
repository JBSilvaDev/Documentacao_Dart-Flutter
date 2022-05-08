# Path
>Path é usado para localizar arquivos e dados usados na aplicação.<br>
Docs: [Clique aqui](https://pub.dev/packages/path)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    path: ^1.8.1 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:path/path.dart';
// OU com alias para referenciar no codigo
import 'package:path/path.dart' as p;
```
## Exemplo de concatenação
```dart
import 'package:path/path.dart';
void main() {
  var endereco = 'pasta/pasta2/';
  var novoendereco = join(endereco, 'pasta3');
  print(novoendereco);
}
// Resultado => 'pasta/pasta2/pasta3'
```
- Importante o uso do pacote pois dependendo da plataforma o tipo de barra usada para separação das pastas muda de "/" para "\", Com o path evitamos este tipo de problemas.

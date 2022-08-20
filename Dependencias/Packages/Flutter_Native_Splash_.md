# Flutter native splash
>Usado para alterar a pagina de splash nativa.<br>
Docs: [Clique aqui](https://pub.dev/packages?q=flutter_native_splash)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
- Import diferente pois dados ja estao no SDK do flutter, fazer conforma abaixo
```yaml
dependencies:
  flutter_native_splash: ^2.2.6 #(Ou qualquer outra versão na documentação)
```
- Efetuar configuração no [MaterialApp](../../Flutter/Principais/MateralApp.md)
```dart
// Não necessario importação de arquivo, seguir passos abaixo
```
## Utilização
- Criar um arquivo .yaml com nome do pacote : [Exemplo](./exemplos/flutter_native_splash.yaml)
- Ler ou "descomentar" as linhas para configurar a splash page
- Usar comando no terminal para o pacote gerar as configurações necessarias para sua splash

```
flutter pub run flutter_native_splash:create
```




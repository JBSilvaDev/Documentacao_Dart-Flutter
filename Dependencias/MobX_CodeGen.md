# Configuração
- Alem das configurações do [MobX](./MobX.md) efetuar as configurações abaixo
## No .yaml
- Usado em conjunto com ***MobX**
>Documentação: <br>
Mobx_CodeGen - [pub.dev](https://pub.dev/packages/mobx_codegen)<br>
Builder Runner - [pub.dev](https://pub.dev/packages/build_runner)<br>
```yaml
dependencies:
  mobx_codegen: ^2.0.7 #ou outra versão desejada
  build_runner: ^2.2.0 #ou outra versão desejada
```

>Outro metodo de importação do pacote
```
dart pub add build_runner --dev
dart pub add mobx_codegen
```
## Utilizazção
- Comandos terminal para utilização
  - Executa o builder uma unica vez para gerar um arquivo de codigo baseado nos parametros passados nas classes
  ```
  flutter pub run build_runner build
  ```
  - Executa o builder e fica "escutando" alterações no codigo mantendo sempre o arquivo de codigo gerado atualizado
  ```
  flutter pub run build_runner watch
  ```
  - Usado para limpar as configurações em caso de bug e reiniciar o arquivo de codigo gerado
  ```
  flutter pub run build_runner build --delete-conflicting-outputs
  flutter pub run build_runner watch --delete-conflicting-outputs
  ```
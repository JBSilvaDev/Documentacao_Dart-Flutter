# Configurações
## No .yaml
>Documentação: \
Get It - [pub.dev](https://pub.dev/packages/get_it)\
Injectable - [pub.dev](https://pub.dev/packages/injectable/install)\
Builder Runner - [pub.dev](https://pub.dev/packages/build_runner) \
Injectable Generator - [pub.dev](https://pub.dev/packages/injectable_generator) \

```yaml
dependencies:
  get_it: ^7.2.0 #ou outra versão desejada
  injectable: ^2.1.0 #ou outra versão desejada
```
```yaml
dev_dependencies:
  injectable_generator: ^2.1.4 #ou outra versão desejada
  build_runner: ^2.3.3 #ou outra versão desejada
```
>Outro metodo de importação dos pacotes
- ctrl+shift+p -> Dart: Add Dependecy
- ctrl+shift+p -> Dart: Add Dev Dependecy
```
dart pub add <package-name>
dart pub add <package-name> --dev
```
## Utilização do gerador de codigo(Injectable)
- Necessario importação do arquivo onde as dependencias serão aplicadas ```import 'nome_arquivo.config.dart';```
- Modelo padão para injeção das dependencias:
  - ```dart
      final getIt = GetIt.instance;  
    
      @InjectableInit(  
        initializerName: 'init', // default  
        preferRelativeImports: true, // default  
        asExtension: false, // default  
      )  
      void configureDependencies() => init(getIt);
    ```
## Instanciando o gerador de codigo
- Declarar a função dentro do main() para ser iniciada ao executar a apliação
  - ```dart
      void main() {
      configureDependencies();
      runApp(const MyApp());
      }
    ```
## Utilização CMD (build runner)
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

## Utilização classes (Factory, Singleton, LazySingleton)
- Classes do tipo Factory, são criadas novas instancias sempre que a mesma for chamada, nao iniciadas a partir da primeira chamada, anotação para geração de codigo é ```@injectable```
- Classes do tipo Singleton, é criada apenas uma instancia e a mesma é retornada sempre que há uma chamada, é iniciada junto com a aplicação, a anotação para para geração de codigo é ```@singleton```
- Classes do tipo LazySingleton, é criada apenas uma instancia e a mesma é retornada sempre que há uma chamada, é iniciada a partir da primeira chamada, a anotação para geração de codigo é ```@lazySingleton```
- Para todas as classes que contem anotações é necessario importação do pacote ```import 'package:injectable/injectable.dart';```


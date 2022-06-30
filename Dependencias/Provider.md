# Provider
>Provider é um pacote do dart usado para gerenciamento de estado, alocação e disposição de recursos, alem de redução de codigos desnecessarios<br>
Docs_PTBR: [Clique aqui](https://github.com/rrousselGit/provider/blob/master/resources/translations/pt_br/README.md)<br>
Modelo: [Clique Aqui](../Flutter/Principais/Provider_Modelo.md)
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    provider: ^6.0.2 #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:provider/provider.dart';
```
## Retorno da classe principal build
- Abaixo os widgets que devem ser retornados na classe principal dentro do arquivo main
  1. [Single Provider](./Provider.md#provider-unico-statelessflutterfundamentosmdtipos-basicos-widgets)
  2. [Multi Providers](./Provider.md#multiplos-providers-statefulflutterfundamentosmdtipos-basicos-widgets)
### Provider unico [stateless](../Flutter/Fundamentos.md#tipos-basicos-widgets)
- Para utilizar apenas um provider
```dart
Provider(
    create: (_) => Objeto();
    child: MaterialApp()
),
```
### Multiplos Providers [stateless](../Flutter/Fundamentos.md#tipos-basicos-widgets)
- Para utilizar mais de um provider sem atualização de widget
- Quando usado a lista de providers nao pode ser vazia!
- A lista de MultiProviders por padrao nao pode ser vazia
```dart
MultiProvider(
      providers: [
        Provider(),
        Provider(),
        ],
      child: MaterialApp()
```
### Multiplos Providers [stateful](../Flutter/Fundamentos.md#tipos-basicos-widgets)
- Para utilizar mais de um provider com atualização de widget
- Necessario retornar o [controlador](../Flutter/Principais/Provider_Modelo.md)
- Usado juntamente com [ChangeNotifier](../Flutter/Principais/Gerenciamento_estado_ChanceNotifier.md) que é o extensor do controlador
- A lista de MultiProviders por padrao nao pode ser vazia
```dart
MultiProvider(
      providers: [
        Provider(),
        Provider(),
        ChangeNotifierProvider(create: (_)=>ObjetoControlador()),
      child: MaterialApp()
```
### Metodos de utilização
- Atravez de variavel que recebe o Provider tipado, instanciando o context
  - ```dart
    // Metodo raiz, escuta alterações
    var nomeVariavel = Provider.of<Modelo>(context) 
    // Obtem os dados e nao escuta alterações
    var nomeVariavel = context.read<Modelo>() 
    // Obtem os dados e escuta alterações
    var nomeVariavel = context.watch<Modelo>();
    ```
- Chamada
  - ```dart
    nomeVariavel.instaciaDoModelo
    ```
- Atravez de variavel que recebe apenas o item desejado
  - ```dart
    var nomeVariavel = context.select<Modelo, TipoDoItemDesejado>((value) => value.instaciaDoModelo)
    ```
- Chamada
  - ```dart
    nomeVariavel
    ```
- Para alterar widgets especificos veja os metodos [2 e 3](../Flutter/Principais/Provider_Modelo.md)

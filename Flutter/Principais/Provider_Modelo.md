# Provider Models
- Guia inicial [aqui](../../Dependencias/Provider.md)
- Pacote responsável por:
    - alocação/disposição simplificada de recursos
    - lazy-loading
    - redução considerável de código desnecessário toda vez que se cria uma class
    - compatível com devtools
    - uma maneira comum de consumir [InheritedWidget's](./Inherited_widget.md)
    - maior escalabilidade para classes com um mecanismo de escuta que cresce exponencialmente em complexidade como [ChangeNotifier](./Gerenciamento_estado_ChanceNotifier.md), que é usado para notificação de valores alterados, assim quando houver uma mudança num texto por exemplo uma notificação é emitida para o flutter atualiza-lo.

    Para ler mais sobre o `provider`, veja a [documentação](https://pub.dev/documentation/provider/latest/provider/provider-library.html).

## Configuração main
- Dentro do arquivo de build inicial da tela, o retorno é um [provider](../../Dependencias/Provider.md) ou [multiprovider](../../Dependencias/Provider.md#multiplos-providers-statelessflutterfundamentosmdtipos-basicos-widgets)

## Utilização
***
- Uso para valores que nao precisam ser atualizados ([Stateless](../Fundamentos.md#tipos-basicos-widgets))
- Um objeto simples foi criado para receber os dados, *[UserModel](../ModelosDart/providerModels/user_model.md)*
- O widget [Provider](../../Dependencias/Provider.md#provider-unico-statelessflutterfundamentosmdtipos-basicos-widgets) que é composto por:
    - create: Recebe funcao anonima que retorna o objeto passando valores para seus atributos
        -   ```dart
            create: (_) {
                return UserModel(
                nome: 'Jb Silva',
                imgAvatar:
                    'https://avatars.githubusercontent.com/u/75276203?s=96&v=4',
                dataAniversario: '30/05/1991',
                );
            },
            ```
    - child: Recebe o [MaterialApp()](./MateralApp.md)
- Na pagina de exibição ao usuario, é definida uma variavel dentro do build que ira conter os valores dentro do provider
    -   ```dart
        var user = Provider.of<UserModel>(context);
        ```
    - Outra opção para passar na variavel é ``context.read<UserModel>();``
- Para invocar os atributos do objeto basta instanciar a variavel no item que deseja
    -   ```dart
        CircleAvatar(backgroundImage: NetworkImage(user.imgAvatar)),
        Text(user.nome),
        Text(user.dataAniversario)
        ```
***
- Uso para telas ([Statefull](../Fundamentos.md#tipos-basicos-widgets)) que precisam ter algum widget atualizado
- Um objeto foi criado para receber dados e ser controlador das atualizações, *[Controller](../ModelosDart/providerModels/provider_controller.md)* este objeto extente o [ChangeNotifier](Gerenciamento_estado_ChanceNotifier.md#chancenotifier)
    - Neste controlador os valores foram passados diretamente para fins didaticos, não é uma obrigação, poderiam ser nulos ou com construtor rececebdo assim os valores quando for invocado.
    - Tambem foi criado um metodo para alterar todos os valores do objeto e notificar aos ouvintes que os valores foram atualizados
    - Tambem foi criado um metodo para alterar somente um dos valores do objeto e notificar aos ouvintes que os valores foram atualizados.
- Na pagina de exibição uma pagina [Statefull](../Fundamentos.md#tipos-basicos-widgets) é criado um [initState](../Fundamentos.md#iniciando-carregamento-de-dados-na-tela) que ira carregar os dados ao concluir o carregamento da tela *(WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {})* e apos 2 segundos usando o [FutureDelay](../Widgets/WidgetsTree.md#duration) ira invocar a alteração dos dados.
- Para invocar os dados na tela temos 3 metodos
    1. Atualizar toda a tela similar ao que o [setState](./Gerenciamento_estado_setState.md) faz
        - Basta chamar o context do builder .watch passando seu tipo < Controlador >.item, isto ira recarregar toda a tela, todo objeto, widget
            -   ```dart
                 Text(' (${context.watch<ProviderController>().aniversario})'),
                 ```
    2. Atualizar somente o objeto em si, sem recarregar toda a pagina
        - Basta chamar o Consumer passando seu tipo < Controlador > que é composto por:
            - builder: Recebe funcao com 3 paramentros (_, controller, __) e em seu retorno recebe o widget que ira conter os valores atualizados
            -   ```dart
                Consumer<ProviderController>(builder: (_, controller, __) {
                return CircleAvatar(
                    backgroundImage: NetworkImage(controller.imgAvatar),
                );
                }),
                ```
    3. Atualizar somente o widget que tiver sido alterado
        - Basta chamar o Selector passando seu tipo < Controlador, TipoWidgetAtualizado > que é composto por:
            - selector: Recebe funcao com 2 paramentros (_, controller) e retorna o item do objeto que ira ser atualizado
            - builder: Recebe funcao com 3 paramentros (_, nome, __) e retorna o widget que ira ser atualizado
            - ```dart
                Selector<ProviderController, String>(
                  selector: (_, controller) => controller.nome,
                  builder: (_, nome, __) {
                  return Text(nome);
                }),
                ```
    4. Atualizar somente os widgets que foram alterados
        - Necessário package [tuple](../../Dependencias/Tuple.md)
        - Usado para buildar mais de um item da controller
        - Basta chamar o Selector passando seu tipo < Controlador Tupla2< TipoWidgetAtualizado1, TipoWidgetAtualizado1 > > que é composto por:
            - selector: Recebe funcao com 2 paramentros (_, controller) e retorna a Tupla passando os itens a serem atualizados
            - builder: Recebe funcao com 3 paramentros (_, dados, __) onde dados ira conter os itens passados no selector, retorna widget que ira conter os dados.item1, ou dados.item2
            - ```dart
                    Selector<ProviderController, Tuple2<String, String>>(
                        selector: (_, controller) => Tuple2(controller.instaciaDoModelo, controller.instaciaDoModelo),
                        builder: (_, dados, __) {
                          return Text(dados.item2); // OU Text(dados.item1);
                        }),
                ```
- mais em [doc](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html)


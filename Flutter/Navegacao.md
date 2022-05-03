# Navegação
---
## Comandos de nagevação
>push
- Navega para a pagina desejada sobreponto as paginas anteriores, mantendo assim uma sobre a outra como efeito de pilhagem, mantendo o estado, em caso de retornar a pagina (back) a ela estara do mesmo jeito que estava antes da navegação.
- Efetua navegação passando a pagina como retorno (o arquivo da pagina)
>pushAndRemoveUltil
- Navega para a pagina desejada e quando ja existe uma pilhagem de paginas ira remover de acordo com a condição passada
- Efetua navegação passando a pagina como retorno (o arquivo da pagina)
>pushReplacement
- Navega para a pagina desejada e substitui a anterior, caso clique em voltar a pagina anterior nao estara disponivel pois foi substituida quando fez a navegação
- Efetua navegação passando a pagina como retorno (o arquivo da pagina)
>pushNamed
- Navega para a pagina desejada sobreponto as paginas anteriores, mantendo assim uma sobre a outra como efeito de pilhagem, mantendo o estado, em caso de retornar a pagina (back) a ela estara do mesmo jeito que estava antes da navegação.
- Efetua navegação passando o nome da pagina determinado nos routers
>pushNamedAndRemoveUltil
- Navega para a pagina desejada e quando ja existe uma pilhagem de paginas ira remover de acordo com a condição passada
- Efetua navegação passando o nome da pagina determinado nos routers
>pushNamedReplacement
- Navega para a pagina desejada e substitui a anterior,caso clique em voltar a pagina anterior nao estara disponivel pois foi substituida quando fez a navegação
- Efetua navegação passando o nome da pagina determinado nos routers
>popUntil
-   Quando ja existe uma pilhagem de paginas ira remover, de acordo com a condição passada
>pop
-   Remove a pagina atual da pilha, caso nao haja mais paginas para remover, ira fechar o app
## Formas de navegação
***
### Navegação por Paginas
- Paginas
```dart
ElevatedButton(
    onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Page2()));
    },
```
- Nomes
```dart
ElevatedButton(
    onPressed: () {
        Navigator.of(context).pushNamed('/page2');
    },
```

#### Utilização
>push
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o push
    - O push recebe uma rota usando a funcao MaterialPageRoute que é composta por settings e builder
    - O settings recebe o RouterSettings() que é composto por name
    - O name ira receber uma string que representara o nome da pagina, este nome pode ser usado para chamar a pagina em um back por exemplo
    - O builder recebe uma funcao anonima que recebe context e retorna a pagina que ira navegar
    - Esta ação ira empilhar a pagina informada sobre a pagina atual
    ```dart
    Navigator.of(context).push(
        MaterialPageRoute(
            settings: const RouteSettings(name: 'page2'),
            builder: (context) => const Page2()));
    ```
>pushReplacement
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o pushReplacement
    - O pushReplacement recebe uma rota usando a funcao MaterialPageRoute que é composta por settings e builder
    - O settings recebe o RouterSettings() que é composto por name
    - O name ira receber uma string que representara o nome da pagina, este nome pode ser usado para chamar a pagina em um back por exemplo
    - O builder recebe uma funcao anonima que recebe context e retorna a pagina que ira navegar
    - Esta ação ira empilhar a pagina informada sobre a pagina atual
    ```dart
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            settings: const RouteSettings(name: 'page2'),
            builder: (context) => const Page2()));
    ```
>pushAndRemoveUltil
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o pushAndRemoveUntil
    - O pushAndRemoveUntil recebe uma rota usando a funcao MaterialPageRoute que é composta por settings e builder
    - O settings recebe o RouterSettings() que é composto por name
    - O name ira receber uma string que representara o nome da pagina, este nome pode ser usado para chamar a pagina em um back por exemplo
    - O builder recebe uma funcao anonima que recebe context e retorna a pagina que ira navegar
    - Como segundo parametro do pushAndRemoveUntil é passado o ModelRouter.withName
    - O ModelRouter.withName recebe o nome da pagina passado no settings
    - Esta ação ira navegar para a pagina informada no builder, removendo da pilha todas as paginas que esteja "por cima" da pagina informada no ModelRouter.withName
    - Para remover toda a pilhagem exceto a primeira pagina usar como segundo parametro (route) => route.isFirst
        -   Isto ira remover todas as paginas da pilha ate que fique somente a primeira
    - Para remover toda a pilhagem usar como segundo parametro (route) => false
        -   Isto ira remover todas as paginas da pilhaficando somente a que foi passanda no builder
    ```dart
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            settings: const RouteSettings(name: 'page1'),
            builder: (context) => const Page1()),
        ModalRoute.withName('page2'));
>pop
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o pop
    - Esta açao ira remover a pagina atual exibindo a anterior que esta por baixo na pilhagem
    ```dart
    Navigator.of(context).pop();
    ```
***
## Navegação por rotas
- Necessario configuração de routers no [MaterialApp](./Apoio_Widgets/MateralApp.md)
- O MaterialApp nao pode ser const
>pushNamed
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o pushNamed
    - pushNamed ira receber o nome da pagina (definido no [MaterialApp](./Apoio_Widgets/MateralApp.md))
```dart
Navigator.of(context).pushNamed('/page2');
```
>pushNamedAndRemoveUltil
- Dentro de onPressed ou similar de um botão passa-se a funcao Navigator.of
    - Navigator.of recebe um context e invoca o pushNamedAndRemoveUntil
    - O pushNamedAndRemoveUntil ira receber o nome da pagina (definido no [MaterialApp](./Apoio_Widgets/MateralApp.md))
    - Como segundo parametro do pushAndRemoveUntil é passado o ModelRouter.withName
    - O ModelRouter.withName recebe o nome da pagina passado no settings
    - Esta ação ira navegar para a pagina informada no builder, removendo da pilha todas as paginas que esteja "por cima" da pagina informada no ModelRouter.withName
    - Para remover toda a pilhagem exceto a primeira pagina usar como segundo parametro (route) => route.isFirst
        -   Isto ira remover todas as paginas da pilha ate que fique somente a primeira
    - Para remover toda a pilhagem usar como segundo parametro (route) => false
        -   Isto ira remover todas as paginas da pilhaficando somente a que foi passanda no builder
    ```dart
    Navigator.of(context).pushNamedAndRemoveUntil('/page1',ModalRoute.withName('/page2'));
    ```
---
# Navegaçao avançada
- Necessario fazer configuração de onGenerateRoute no [MaterialApp](./Apoio_Widgets/MateralApp.md)
- Dentro da função RouteSettings passa-se os condicionais:
    - Se o paran for igual a '/' retorna o MaterialPageRoute que é composta por settings e builder
    - O settings recebe o parametro da funcao que é param
    - O builder recebe uma funcao anonima que recebe context e retorna a pagina que ira navegar
    - Esta ação ira empilhar a pagina informada sobre a pagina atual
    -   ```dart
        onGenerateRoute: (RouteSettings param) {
                if (param.name == '/') {
                    return MaterialPageRoute(
                    settings: param,
                    builder: (context) => HomePage(),
                    );
                }
                if (settings.name == '/detalhe') {
                    return MaterialPageRoute(
                    settings: settings,
                    builder: (context) => DetalhePage(),
                    );}},
        ```
- Feita a configuração no [MaterialApp](./Apoio_Widgets/MateralApp.md) e passa das condicionais para navegação, o proceço para invocar a pagina é o mesmo da nevegação nomeada
    ```dart
    Navigator.of(context).pushNamed('/page2');
    ```
- Para obter dados nos parametros em ambos os modos de navegação seguir [Parametros de navegação](./Parametros_Navegacao.md)

# Navegação por [BottomNavigationBar](./Apoio_Widgets/WidgetGeral.md#bottomnavigationbar)
- Necessario pagina ser [Stateful](./Flutter_Topicos.md#tipos-basicos-widgets) pois há alteração de estado
- É definido dentro do [Scaffold](./Apoio_Widgets/Scaffold.md)
    -   ```dart
        bottomNavigationBar: BottomNavigationBar()
        ```
- Dentro do State< NomePage > definida uma variavel int que sera alterada conforme o clique na barra de navegação
    -   ```dart
        int indice = 0;
        ```
- Dentro do [BottomNavigationBar](./Apoio_Widgets/WidgetGeral.md#bottomnavigationbar) no seu currentIndex é passado a variavel definida (indice) em seu onTap é passado um setState para alterar o valor da variavel indice, passando seu novo a ser o index do icone clicado na barra
    -   ```dart
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (index) {
          setState(() {
            indice = index;
          });
        },
        ```
- No body do [Scaffold](./Apoio_Widgets/Scaffold.md) foi passado um  [IndexedStack](./Apoio_Widgets/WidgetGeral.md#indexedstack) que em seu index foi recebido o valor do indice, ou seja, quando um icone for clicado o index mudara, alterando assim o item da lista que sera exibido.
- Ainda no [IndexedStack](./Apoio_Widgets/WidgetGeral.md#indexedstack), em seu children foi passado duas paginas, estas paginas sao alternadas de acordo com o valor do index.
    -   ```dart
        body: IndexedStack(
            index: indice,
            children: [
            Page1(),
            Page2(),
            ],
        ),
        ```
# Parametros de navegação
## Obtendo parametros de uma pagina em outra
- Os parametros sao passados tag arguments e podem ser de qualquer tipo
>push
- Passando o valor 10 como id na tag arguments que é uma composição do RouterSettings(), Mais detalhes de navegação [aqui](./Navegacao.md).
```dart
 Navigator.of(context).push(
    MaterialPageRoute(
        settings: RouteSettings(
        name: 'detalhe',
        arguments: {'id': 10},
        ),
        builder: (context) => Detalhe(),
    ),
    );
```
- No exemplo como estou passando um map no arguments, é necessario efetuar a tipagemdo valor passado nos arguments onde os dados serão recebidos
- Metodo 1:
    - Dentro do Build da pagina que ira receber o parametro
    - Definir uma variavel que ira receber o ModelRoute.of
    - Este ModalRouter.of ira receber um context que pode ser nulo?
    - Este context instancia o settings.arguments e declara como Map<String, dynamic>? que tambem podem ser nulos
    -   ```dart
        final param =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        ```
    - Para exibir o conteudo basta efetuar a chamada da variavel passando a chave do mapa, como é algo que pode ser nulo usa-se o null safety, e caso o valor serja nulo assume o valor de 0
    -   ```dart
        Text('${param?['id'] ?? 0}')
        ```
***
-   Metodo 2:
-   OBS: considerando que o valor passado nos arguments é um numero inteiro e nao mais um Map *arguments: 10*
    -   Dentro do initial state *(classe privada principal da pagina _NomeDaPagina)*
    -   Definida uma variavel do tipo int? pois pode ser nula
    -   Criado um @override initState(){} que estara sobrepondo a ele mesmo com super.initState();
    -   Dentro do initState foi usado o [WidgetBinding](../Fundamentos.md#iniciando-carregamento-de-dados-na-tela) explicado no top de carregamento de dados na tela
    -   Dentro do WidgetBingind criada uma variavel que ira receber o ModelRoute.of
    -   Este ModalRouter.of ira receber um context que pode ser nulo?
    -   Ainda dentro do WidgetBingind usa-se o setState para passar o valor do argumento para a variavel definda anteriormente *(int? id)*.
    -   Este context instancia o settings.arguments e declara como int? que tambem pode ser nulo
    -   ```dart
        class _ArgumentsState extends State<Arguments> {
        int? id;

        @override
        void initState() {
            super.initState();
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            final param =
                ModalRoute.of(context)?.settings.arguments as int?;
            setState(() {
                id = param ?? 0;
            });
            });}
        ```
    - Para exibir o conteudo basta passar o valor da variavel do parametro para a declarada anteriormente *(int? id)*, e caso o valor serja nulo assume o valor de 0
    -   ```dart
        Text('$id')
        ```
***
-   Metodo 3:
- Passando paramentros de uma pagina para outra com contrutor
- Page exemplo:
    - Recebe em seu contrutor um nome que deve ser informado ao chamar a pagina
    - Este nome neste exemplo é exibido no titulo da pagina
```dart
import 'package:flutter/material.dart';

class Navegacao extends StatelessWidget {
  String name;
  Navegacao({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(),
    );
  }
}
```

- Passa o *Nome da pagina* durante a navegação

```dart
ElevatedButton(
    onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: ((context) => Navegacao(name: 'Rota Construtor)))),
    child: const Text('Navegação'),
    ),
```
>pushNamed
- Metodo 1:
- Passando o valor 10 como id na tag arguments, Mais detalhes de navegação [aqui](./Navegacao.md).
```dart
Navigator.of(context).pushNamed('/detalhe', arguments: {'id': 15});
```
- No exemplo como estou passando um map no arguments, é necessario efetuar a tipagem do valor passado nos arguments onde os dados serão recebidos.
- A Recuperação do valor é realizada das mesmas formas mostradas acima
## Retornando argumentos entre paginas (go/back)
- Metodo 1:
- Estrategia usada pra execultar alguma ação quando o usuario voltar da pagina navegada
- No mesmo pressed de um botao ou similar, usa-se o [Async/Await](../../Dart/Dart_OO/Async.md)
- Ao clicar no botao a função ira navegar para pagina indicada, porem a mesma ficara aguardando um retorno para execultar alguma outra ação
```dart
// Pagina origem
onPressed: () async {
    print('Essa mensagem quando navega para pagina indicada');
    final retorno = await Navigator.of(context).pushNamed('/pagina');
    print('Esta mensagem quando retorna da pagina indicada');
    print('Retorno da pagina foi $retorno');
    await Navigator.of(context).pushNamed('/outraPagina');
    },
```
```dart
// Pagina destino
onPressed: () {
    Navigator.of(context).pop('Voltei');},
```
- Metodo 2:
- Usando o .then() para obter o valor de retorno de uma navegação
- Quando o usuario clicar para voltar (pop) o argumento passado nele entra no ```valor_Do_Pop_Na_Page_Destino``` o que por sua vez executa um print do mesmo

```dart
// Pagina origem
 ElevatedButton(
    onPressed: () => Navigator.pushNamed(context, '/navegacao', arguments: 'Rota Nomeada')
    .then((valor_Do_Pop_Na_Page_Destino) => print(valor_Do_Pop_Na_Page_Destino)),
    child: const Text('Navegação Nomeda'),
    ),
```
```dart
// Pagina destino
ElevatedButton(
    onPressed: () => Navigator.pop(context, 'Voltei'),
    child: Text('Voltar'),
),
```
-   Printa uma msg
    -   Navega para pagina indicada
-   Aguarda retorno
-   Printa outra msg
-   Printa o retorno da pagina feito no pop do pressed *(Voltei)*
    -   Navega para outra pagina
***
- Metodo 2:
- Passando paramentros de uma pagina a outra por argumentos
- Page exemplo:
    - Apos o context criada uma variavel que recebe um ModalRoute onde ira obter o argumento passado
    - O argumento recebido é do tipo ```Object?``` ou seja pode ser qualquer coisa e opcional
    - No ModalRoute caso seja certo que o argumento vira usar ["!"](../../Dart/Fundamentos.md#null-safety) apos o context e o cast *as String* por exemplo informado o tipo de argumento recebido.
    - Caso o argumento seja opcional usar ["?"](../../Dart/Fundamentos.md#null-safety) apos o context e um [Null where operator](../../Dart/Fundamentos.md#null-safety) indicando o valor da variavel caso seja nula.
    - Ao usar o argumento passado, caso seja em valor opcionar usar o cast *as String* por exemplo, caso seja um valor certamente nao vazio/nulo basta informar a variavel pois o cast *as Tipo* ja foi informado na variavel.

```dart
class Navegacao extends StatelessWidget {
  Navegacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments ?? 'Nao informado';
    return Scaffold(
      appBar: AppBar(
        title: Text(args as String),
      ),
      body: Container(),
    );
  }
}
```
- Passando argumento e rota nomeada
```dart
 ElevatedButton(
    onPressed: () => Navigator.pushNamed(context, '/navegacao', arguments: 'Rota Nomeada'),
    child: const Text('Navegação Nomeda'),
    ),
```
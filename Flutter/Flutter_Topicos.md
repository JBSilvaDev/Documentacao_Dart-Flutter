# Flutter
- Fundamentos (Acesse [Fundamentos DART](../Dart/Fundamentos.md) )
- Resumo: [Clique Aqui](../Flutter/Resumo.md)
## Widgets
-   [MaterialApp](./Apoio_Widgets/MateralApp.md)
-   [HomePage](./Apoio_Widgets/HomePage.md)
-   [Scaffold](./Apoio_Widgets/Scaffold.md)
-   [AppBar](./Apoio_Widgets/AppBar.md)
-   [Drawers](./Apoio_Widgets/Drawers.md)
-   [Demais Widgets de composição](./Apoio_Widgets/WidgetGeral.md)
-   [Arvores de Widgets](./Apoio_Widgets/WidgetsTree.md)
## Configuração de inicialização do app
>Verificar .yaml para utilizar:
- Assets (Imagens, arquivos)
    -   [Imagem](./img/imagem.png) adicona a pasta assets tag assets do .yaml para acessar todos, ou adiciona um a um com seu caminho relativo completo (assets/) ou (/assets/image.jpg)
    - [Fonts](./img/fonts.png), adicona a pasta assets tag fonts do .yaml, na tag deve informar a famila da fonte, e na sua identação o caminho asset onde foi instalada (compativel com formatos .ttf e .otf)
- Dependencias (Pacotes terceiros) [Pub.Dev](https://pub.dev)
## Iniciando projeto flutter
-   runApp()
    - Fica dentro do main()
    - É a funcao principal do flutter, ela é reponsavel por inicar a aplicação
    - Recebe como paramentro uma classe
-   Em Flutter tudo é um widget, acesse o [catalogo aqui](https://docs.flutter.dev/development/ui/widgets)
## Tipos basicos widgets
- StatelessWidget
    - É uma extenção de classes -> *class Nome extends StatelessWidget*
    -   Obrigatório criar o metodo biuld
        ```dart
        @override
        Widget build(BuildContext context) {
            return WidgetQueDesejaRetornar();
        }
        ```
    - É um componente estatico, nao sofre alterações de estado
    - Aceita variaveis em seu corpo
    - Ciclo de vida StatelessWidget:
        -   Construor
        -   Build
        -   
- StatefulWidget
    - É uma extenção de classes -> *class Nome extends StatefuWidget*
    - Dentro desta classe é obrigatório criar metodo createState
        -   ```dart
            @override
            State<StatefulWidget> createState() {
                return _ClassCriadaPrivada();
            }
            ```
    - É um componente que pode sofrer alterações de estado
    - Uma nova classe criada como privada, esta classe ira extender State passando a class que extente o StatefulWidget como tipo
        -   ```dart
            class _ClassCriadaPrivada extends State<Nome> {}
            ```
        -   Aceita variaveis em seu corpo
        -   Dentro desta classe é obrigatorio o metodo biuld
            -   ```dart
                @override
                Widget build(BuildContext context) {
                    return WidgetQueDesejaRetornar();
                }
                ```
        -   Ciclo de vida StatefulWidget
            - Construtor
            - CreateState
                -   State<StatefulWidget> 
                -   Construtor
                -   InitState
                -   DidChangeDependecies
                -   Build
            -   SetState
                -   Build
    ## Iniciando carregamento de dados na tela
    - initState(){}
        -  É um metódo que é chamado sempre que o aplicativo é inicado
        -  Dentro deste metodo nao pode ser invocada outra funcao ou navegação pois ira provocar um erro devido a pagina nao esta completamente carregada.
        -  Para fazer o processo aguardar conclusao do builder usar-se o WidgetBinding/addPostFrameCallback
            ```dart
                WidgetBinding.instance?.addPostFrameCallback((timeStamp){'O que deseja fazer apos pagina completar carregamento}
            ```
    
    



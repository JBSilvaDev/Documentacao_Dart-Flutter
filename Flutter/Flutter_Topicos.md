# Flutter
- Fundamentos (Acesse [Fundamentos DART](../Dart/Fundamentos.md) )
- Resumo: [Clique Aqui](../Flutter/Resumo.md)
## Configuração de inicialização do app
>Verificar .yaml para utilizar:
- Assets (Imagens, Fontes)
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
    
    



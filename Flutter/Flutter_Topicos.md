# Flutter
- Fundamentos (Acesse [Fundamentos DART](../Dart/Fundamentos.md) )
- Resumo: [Clique Aqui](../Flutter/Resumo.md)
## Configuração de inicialização do app
>Desabilitar backup automatico ANDROID
-   Dentro da pasta Android no aplicativo navegue para:
    -   app -> src -> main -> AndroidManifest.xml
-   Na tag <application incluir linhas com:
    -   android:allowBackup="false"
    -   android:fullBackupOnly="false"
>Verificar .yaml para utilizar:
- Assets (Imagens, arquivos)
    -   [Imagem](./img/imagem.png) adicona a pasta assets tag assets do .yaml para acessar todos, ou adiciona um a um com seu caminho relativo completo (assets/) ou (/assets/image.jpg)
    - [Fonts](./img/fonts.png), adicona a pasta assets tag fonts do .yaml, na tag deve informar a famila da fonte, e na sua identação o caminho asset onde foi instalada (compativel com formatos .ttf e .otf)
        -   Tambem é possivel efetuar a instação do pacote [google fonts](https://pub.dev/packages/google_fonts)
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
    -   Obrigatório criar o metodo biuld context
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
        -   [Build](./Flutter_Topicos.md#buildcontext)
- StatefulWidget
    - É uma extenção de classes -> *class Nome extends StatefuWidget*
    - Dentro desta classe é obrigatório criar metodo createState
        -   ```dart
            @override
            State<StatefulWidget> createState() {
                return _ClassCriadaPrivada();
            }
            ```
        - OU
        -   ```dart
            @override
            _NomeDaClasse createState() => _NomeDaClasseState();
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
                -   State< StatefulWidget > 
                -   Construtor
                -   InitState
                -   DidChangeDependecies
                -   [Build](./Flutter_Topicos.md#buildcontext)
            -   SetState
                -   Build
## Iniciando carregamento de dados na tela
- initState(){}
    -  É um metódo que é chamado sempre que o aplicativo é inicado
    -  Dentro deste metodo nao pode ser invocada outra funcao ou navegação pois ira provocar um erro devido a pagina nao esta completamente carregada.
    -  Para fazer o processo aguardar conclusao do builder usar-se o WidgetsBinding/addPostFrameCallback
        ```dart
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp){'O que deseja fazer apos pagina completar carregamento}
        ```
## BuildContext
- É uma classe utilitaria dentro do flutter onde esta registrado TODOS os widgets de nossa estrutura
- Todo widget recebe em seu construtor o build context, pois seu conteudo precisa ser registrado na arvore de componentes
- Serve para encontrar/passar informações
- Quando passamos o context do build para uma classe, estamos passando todas informações da nossa aplicação, para a classe buscar nela o que ela foi programada para buscar.
- Usando o [MediaQuery](MediaQuery.md#utilização) como exemplo:
    -   ```dart
        MediaQuery.of(context)
        ```
    - Neste caso estamos solicitando que a classe procure dentro do builder informações sobre a tela do dispositivo
- Usando o [Navigator](Navegacao.md#utilização) como exemplo:
    -   ```dart
        Navigator.of(context).pushNamed('/page2');
        ```
    -   Neste caso estamos passando as informações armazenadas no builder pai (main) tudo que foi criado e definido no app foi armazenado no context do builder, entao quando chamamos o navigator estamos passando todas informações para a classe e solicitando que faça a negevação para uma das paginas definidas anteriormente.

    
    



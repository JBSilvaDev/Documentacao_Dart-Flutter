# Flutter

- Fundamentos (Acesse [Fundamentos DART](../Dart/Fundamentos.md))

## Configuração de inicialização do app

> Desabilitar backup automático no Android

- Navegue até a pasta "Android" do seu aplicativo e vá para:
  - app -> src -> main -> AndroidManifest.xml
- Na tag `<application>`, adicione as seguintes linhas:
  - `android:allowBackup="false"`
  - `android:fullBackupOnly="false"`

> Permitir que o emulador acesse sites "não seguros"

- Navegue até a pasta "Android" do seu aplicativo e vá para:
  - app -> src -> debug -> AndroidManifest.xml

- Na tag `<manifest xmlns:android...>`, adicione o seguinte código:
  ```
  <application android:usesCleartextTraffic="true">
  <!-- outros elementos -->
  </application>
  ```

- Navegue até a pasta "Android" do seu aplicativo e vá para:
  - app -> src -> main -> AndroidManifest.xml
- Na tag `<application>`, adicione a seguinte linha:
  - `android:usesCleartextTraffic="true"`

> Verificar o arquivo .yaml para utilizar:

- Assets (imagens, arquivos)
  - Adicione a pasta "assets" à tag "assets" do arquivo .yaml para acessar todos os arquivos, ou adicione individualmente com o caminho relativo completo (assets/) ou (/assets/image.jpg).
  - Exemplo: `assets: assets/`
  - Adicione a pasta "fonts" à tag "fonts" do arquivo .yaml. Na identação, informe a família da fonte e o caminho do arquivo asset onde ela está instalada (compatível com formatos .ttf e .otf).
    - Também é possível instalar o pacote [google_fonts](https://pub.dev/packages/google_fonts).
    - Exemplo: 
      ```yaml
      fonts:
        - family: nome_da_fonte
        fonts:
          - asset: caminho/para/a/fonte.ttf
      ```
- Dependências (pacotes de terceiros) [Pub.Dev](https://pub.dev)

## Tipos básicos de widgets

- StatelessWidget
  - É uma extensão de classes: `class Nome extends StatelessWidget`
  - É obrigatório criar o método `build(context)`
    ```dart
    @override
    Widget build(BuildContext context) {
        return WidgetQueDesejaRetornar(); // Normalmente um Material() ou Scaffold()
    }
    ```
  - É um componente estático e não sofre alterações de estado
  - Aceita variáveis em seu corpo
  - Ciclo de vida do StatelessWidget:
    - Construtor
    - Build
- StatefulWidget
  - É uma extensão de classes: `class Nome extends StatefulWidget`
  - Dentro dessa classe, é obrigatório criar o método `createState()`
    ```dart
    @override
    State<StatefulWidget> createState() {
        return _ClassCriadaPrivada();
    }
    ```
    - OU
    ```dart
    @override
    _NomeDaClasse createState() => _NomeDaClasseState();
    ```
  - É um componente que pode sofrer alterações de estado
  - Uma nova classe privada deve ser criada, estendendo State e passando a classe que estende StatefulWidget como tipo
    ```dart
    class _ClassCriadaPrivada extendsState<Nome> {}
    ```
    - Aceita variáveis em seu corpo
    - Dentro dessa classe, é obrigatório o método `build(context)`
    ```dart
    @override
    Widget build(BuildContext context) {
        return WidgetQueDesejaRetornar();
    }
    ```
  - Ciclo de vida do StatefulWidget:
    - Construtor
    - CreateState
      - State `<StatefulWidget>`
      - Construtor
      - InitState
      - DidChangeDependencies
      - Build
    - SetState
      - Build

## Iniciando o carregamento de dados na tela

- `initState()`
  - É um método chamado sempre que o aplicativo é iniciado
  - Dentro deste método, não é possível chamar outras funções ou navegar, pois a página ainda não foi completamente carregada.
  - Para fazer um processo aguardar a conclusão do `build`, utilize `WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { // O que deseja fazer após a página ser completamente carregada })`

## Iniciando o descarregamento de dados na tela

- `dispose()`
  - É um método chamado sempre que o aplicativo é fechado
  - Dentro deste método, coloque as funções que foram chamadas no `initState()` para encerrá-las ao fechar o aplicativo, poupando o uso de memória nos dispositivos
  - Exemplo:
    ```dart
    @override
    void dispose() {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            // O que deseja fazer ao fechar a página
        });
    }
    ```
# Versionamento Local
- Este tipo de instalação é usada para definir uma versão especifica do flutter para cada projeto sem interfirir na instalação padrao

## VSCode
-   https://code.visualstudio.com/
    - Baixar e instalar
## Android Studio
-   https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds
    - Baixar e instalar
    - Abrir e baixar complementos necessários
## Xcode
-   https://apps.apple.com/us/app/xcode/id497799835?mt=12
    - Abrir e baixar complementos necessários

# Instalações
## SdkMan
-   Instalação sdkman
    ```
    curl -s "https://get.sdkman.io" | bash
    ```
    ```
    source "/Users/jbsilva/.sdkman/bin/sdkman-init.sh"
    ```
-   Instalação java
    ```   
    sdk list java
    ```
    -   Verifica versões do java disponiveis localizar a versao desejada do java e copiar o *Identifier* da versão
        - Pressione *Q* para sair da lista
    - Instala a versão selecionada pelo ID :(jdk8: 8.0.372-amzn | jdk11: 11.0.19-amzn)
        ```
        sdk install java <id da versao copiada>
        ```
    -   Para alternar entre versoes use:
        ```
        sdk use java <id da versao>
        ```

- Em caso de erro no `compaudit` usar comando:
  - Para ver as pastas que apresentam erro (se nao aparecer nada não ha problemas)
    ```
    compaudit
    ```
    ```
    compaudit | xargs sudo chown -R "$(whoami)
    ```
    OU 
    ```
    sudo compaudit | xargs chown -R "$(whoami)"
    ```
> Considere criar funcoes para o powershell [aqui](./shel_configs.md)

## HomeBrew
-   Instalação Homebrew
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
- Apos instalação executar comandos
    ```
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/UserFolder/.zprofile
    ```
    ```
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ```
## Zsh
-   Instalar zsh
    ```
    brew install zsh
    ```
## Git
-   Instalar Git
    ```
    brew install git
    ```
    ```
    git config --global --add safe.directory '*'
    ```
    ```
    git config --global user.name "Seu Nome"
    ```
    ```
    git config --global user.email email@example.com
    ```


## Android Studio (Configuração)
>SDK
- Va em configurações selecione *SDK Manager*
    - Selecione a *ultima versao do Android*
- SDK Tools
    - Selecione *Android SDK Command-line Tools*
    - Selecione *Android SDK Build-Tools*
>Plugins
- Va para plugins
    - Instale o *Plugin Flutter*
    - Instale o *Plugin Dart*
>Emulador
- Selecione *Virtual Device Manager*
    - Crie um novo device ou configure um ja existente
- Salvar endereço do *Android SDK Location* para variavel de ambiente 
    ```ps
    export ANDROID_HOME=<Android SDK Location>/sdk
    export ANDROID_SDK_ROOT=<Android SDK Location>/sdk
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    ```
## Dart SDK
-   Instalar dart sdk
    ```
    brew install dart
    ```
## FVM
-   Instalar fvm
    ```
    dart pub global activate fvm
    ```
    ```
    fvm --version
    ```
    ```
    fvm config --cache-path /Users/jbsilva/Dev/flutter-fvm
    ```
    ```
    fvm install <versao>
    ```
    ```
    fvm global <versao>
    ```
    -   Salvar endereço do *Caminho exibido apos instalação* para variavel de ambiente
    ```ps
    export PATH=$PATH:"<Caminho exibido apos instalação>"
    ```
    ```
    flutter doctor
    ```
## Xcode (Configuração)
- Executar comando no terminal
    ```
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
    ```
- Abrir Xcode
  - Fazer login no XCode e configurar o ***TEAM*** adicionando a conta iCloud
  - Selecionar um emulador de iPhone na lista e clicar *Runner* para executa-lo.
## Visual Studio Code
>Plugins
- Baixar *Plugin flutter*
- Baixar *Plugin dart*


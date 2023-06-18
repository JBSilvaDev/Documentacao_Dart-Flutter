
# Downloads

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

# Instalações JDK's
## SdkMan
-   Instalação sdkman
    - `curl -s "https://get.sdkman.io" | bash`
    - `source "/Users/jbsilva/.sdkman/bin/sdkman-init.sh"`
-   Instalação java
    -   `sdk list java`
        -   Verifica versões do java disponiveis
        localizar a versao desejada do java e copiar o *Identifier* da versão
            - Pressione *Q* para sair da lista
    -   `sdk install java <id da versao copiada>`
        - Instala a versão selecionada pelo ID :(jdk8: 8.0.372-amzn | jdk11: 11.0.19-amzn)
    -   Para alternar entre versoes use:
        - `sdk use java <id da versao>`
- Em caso de erro no `compaudit` usar comando:
    -   `compaudit`: para ver as pastas que apresentam erro (se nao aparecer nada não ha problemas)
    -   `sudo compaudit | xargs chown -R "$(whoami)"` OU `compaudit | xargs sudo chown -R "$(whoami)`" : para resolver
- Criando atalhos para alterar versoes do jdk
    - veja shell-Configs

instalar xcode
instalar homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
instalar zsh
    brew install zsh
instalar git
    brew install git
instalar vsCode
instalar android studio
    configurar...
        export ANDROID_HOME=/Users/jbsilva/Library/Android/sdk
        export ANDROID_SDK_ROOT=/Users/jbsilva/Library/Android/sdk
        export PATH=$PATH:$ANDROID_HOME/tools
        export PATH=$PATH:$ANDROID_HOME/platform-tools
instlar dart sdk
    brew install dart

Instalar fvm
    dart pub global activate fvm
    fvm --version
    fvm config --cache-path /Users/jbsilva/Dev/flutter-fvm
    fvm install <versao>
    fvm global <versao>
        setar variavel de ambiente como caminho apontado apos instalacao
        export PATH=$PATH:"/Users/jbsilva/fvm/default/bin"
    rodar flutter doctor


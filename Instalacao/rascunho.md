instalar sdkman
    curl -s "https://get.sdkman.io" | bash
    source "/Users/jbsilva/.sdkman/bin/sdkman-init.sh"
    rodar sdk list java
        para verificar versoes do java disponiveis
        localizar a versao desejada do java e copiar o Identifier dela
        pressione Q para sair da lista
    execute sdk install java <id da versao copiada> (jdk8: 8.0.372-amzn | jdk11: 11.0.19-amzn)
    ao instalar a segunda versao o sdk ira perguntar se deseja setar essa nova versao como padrao
    para alternar entre versoes usa sdk use java <id da versao>
         em caso de erro no compaudit usar comando
            compaudit - para ver as pastas que apresentam erro (se nao aparecer nada nao ha problemas)
            sudo compaudit | xargs chown -R "$(whoami)" OU compaudit | xargs sudo chown -R "$(whoami)" - para resolver
criando atalho para alterar versoes do jdk
     abrir arquivo .zshrc incluir alias, assim digitando somente o nome do jdk ira realizar a troca das versoes
        alias jdk11="sdk use java 11.0.19-amzn"
        alias jdk8="sdk use java 8.0.372-amzn"

instalar xcode
instalar homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
    

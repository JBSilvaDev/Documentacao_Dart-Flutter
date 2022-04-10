# Instalar Android Studio
# Baixar o zip no site
    - https://docs.flutter.dev/get-started/install/windows
# Extrair o zip no local desejado
# Atualizar o Path com variaveis de sistema
    - Abrir o .bat na pasta bin
    - Pesquisa variaveis de sistema no menu iniciar
        - Ir em variaveis de ambiente
        - Editar a variavel Path (Caso nao tenha deve-se cria-la)
            - Clicar em novo, e informar o caminho da pasta bin
            - Ok, OK
# Configuração Flutter
>Variaveis de ambiente
- Crie uma nova variavel de ambiente com nome _FLUTTER_HOME_
    - De o caminho no valor da variavel do local onde foi instalado o arquivo baixado *E:\Flutter\flutter*
- Dentro da variavel de ambiente *Path* adicione um novo caminho *%FLUTTER_HOME%\bin*
# Configuração Android Studio
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
>Variaveis de ambiente
- Crie uma nova variavel de ambiente com nome *ANDROID_HOME*
    - Va em configurações selecione *SDK Manager*
    - Copie o caminho da instacação do SDK *C:\Users\usuarioNome\AppData\Local\Android\Sdk*
    - Cole o caminho do SDK copiado no valor da variavel
- Dentro da variavel de ambiente *Path* adicione um novo caminho *%ANDROID_HOME%\tools\bin*
- Ainda na variavel de ambiente *Path* adicione outro caminho *%ANDROID_HOME%\platform-tools*
- No CMD rodar comando *adb --version* se mostrar a versao do adb a configuração foi concluida.
>Rodar *flutter doctor*
# Instalar VSCode
    - Baixar Visual Studio Community
    - Avançar e marcar a opção desenvolvimento para desktop c++
# Configuração Visual Studio Code
>Plugins
- Baixar *Plugin flutter*
- Baixar *Plugin dart*
>Rodar *flutter doctor*
# Verificar se instalação esta OK
    - Abra CMD fora da pasta bin e digite flutter
    - Rodar flutter doctor
    - Verificar erros caso tenha algum
        - Para corrigir erro: "cmdline-tools component is missing"
            - Abra android studio
            - Configure / SDK Manager / SDK Tools
                - Selecione opcao Android SDK Command-line Tools
                - OK, aguardar baixar e instalar
        - Para corrigir erro: "Android toolchain - develop for Android devices" (Licenses)
            - Execultar comando: flutter doctor --android-licenses
            - Aceitar todas as licensas (Y)
    - Rodar comando: flutter doctor -v
        - Tudo verde, basta seguir
# Habilitar IDE VSCode
- Abra VSCode:
    - Vá em: View / Command palette
        - Flutter: Run Flutter Doctor
        - Navegar ate pasta bin onde instalou flutter ou seguir mesmos passos para atualizar Path, porem usando caminho ate a pasta flutter uma antes da bin

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
# Instalar plugins no Android Studio
- Abra android studio
    - Configure / Plugins
        - Flutter plugin / Install
        - Reiniciar Android Studio
# Habilitar IDE VSCode
- No VSCode
    - Baixar plugin: Flutter
    - View / Command palette
        - Flutter: Run Flutter Doctor
        - Navegar ate pasta bin onde instalou flutter ou seguir mesmos passos para atualizar Path, porem usando caminho ate a pasta flutter uma antes da bin
# Instalar Android Studio
    - Configurar SDK maneger
        - Selecionar a ultima versao do Android em SDK platform
        - Selecionar Android SDK comand line tools e Android SDK Biuld tools em SDK Tools
    - Instalar plugins do flutter
        - Instalar plugin do Flutter e Dart
    - Configurar variaveis de ambiente do SDK
        - Em SDK maneger, va em Android SDK.
        - Copie o link do SDK Location
        - Em variaveis de ambiente cria uma nova com nome de ANDROID_HOME, com link copiado do SDK
        - Adiconar duas variaveis ao Path
            - %ANDROID_HOME%\tools\bin
            - %ANDROID_HOME%\platform-tools
    - Repetir flutter doctor para verificar pendencias
# Instalar VSCode
    - Baixar Visual Studio Community
    - Avançar e marcar a opção desenvolvimento para desktop c++
# Configurar emulador
    - No Android Studio ir em:
        - Configure, Virtual devices manager, Create new device.
    


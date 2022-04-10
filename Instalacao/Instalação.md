# Instalar Android Studio
    - https://developer.android.com/studio
# Instalar VSCode
    - https://code.visualstudio.com/download
# Instalar Visual Studio Community
    - https://visualstudio.microsoft.com/pt-br/vs/community/
    - Avançar e marcar a opção desenvolvimento para desktop c++
# Baixar o zip no site
    - https://docs.flutter.dev/get-started/install/windows
    - Extrair o zip no local desejado
> Via CMD
1. Instalar o chocolatey
	> https://chocolatey.org/install
	> Abrir powersell como adm
	> Colar codigo:
		Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
		Ou outro disponibilizado no site
2. Instalar o Git
	> choco install git
3. Instalar o Java
	> choco install jdk8
4. Instalar flutter
	> via git
		. Navegar ate a pasta onde quer instalar
		. Criar uma nova pasta no local com: mkdir NomeDaPasta
		. Navegar ate a pasta criada
		. Colar comando git: git clone https://github.com/flutter/flutter.git -b stable
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
# Iniciando novo projeto
> Via CMD
- flutter create --project-name=flutter_primeiros_passos --org br.com.jbtec --platforms android,ios -a kotlin -i swift ./flutter_primeiros_passos

> Via VSCode
- Ctrl+Shift+P (View - Command Palette)
    - Flutter: New Project.
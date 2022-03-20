# Download
>Baixe o arquivo zip do flutter<br>
- [Site Official](https://docs.flutter.dev/get-started/install/windows)<br>
- Git Clone > *git clone https://github.com/flutter/flutter.git -b stable*
>Baixar Android Studio
- [Site Official](https://developer.android.com/studio)
>Baixar Visual Studio Code
- [Site Official](https://visualstudio.microsoft.com/pt-br/downloads/)

# Configuração Flutter
>Variaveis de ambiente
- Crie uma nova variavel de ambiente com nome _FLUTTER_HOME_
    - De o caminho no valor da variavel do local onde foi instalado o arquivo baixado *E:\Flutter\flutter*
- Dentro da variavel de ambiente *Path* adicione um novo caminho *%FLUTTER_HOME%\bin*
- Rodar comando *flutter doctor* no cmd e verificar se há pendências
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
- Va em configurações selecione *SDK Manager*
    - Copie o caminho da instacação do SDK *C:\Users\usuarioNome\AppData\Local\Android\Sdk*
- Crie uma nova variavel com nome *ANDROID_HOME*
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

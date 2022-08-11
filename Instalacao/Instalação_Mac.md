- Download VSCode - https://code.visualstudio.com/ 
    - Instalar plugins
- Download Android Studio - https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds
    - Baixar pugins
    - Baixar SDKs
    - Baixar Tools (Android DSK Command-line Tools)
    - Configurar Emulador

- Download xCode no App Sore


# Abrir Terminal
- Configurar curl
    - ```/usr/bin/curl```
        - retorno deve ser - ```curl: try 'curl --help' or 'curl --manual' for more information```
    - ```export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"```
- Instalar HomeBrew
    - ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"```
        - ```echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jbsilva/.zprofile```
        - ```eval "$(/opt/homebrew/bin/brew shellenv)"```
# Instalar flutter
-   brew install flutter
    - Anotar caminho da instalacao (/opt/homebrew/bin/flutter)
-  brew install cocoapods
- flutter doctor --android-licenses
- brew install android-platform-tools ( https://stackoverflow.com/questions/31374085/installing-adb-on-macos )
- rodar flutter doctor e resolver pendencias


# VSCode
- Baixar pugins
- Caso seja necessario localizar o SDK usar o caminho salvo na instalacao do brew
# Emuladores
## xcode virtual
- ```sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer```
- ```sudo xcodebuild -runFirstLaunch```
- Abrir a pasta ios de um projeto no xcode
- Fazer login no xcode e configurar o TEAM adicionando a conta 
- Abrir emulador pela primeira vez e testar o projeto aberto
- com emulador aberto abra o vsCode e veja se o mesmo aparece na lista de dispositivos, rode o projeto teste.
## device fisico 
- Conectar cabo usb ao mac, no iphone clicar em confiar
- selecionar o iphone fisico no xcode 
- executar o projeto e permitir sempre a execucao
- No iphone cancele a msg que aparecer na tela
- Ir em configuracaoes - geral - gerenciamento de VPN e dispositivos
    - Autorizar o apple development
- Voltar ao xcode, e executar o bunner novamente
- com iphone conectado abra o vsCode e veja se o mesmo aparece na lista de dispositivos, rode o projeto teste.
- faça o build em ambos 1 por vez para verificar o funcionamento
## Android virtual
- o dispositivo configurado no android studio deve ja esta aparecendo na lista
- selecionar o emulador e executar o debug
## fisico
- plugar o ubs no celular e ativar depuraçao usb
- con celular no usb e com depuraçao ativada o mesmo deve aparecer na lista de dispositivos, selecione e rode o projeto

- reincie o mac


# Programas necessários
- [Download VSCode](https://code.visualstudio.com/)
    - Instalar plugins
- [Download Android Studio](https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds)
    - Baixar plugins *Flutter & Dart*
    - Baixar SDKs
    - Baixar Tools (Android DSK Command-line Tools)
    - Configurar Emulador
- Download **XCode** no App Sore
    - Demora, aguarde a instalação para seguir com instalação do flutter

# Configurando variável curl
> Comandos do terminal<br>
```
/usr/bin/curl
```

- Retorno deve ser -> *curl: try 'curl --help' or 'curl --manual' for more information* <br>

```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
```
## Instalar HomeBrew
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
## Instalando flutter
> Comandos do terminal<br>
````
brew install flutter
````
- Anotar caminho da instalação (/opt/homebrew/bin/flutter)
```
brew install cocoapods
```
```
brew install android-platform-tools 
```
```
flutter doctor --android-licenses
```
- Rodar flutter doctor e resolver pendencias caso haja alguma
# Configuração IDE
## VSCode
- Caso seja necessário localizar o SDK usar o caminho salvo na [instalação do brew](./Instalação_Mac.md#Instalando-flutter)
### Emuladores
- XCode Emulador virtual
> Comandos do terminal<br>
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```
```
sudo xcodebuild -runFirstLaunch
```
- Abrir um projeto criado (Selecionar pasta ios do projeto) ou criar um novo pelo terminal
    ```
    flutter create my_app
    ```
- Fazer login no XCode e configurar o ***TEAM*** adicionando a conta iCloud
- Selecionar um emulador de iPhone na lista e clicar *Runner* para executa-lo.
    - Pare a execução do projeto e vá para o VsCode porem nao feche o emulador
- Com emulador aberto abra o VsCode e veja se o mesmo aparece na lista de dispositivos, selecione o emulador do iPhone e clique em *Debug* para executa-lo.
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
- instalando git
- brew install git
git config --global user.name "Seu Nome"
git config --global user.email email@example.com


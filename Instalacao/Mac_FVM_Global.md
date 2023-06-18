# Versionamento Global
- Este tipo de instalação é usada para troca entre versões do flutter em toda a maquina
# Programas necessários
- [Download VSCode](https://code.visualstudio.com/)
    - Baixar e instalar
- [Download Android Studio](https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds)
    - Baixar e instalar
    - Abrir e baixar complementos necessários
- [Download Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
    - Abrir e baixar complementos necessários
    
# Configurando variável curl
> Comandos do terminal<br>
```
/usr/bin/curl
```
- Retorno deve ser -> *curl: try 'curl --help' or 'curl --manual' for more information* <br>

```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
```
# Instalando JDKs
- Baixar no site oficial
    - [JDK 11](https://www.oracle.com/br/java/technologies/javase/jdk11-archive-downloads.html)
- Baixar arquivos DMG para instalação no mac
- Usar comando abaixo para localizar pasta de instalação do java
```
/usr/libexec/java_home
```
- Usar comando abaixo para verificar a versão instalada
```
ls /Library/Java/JavaVirtualMachines/
```
- Voltar para home
```
cd ~
```
- Criar uma nova pasta, usei o nome workstation para esta pasta criada, e dentro desta pasta criar uma pasta chamada bin e navegar ate ela
```
mkdir workstation
```
```
cd workstation
```
```
mkdir bin
```
```
cd bin
```
- Dentro da pasta bin usar comando 
```
pwd
```
- Copiar caminho exibido e adicionar a variavel JAVA_HOME (Usado terminal zsh)
    - Tambem é possivel abrir arquivo oculto `.zshrc` , normalmente localizado na pasta do usuario (Para exibi-lo usar *CMD + SHIFT + .*), e incluir o caminho diretamente
```
vi ~/.zshrc
```
- Precione "i" para editar a variavel informe o export passando o caminho copiado acima incluindo ao final /jdk
```
export JAVA_HOME=<caminho copiado acima>/jdk
```
- Para sair e salvar precione *esc* depois comando ```:wq```
- Feito isto rodar comando para finalizar configuração do JDK
```
unlink jdk 
```
```
ln -s $(/usr/libexec/java_home -v 11.0) ./jdk
```
- Recomendo deixar a pasta bin oculta, para isso com termina na pasta home
```
chflags hidden <Caminho da pasta>
```
## Instalar/Reativar HomeBrew
- Para instalar, rodar comando 1, 2 e 3
- Para reativar rodar apenas comando 3
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/UserFolder/.zprofile
```
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```
# Instalar git se ainda não o tenha feito anteriormente
> Comandos do terminal<br>
```
brew install git
```
```
git config --global user.name <"UserNameGit">
```
```
git config --global user.email <"email@example.com">
```
# Instalar FVM
- No terminal
```
brew tap leoafarias/fvm
```
```
brew install fvm
```
# Instalar Flutter
- Para verificar versões disponiveis
```
fvm releases
```
- Para instalar
```
fvm global <versao desejada>
```
- Ou instalar a ultima disponivel
```
fvm global stable
```
- **OBS**: *PARA ALTERNAR ENTRE VERSOES BASTA RODAR COMANDO ```FVM GLOBAL <versao desejada>``` CASO JA TENHA BAIXADA IRA EFETUAR A TROCA CASO NAO TENHA IRA BAIXAR*
- Salvar caminho exibido no terminal apos instalação do *flutter/fvm* para uso mais a frente neste passo-a-passo.
    - Gravar variavel de ambiente, seguir mesmo passos feito na variavel do JDK ou abrir arquivo oculto `.zshrc` , normalmente localizado na pasta do usuario (Para exibi-lo usar *CMD + SHIFT + .*)
        ```
        export PATH=$PATH:<Caminho copiado>
        ```
    - Em caso de troca de versão ser necessario trocar o link path da variavel de ambiente do fvm/flutter no arquivo `.zshrc` trocando o caminho do path para o exibido no console apos atualização

# Configurando Android Studio
>SDK
- No Andrdoid Studio va em preferencias selecione *Android SDK*
    - Na aba *SDK Platforms* Selecione a uma versao do Android
    - Na aba *SDK Tools*
        - Selecione *Android SDK Command-line Tools*
        - Selecione *Android SDK Build-Tools*
        - Selecione *Android SDK Platform-Tools*
    - Clique Ok e aguarde instalação
- Va em preferencias selecione *Plugins*
    - Instale o *Plugin Flutter*
    - Instale o *Plugin Dart*
>Emulador
- Selecione *Virtual Device Manager*
    - Crie um novo device ou configure um ja existente
>Plugins
    - Baixar plugins *Flutter & Dart*
    - Baixar SDKs
    - Baixar Tools (Android DSK Command-line Tools)
    - Configurar Emulador
>Variaveis Android Studio SDK
- No Andrdoid Studio va em preferencias selecione *Android SDK*
    - **Copiar** caminho exibido em *Android SDK Location*
    - Gravar variavel de ambiente, seguir mesmo passos feito na variavel do JDK ou abrir arquivo oculto `.zshrc` , normalmente localizado na pasta do usuario (Para exibi-lo usar *CMD + SHIFT + .*)
```
export ANDROID_HOME=<CAMINHO OBTIDO NO ANDROID STUDIO SDK>
```
```
export ANDROID_ROOT_SDK=<CAMINHO OBTIDO (MESMO ACIMA)>
```
```
export PATH=$PATH:$ANDROID_HOME/tools/bin
```
```
export PATH=$PATH:$ANDROID_HOME/platform-tools
```
- Execultar comando CMD para verificar instalação
```
adb --version
```
# Configuração Visual Studio Code
>Plugins
- Baixar *Plugin flutter*
- Baixar *Plugin dart*
>Rodar *flutter doctor*
# Resolvendo pendencias doctor
- Reiniciar terminal executar comando
```
flutter doctor
```
>Erros Xcode
- Execute comandos no terminal
   -  ```
        sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
      ```
    - ```
        sudo gem install cocoapods
      ```
    - ```
        sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
      ```
>Erros Android Studio
- Aceite as lincenças do android
    - ```
        flutter doctor --android-licenses
      ```
    - Digite "y" para aceitar licenças
- Repetir `flutter doctor`, todas linhas estando ok, a instalação foi concluida!

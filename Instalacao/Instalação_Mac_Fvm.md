# Programas necessários
- [Download VSCode](https://code.visualstudio.com/)
    - Instalar plugins
- [Download Android Studio](https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds)
    - Baixar plugins *Flutter & Dart*
    - Baixar SDKs
    - Baixar Tools (Android DSK Command-line Tools)
    - Configurar Emulador
- Download **XCode** no App Sore
    - Demora, aguarde a instalação para seguir com proximos passos

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
# Instalando git
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
# Instalando JDKs
- Baixar no site oficial
    - [JDK 11](https://www.oracle.com/br/java/technologies/javase/jdk11-archive-downloads.html)
    - [JDK 8](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html)
<br>
- Baixar arquivos DMG para instalação no mac
- Usar comando abaixo para localizar pasta de instalação do java
```
/usr/libexec/java_home
```
- Usar comando abaixo para verificar se as duas versões foram instaladas
ls + local exibido no comando anterior (removendo do link a pasta de versao)
    - Exemplo: /Library/Java/JavaVirtualMachines/JDK11/...
    - Usar comando:
       ```
        ls /Library/Java/JavaVirtualMachines/
        ```
    - Ira mostras as duas versoes do JDK instaladas
    

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
- **Copiar** caminho exibido e adicionar a variavel JAVA_HOME (Usado terminal zsh)
```
vi ~/.zshrc
```
- Precione "i" para editar a variavel informe o export passando o caminho copiado acima incluindo ao final /jdk
```
export JAVA_HOME= <caminho copiado acima>/jdk
```
- Para sair e salvar precione *esc* depois comando ```:wq```
- Feito isto ja é possivel alterar entre as versoes do JDK, para isso usar comando
    - Para selecionar a versao 8
        ```
        unlink jdk
        ```
        ```
        ln -s $(/usr/libexec/java_home -v 1.8.0) ./jdk
        ```
    - Para selecionar a versao 11
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
# Variaveis Android Studio SDK
- **Copiar** caminho exibido no SDK do android studio
```
vi ~/.zshrc
```
- Precione "i" para editar a variavel informe o export passando o caminho do sdk copiado
```
export ANDROID_HOME=<CAMINHO OBTIDO NO ANDROID STUDIO SDK>
export ANDROID_ROOT_SDK=<CAMINHO OBTIDO (MESMO ACIMA)>
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```
- Para sair e salvar precione *esc* depois comando ```:wq```
- Reiniciar terminal e rodar comando para verificar versao do sdk
```
adb --version
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
- **OBS**: *PARA ALTERNAR ENTRE VERSOES BASTA RODAR COMANDO FVM GLOBAL (versao desejada) CASO JA TENHA BAIXADA IRA EFETUAR A TROCA CASO NAO TENHA IRA BAIXAR*

# Variaveis do Flutter
- **Copiar** caminho da instalação exibido quando concluída.<br>
```
vi ~/.zshrc
```
- Precione "i" para editar a variavel informe o export passando o caminho copiado
```
export PATH=$PATH:<Caminho copiado>
```
- Para sair e salvar precione *esc* depois comando ```:wq```
- Reiniciar terminal executar comando
```
flutter doctor
```
# Resolvendo pendendias doctor
- Abra o xCode para baixar e instalar os componentes necessarios.
    - Quando concluir o mesmo ira para na tela para criar ou abrir um projeto, pode fechar o programa nesta tela
- Execute comando
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```
```
sudo gem install cocoapods
```
```
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
```
- Aceite as lincenças do android
```
flutter doctor --android-licenses
```
- Digite "y" para aceitar licenças

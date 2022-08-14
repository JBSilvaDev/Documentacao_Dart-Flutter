<!-- baixar xcode
instalar home brew com zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jbsilva/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

instalar git
brew install git -->
***
<!-- instalar jdk 11
dmg installer

fechar e abrir terminal para verificar se instacao foi ok
java -version

baixar jdk 8
dmg installer

fechar e abrir terminal para verificar se instacao foi ok
java -version -->

<!-- navegar para home
cd ~
navegar para documentos
cd Documents
criar uma pasta e entrar nela
mkdir WorkStation
cd WorkStation
criar pasta bin e entrar nela
mkdir bin
cd bin
encontrar local de instacao dos jdks
usr/libexec/java_home
executar comando ls +local da instacao do jdk para verificar versoes do jdk instaladas


criar variaveis do jdk
dentro da pasta bin usar
pwd e copiar caminho exibido
vi ~/.zshrc
export JAVA_HOME= link copiado acima + /jdk
salvar com esc depois :wq -->

para troca entre versoes do java
entrar na pasta bin em workstation
para versao 8
unlink jdk
ln -s $(/usr/libexec/java_home -v 1.8.0) ./jdk
para voltar a versao 11
unlink jdk
ln -s $(/usr/libexec/java_home -v 11.0) ./jdk

***

instalar android studio
configurar sdks
instalar plugins
configurar emulador android

configurar variaveis de ambiente do android studio
vi ~/.zshrc
export ANDROID_HOME=LINK OBTIDO NO ANDROID STUDIO SDK
export ANDROID_ROOT_SDK=LINK OBTIDO NO ANDROID STUDIO SDK (MESMO LINK DO ACIMA)
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
salvar variaveis :wq

fechar terminal e reabrir
digitar adb --version para verificar se deu certo
digitar keytool  para verfiricar se esta instalado


instalar fvm

brew tap leoafarias/fvm
brew install fvm

verificar versoes do flutter disponivel
fvm releases
instacar versao desejada (quantas necessarias - so istalei uma)
fvm global numero da versao
instala ultima versao estavel
fvm global stable

PARA ALTERNAR ENTRE VERSOES BASTA RODAR COMANDO FVM GLOBAL (versao desejada) CASO JA TENHA BAIXADA IRA EFETUAR A TROCA CASO NAO TENHA IRA BAIXAR

criar variavel de ambeite para o flutter passando o caminho informado ao final da instacao do flutter

reniciar terminal
rodar flutter doctor

rodar
flutter doctor --android-licenses

abrir xcode para baixar coponentes
rodar
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

sudo gem install cocoapods
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc (esse eu nao fiz para ver se e necessario)

instalar vs code e seus plugins

caso deseja ocultar a pasta usar
chflags hidden (arraste a pasta que deseja ocultar aqui)






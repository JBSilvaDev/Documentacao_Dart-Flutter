instalar home brew com zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jbsilva/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

instalar git
brew install git
***
instalar jdk 11
dmg installer

fechar e abrir terminal para verificar se instacao foi ok
java -version

baixar jdk 8
dmg installer

fechar e abrir terminal para verificar se instacao foi ok
java -version

navegar para home
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

***
criar variaveis do jdk
dentro da pasta bin usar
pwd e copiar caminho exibido
vi ~/.zshrc
export JAVA_HOME= link copiado acima + /jdk
salvar com esc depois :wq

para troca entre versoes do java
entrar na pasta bin em workstation
para versao 8
unlink jdk
ln -s $(/usr/libexec/java_home -v 1.8.0) ./jdk
para voltar a versao 11
unlink jdk
ln -s $(/usr/libexec/java_home -v 11.0) ./jdk






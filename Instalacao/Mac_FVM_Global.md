# Versionamento Global
- Este tipo de instalação é usada para trocar entre versões do Flutter em toda a máquina.

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
- O retorno deve ser -> *curl: try 'curl --help' or 'curl --manual' for more information* <br>

```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
```
# Instalando JDKs
- Baixar no site oficial
    - [JDK 11](https://www.oracle.com/br/java/technologies/javase/jdk11-archive-downloads.html)
- Baixar arquivos DMG para instalação no Mac
- Usar o comando abaixo para localizar a pasta de instalação do Java
```
/usr/libexec/java_home
```
- Usar o comando abaixo para verificar a versão instalada
```
ls /Library/Java/JavaVirtualMachines/
```
- Voltar para a pasta home
```
cd ~
```
- Criar uma nova pasta, usando o nome "workstation" para esta pasta criada, e dentro desta pasta criar uma pasta chamada "bin" e navegar até ela
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
- Dentro da pasta bin, usar o comando 
```
pwd
```
- Copiar o caminho exibido e adicionar à variável JAVA_HOME (usando o terminal Zsh)
    - Também é possível abrir o arquivo oculto `.zshrc`, normalmente localizado na pasta do usuário (para exibi-lo, use *CMD + SHIFT + .*), e incluir o caminho diretamente
```
vi ~/.zshrc
```
- Pressionar "i" para editar a variável, informe o export passando o caminho copiado acima, incluindo "/jdk" no final
```
export JAVA_HOME=<caminho copiado acima>/jdk
```
- Para sair e salvar, pressionar *esc* e depois o comando ```:wq```
- Feito isso, rodar o comando para finalizar a configuração do JDK
```
unlink jdk 
```
```
ln -s $(/usr/libexec/java_home -v 11.0) ./jdk
```
- Recomendo deixar a pasta bin oculta. Para isso, com o terminal na pasta home
```
chflags hidden <Caminho da pasta>
```
##

 Instalar/Reativar HomeBrew
- Para instalar, rodar os comandos 1, 2 e 3
- Para reativar, rodar apenas o comando 3
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/UserFolder/.zprofile
```
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```
# Instalar o Git se ainda não o tiver feito anteriormente
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
# Instalar o FVM
- No terminal
```
brew tap leoafarias/fvm
```
```
brew install fvm
```
# Instalar o Flutter
- Para verificar as versões disponíveis
```
fvm releases
```
- Para instalar
```
fvm global <versão desejada>
```
- Ou instalar a última disponível
```
fvm global stable
```
- **OBS**: *PARA ALTERNAR ENTRE VERSÕES, BASTA RODAR O COMANDO ```FVM GLOBAL <versão desejada>``` CASO JÁ TENHA BAIXADO, IRÁ EFETUAR A TROCA. CASO NÃO TENHA, IRÁ BAIXAR.*
- Salvar o caminho exibido no terminal após a instalação do *flutter/fvm* para uso posterior neste passo a passo.
    - Gravar a variável de ambiente. Seguir os mesmos passos feitos na variável do JDK ou abrir o arquivo oculto `.zshrc`, normalmente localizado na pasta do usuário (para exibi-lo, use *CMD + SHIFT + .*)
        ```
        export PATH=$PATH:<Caminho copiado>
        ```
    - Em caso de troca de versão ser necessária, trocar o link path da variável de ambiente do fvm/flutter no arquivo `.zshrc`, substituindo o caminho do path pelo exibido no console após a atualização.

# Configurando o Android Studio
>SDK
- No Android Studio, vá em preferências e selecione *Android SDK*
    - Na aba *SDK Platforms*, selecione uma versão do Android
    - Na aba *SDK Tools*
        - Selecione *Android SDK Command-line Tools*
        - Selecione *Android SDK Build-Tools*
        - Selecione *Android SDK Platform-Tools*
    - Clique em OK e aguarde a instalação
- Vá em preferências e selecione *Plugins*
    - Instale o *Plugin Flutter*
    - Instale o *Plugin Dart*
>Emulador
- Selecione *Virtual Device Manager*
    - Crie um novo dispositivo ou configure um já existente
>Plugins
    - Baixar plugins *Flutter & Dart*
    - Baixar SDKs
    - Baixar Tools (Android SDK Command-line Tools)
    - Configurar Emulador
>Variáveis Android Studio SDK
- No Android Studio, vá em preferências e selecione *Android SDK*
    - **Copie** o caminho exibido em *Android SDK Location*
    - Gravar a variável de ambiente. Seguir os mesmos pass
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
git config --global user.name "UserNameGit"
```
```
git config --global user.email "email@example.com"
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
export JAVA_HOME= caminho copiado acima + /jdk
```
- Para sair e salvar precione *esc* depois comando ```:wq```
- Feito isto ja é possivel alterar entre as versoes do JDK, para isso usar comando
```
unlink jdk
ln -s $(/usr/libexec/java_home -v 1.8.0) ./jdk






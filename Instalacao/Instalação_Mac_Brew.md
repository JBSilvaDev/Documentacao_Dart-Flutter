# Programas necessários
- [Download do VSCode](https://code.visualstudio.com/)
    - Instale os plugins necessários.
- [Download do Android Studio](https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds)
    - Baixe os plugins *Flutter & Dart*.
    - Baixe os SDKs necessários.
    - Baixe as Ferramentas (Android SDK Command-line Tools).
    - Configure o emulador.
- Baixe o **XCode** na App Store.
    - Aguarde a instalação antes de prosseguir com a instalação do Flutter.

# Configurando a variável de ambiente *curl*
> Comandos do terminal
```
/usr/bin/curl
```

- O retorno deve ser *curl: try 'curl --help' or 'curl --manual' for more information*.

```
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
```

## Instalando o Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Após a instalação, execute os comandos a seguir:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/UserFolder/.zprofile
```

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Instalando o Flutter
> Comandos do terminal
````
brew install flutter
````

- Anote o caminho de instalação (/opt/homebrew/bin/flutter)

```
brew install cocoapods
```

```
brew install android-platform-tools 
```

```
flutter doctor --android-licenses
```

- Execute o comando `flutter doctor` e resolva quaisquer pendências, se houver.

# Configuração da IDE
## VSCode
- Caso precise localizar o SDK, utilize o caminho salvo na [instalação do Homebrew](./Instalação_Mac_Brew.md#Instalando-flutter).

### Emuladores
- Emulador virtual do XCode
> Comandos do terminal
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

```
sudo xcodebuild -runFirstLaunch
```

- Abra um projeto existente (selecione a pasta ios do projeto) ou crie um novo pelo terminal:
    ```
    flutter create my_app
    ```

- Faça login no XCode e configure a ***TEAM*** adicionando a conta iCloud.

- Selecione um emulador de iPhone na lista e clique em *Run* para executá-lo.
    - Aguarde a conclusão, teste e pare a execução do projeto, mas não feche o emulador.

- Com o emulador aberto, abra o VSCode e verifique se ele aparece na lista de dispositivos. Selecione o emulador do iPhone e clique em *Debug* para executar o projeto aberto.

- Emulador físico do XCode
- Conecte o cabo USB ao Mac e um popup aparecerá no iPhone. Clique em "Confiar".

- Abra o

 XCode, selecione um projeto existente ou crie um novo conforme mostrado [acima](./Instalação_Mac_Brew.md#emuladores).

- Procure o iPhone físico na lista de emuladores do XCode.

- Selecione o iPhone na lista e clique em *Run* para executá-lo.

- No iPhone, cancele o popup que aparecerá na tela e configure as permissões de desenvolvimento:
    - Configurações -> Geral -> Gerenciamento de VPN e Dispositivos
        - Autorize o Apple Development.

- Volte para o XCode, com o iPhone físico selecionado, execute o *Runner* novamente.

- Aguarde a conclusão, teste e pare a execução do projeto e volte para o VSCode.

- Com o iPhone conectado, abra o VSCode e verifique se ele aparece na lista de dispositivos. Selecione-o e clique em *Debug* para executar o projeto aberto.

- Emulador virtual do Android
- O emulador configurado no Android Studio deve estar disponível na lista.

- Selecione o emulador e execute o *Debug*.

- Emulador físico do Android
- Conecte o celular ao Mac usando um cabo USB e ative a depuração USB.

- Com o celular conectado e a depuração ativada, ele deve aparecer na lista de dispositivos. Selecione-o e clique em *Debug* para executar o projeto aberto.

- Reinicie o Mac.

# Instalando o Git
> Comandos do terminal
```
brew install git
```

```
git config --global user.name "UserNameGit"
```

```
git config --global user.email "email@example.com"
```
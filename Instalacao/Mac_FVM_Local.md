# Versionamento Local

- Este tipo de instalação é usada para definir uma versão especifica do flutter para cada projeto sem interfirir na instalação padrao

## Downloads

Antes de prosseguir com a instalação dos plugins, você precisará baixar e instalar os seguintes aplicativos:

- [VSCode](https://code.visualstudio.com/) - Baixe e instale o Visual Studio Code.
- [Android Studio](https://developer.android.com/studio?hl=pt&gclid=CjwKCAjw0dKXBhBPEiwA2bmObQnK-HUSx7GH7u0_IsC1vf9_WvEzh0o1eDUsKa03aXz6D0zIGDSRrRoCnn8QAvD_BwE&gclsrc=aw.ds) - Baixe e instale o Android Studio. Abra o Android Studio e instale as dependências necessárias.
- [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) - Baixe e instale o Xcode. Abra o Xcode e instale as dependências necessárias.

# Instalações

## SdkMan

1. Instalação do SdkMan:
   ```
   curl -s "https://get.sdkman.io" | bash
   ```
   ```
   source "/Users/jbsilva/.sdkman/bin/sdkman-init.sh"
   ```

2. Instalação do Java:
   ```
   sdk list java
   ```
   - Verifique as versões disponíveis do Java e localize a versão desejada. Copie o "Identifier" da versão.
   - Pressione "Q" para sair da lista.
   - Instale a versão selecionada pelo ID (por exemplo, jdk8: 8.0.372-amzn | jdk11: 11.0.19-amzn):
     ```
     sdk install java <id da versão copiada>
     ```
   - Use o seguinte comando para alternar entre as versões:
     ```
     sdk use java <id da versão>
     ```

3. Em caso de erro no comando `compaudit`, use o seguinte comando:
   - Para ver as pastas que apresentam erro (se não aparecer nada, não há problemas):
     ```
     compaudit
     ```
     ```
     compaudit | xargs sudo chown -R "$(whoami)"
     ```
     ou
     ```
     sudo compaudit | xargs chown -R "$(whoami)"
     ```

> Considere criar funções para o zsh [aqui](./shell_configs.md).

## Homebrew

1. Instalação do Homebrew:
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Execute os seguintes comandos após a instalação:
   ```
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/UserFolder/.zprofile
   ```
   ```
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```

## ZSH

Instale o ZSH usando o seguinte comando:
```
brew install zsh
```

## Git

1. Instalação do Git:
   ```
   brew install git
   ```

2. Configure o Git com seu nome e e-mail:
   ```
   git config --global --add safe.directory '*'
   ```
   ```
   git config --global user.name "Seu Nome"
   ```
   ```
   git config --global user.email email@example.com
   ```

## Android Studio (Configuração)

### SDK

1. Abra o Android Studio e vá para "Configurações".
2. Selecione "SDK Manager".
3. Escolha a versão mais recente do Android e marque-a para instalação.

### SDK Tools

1. No "SDK Manager", vá para a guia "SDK Tools".
2. Marque a opção "Android SDK Command-line Tools".
3. Marque as opções "Android SDK Build-Tools".

### Plugins

1. Vá para "Plugins" no Android Studio.
2. Instale o plugin "Flutter".
3. Instale o plugin "Dart".

### Emulador

1. Selecione "Virtual Device Manager" no Android Studio.
2. Crie um novo dispositivo virtual ou configure um existente.

### Configuração das Variáveis de Ambiente

1. Defina as seguintes variáveis de ambiente no seu arquivo `.zshrc` ou similar:
   ```sh
   export ANDROID_HOME=<Local do SDK do Android>
   export ANDROID_SDK_ROOT=<Local do SDK do Android>
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

## Dart SDK

Instale o Dart SDK usando o seguinte comando:
```
brew install dart
```

## FVM

1. Instale o FVM (Flutter Version Management):
   ```
   dart pub global activate fvm
   ```
   ```
   fvm --version
   ```

2. Configure o caminho do cache do FVM:
   ```
   fvm config --cache-path /Users/jbsilva/Dev/flutter-fvm
   ```

3. Instale uma versão específica do Flutter:
   ```
   fvm install <versão>
   ```

4. Defina a versão global do Flutter:
   ```
   fvm global <versão>
   ```

5. Defina a variável de ambiente para o caminho do FVM:
   ```sh
   export PATH=$PATH:"<Caminho exibido após a instalação>"
   ```

6. Execute o comando `flutter doctor` para verificar a instalação.

## Xcode (Configuração)

1. Execute o seguinte comando no terminal para configurar o Xcode:
   ```
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   ```

2. Abra o Xcode:
   - Faça login no Xcode e configure a equipe (adicionando a conta do iCloud).
   - Selecione um emulador de iPhone na lista e clique em "Runner" para executá-lo.

## Visual Studio Code

### Plugins

- Baixe e instale os seguintes plugins no VSCode:
  - Flutter
  - Dart

Certifique-se de seguir as etapas com cuidado para instalar corretamente todos os componentes necessários para o desenvolvimento Flutter no seu ambiente de desenvolvimento Mac.
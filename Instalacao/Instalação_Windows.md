Aqui está o documento atualizado com as correções e formatações necessárias:

# Instalar Android Studio
- [Baixar Android Studio](https://developer.android.com/studio)

# Instalar VSCode
- [Baixar VSCode](https://code.visualstudio.com/download)

# Instalar Visual Studio Community
- [Baixar Visual Studio Community](https://visualstudio.microsoft.com/pt-br/vs/community/)
- Avance e marque a opção "Desenvolvimento para desktop C++"

# Baixar o Flutter SDK
- [Baixar o Flutter SDK](https://docs.flutter.dev/get-started/install/windows)
- Extraia o arquivo ZIP para o local desejado

## Via CMD
- Instalar o Chocolatey
    - [Instruções de instalação do Chocolatey](https://chocolatey.org/install)
    - Abra o PowerShell como administrador
    - Cole o seguinte comando:
        ```
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        ```
    - Ou utilize outro método de instalação disponível no site oficial

- Instalar o Git
    - No CMD, execute o seguinte comando:
        ```
        choco install git
        ```

- Instalar o Java
    - No CMD, execute o seguinte comando para instalar o JDK 8:
        ```
        choco install jdk8
        ```
    - Para o Flutter 3+, execute o seguinte comando para instalar o JDK 11:
        ```
        choco install jdk11
        ```
    - A instalação do Java é necessária para gerar uma chave SSH

- Instalar o Flutter
    - Através do Git, siga os passos abaixo:
        - Navegue até a pasta onde deseja instalar o Flutter
        - Crie uma nova pasta no local com o seguinte comando:
            ```
            mkdir NomeDaPasta
            ```
        - Navegue até a pasta criada com o comando:
            ```
            cd NomeDaPasta
            ```
        - Clone o repositório do Flutter com o seguinte comando:
            ```
            git clone https://github.com/flutter/flutter.git -b stable
            ```

# Configuração do Flutter
> Variáveis de ambiente

- Crie uma nova variável de ambiente chamada **FLUTTER_HOME** e defina o valor como o caminho onde o Flutter foi instalado, por exemplo: *E:\Flutter\flutter*

- Adicione o caminho do Flutter ao PATH nas variáveis de ambiente:
    - Abra as variáveis de ambiente do sistema
    - Na variável PATH, adicione um novo caminho com o valor *%FLUTTER_HOME%\bin*

# Configuração do Android Studio
> Variáveis de ambiente

- Crie uma nova variável de ambiente chamada **ANDROID_HOME** e defina o valor como o caminho da instalação do SDK do Android, por exemplo: *C:\Users\NomeDoUsuario\AppData\Local\Android\Sdk*

- Adicione os seguintes caminhos ao PATH nas variáveis de ambiente:
    - *%ANDROID_HOME%\tools\bin*
    - *%ANDROID_HOME%\platform-tools*

- No CMD, execute o seguinte comando para verificar se a configuração foi concluída corretamente:
    ```
    adb --version
    ```

> SDK

- No Android Studio, acesse Configurações e selecione **SDK Manager**
    - Em **SDK Platforms**, selecione a versão mais recente do Android
    - Em **SDK Tools**, selecione:
        - Android SDK Command-line Tools
        - Android SDK Build-Tools

> Plugins

- No Android Studio, acesse Configurações e selecione **Plugins**
    - Instale o **Plugin Flutter**
    - Instale o **Plugin Dart**

> Emulador

- No Android Studio, selecione **Virtual Device Manager**
    - Crie um novo dispositivo ou configure um dispositivo existente

> Executar *flutter doctor*

# Configuração do Visual Studio Code
> Plugins

- Baixe o **Plugin Flutter**
- Baixe o **Plugin Dart**

> Executar *flutter doctor*

# Verificação da instalação
- Abra o CMD fora da pasta "bin" do Flutter e digite o comando `flutter`
- Execute o comando `flutter doctor`
- Verifique se há erros e corrija-os, se necessário:
    - Para corrigir o erro "cmdline-tools component is missing":
        - Abra o Android Studio
        - Acesse Configurações / SDK Manager / SDK Tools
        - Selecione a opção "Android SDK Command-line Tools"
        - Clique em OK e aguarde o download e a instalação

    - Para corrigir o erro "Android toolchain - develop for Android devices" (Licenças):
        - Execute o comando `flutter doctor --android-licenses`
        - Aceite todas as licenças (Y)

    - Execute o comando `flutter doctor -v` para verificar novamente a instalação. Todos os itens devem estar com status "OK".

# Habilitar o Flutter no VSCode
- Abra o VSCode
- Vá para *View* e selecione *Command Palette*
- Digite "Flutter: Run Flutter Doctor" na caixa de comando
- Navegue até a pasta "bin" onde o Flutter foi instalado, ou atualize o PATH com o caminho até a pasta Flutter (uma pasta acima de "bin")

# Criando um novo projeto
> Via CMD

- Flutter
    - No CMD, execute o seguinte comando:
        ```dart
        flutter create --project-name=nome_do_projeto --org br.com.jbtec --platforms android,ios -a kotlin -i swift ./local/name=nome_do_projeto
        ```

- Dart
    - No CMD, execute o seguinte comando:
        ```cmd
        dart create nome_do_projeto
        ```

> Via VSCode

- Pressione Ctrl+Shift+P para abrir a *Command Palette* (Visualizar - Paleta de Comandos)
- Selecione *Flutter: New Project* (Flutter: Novo Projeto)

***

# Verificação da plataforma em uso
- Use uma estrutura condicional para verificar a plataforma em uso
- Importe o pacote necessário no início do arquivo:
    ```dart
    import 'dart:io';
    ```

- Utilize uma declaração *if* para verificar a plataforma:
    ```dart
    if (Platform.isIOS) {
        print('É iOS');
    } else if (Platform.isWindows) {
        print('É Windows');
    }
    ```

- Outras opções de verificação disponíveis:
    - *isAndroid*
    - *isLinux*
    - *isMacOS*
    - *isWindows*
    - *isIOS*


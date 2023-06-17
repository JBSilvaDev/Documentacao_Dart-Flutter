# Downloads
> Fazer as instalações quando possível em uma pasta sem necessidade de permissão ADM
## Android Studio
- https://developer.android.com/studio
## VSCode
- https://code.visualstudio.com/download
## Visual Studio Community
- https://visualstudio.microsoft.com/pt-br/vs/community/
## Git
- https://git-scm.com/downloads
  - `winget install --id Git.Git -e --source winget --force`
## Chocolatey
- https://chocolatey.org/install
	- Abrir powershell como adm
	- Colar codigo:
		-  ```
			 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
		  	``` 
## JDK's
- jdk8 
  - https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html
- jdk11 
  - https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html
***
*** 

# Configurações

## Git
- https://github.com/JBSilvaDev/Intro_For_Git

## Visual Studio
- Avançar e marcar a opção desenvolvimento para desktop c++
  
## Visual Studio Code
>Plugins
- Baixar *Plugin flutter*
- Baixar *Plugin dart*

## Android Studio
>Variaveis de ambiente
- Crie uma nova variavel de ambiente com nome *ANDROID_HOME*
    - Va em configurações selecione *SDK Manager*
    - Copie o caminho da instacação do SDK *C:\Users\usuarioNome\AppData\Local\Android\Sdk*
    - Cole o caminho do SDK copiado no valor da variavel
- Dentro da variavel de ambiente *Path* adicione um novo caminho *%ANDROID_HOME%\tools\bin*
- Ainda na variavel de ambiente *Path* adicione outro caminho *%ANDROID_HOME%\platform-tools*
- No CMD rodar comando *adb --version* se mostrar a versao do adb a configuração foi concluida.
>SDK
- Va em configurações selecione *SDK Manager*
    - Selecione a *ultima versao do Android*
- SDK Tools
    - Selecione *Android SDK Command-line Tools*
    - Selecione *Android SDK Build-Tools*
>Plugins
- Va para plugins
    - Instale o *Plugin Flutter*
    - Instale o *Plugin Dart*
>Emulador
- Selecione *Virtual Device Manager*
    - Crie um novo device ou configure um ja existente

## JDK's
- Remover possíveis variaveis de ambiente criadas durante a instalação
- Navegar no powershell ate a pasta onde instalou os JDK's
  - C:\Dev\Java
    - jdk8
    - jdk11
- Criar link simbolico
> Considere criar funcoes para o powershell [aqui](./shel_configs.md)
  - Para pasta jdk8
    - ```
      New-Item -ItemType SymbolicLink -Path C:\Dev\java\current -Target C:\Dev\java\jdk8 -Force
      ```
  - Para pasta jdk11
    - ```
      New-Item -ItemType SymbolicLink -Path C:\Dev\java\current -Target C:\Dev\java\jdk11 -Force
      ```
  - Após executar um dos comandos uma pasta nova sera crada no diretório, para este exemplo é a pasta `current`, copiar o path desta pasta e adicionar a variável de ambiente JAVA_HOME
    - Dentro da variavel de ambiente *Path* adicione um novo caminho *%JAVA_HOME%\bin*
 
## FVM
> Comandos basicos - https://fvm.app/docs/guides/basic_commands
- Baixar sdk do dart
	- ```choco install dart-sdk```
- No powershell rodar comando `dart pub global activate fvm`
  - Um caminho sera exibido após instalação salve em uma variavel de ambiente no *Path*
- Reinicie o terminal e verifique a versão do fvm com comando `fvm --version`
- Rode comando para configurar local de instalação das versões do flutter
  - `fvm config --cache-path C:\Dev\flutter-fvm`
- Rode comando para verificar se a configuração do cachePath foi definida
  - `fvm config`
- Defina a versão principal do flutter e outras que possa querer/precisar
  - `fvm install <versao>`
  - `fvm global <versao>`
- Rodar `flutter doctor` ou `fvm flutter doctor`
- Warnings deste tipo podem ser ignorados, é apenas um aviso que nao esta usando variaveis para o flutter
```
[!] Flutter (Channel stable, 3.10.5, on Microsoft Windows [versÆo 10.0.22621.1848], locale pt-BR)
    ! Warning: `flutter` on your path resolves to C:\Dev\flutter-fvm\stable\bin\flutter, which is not inside your
      current Flutter SDK checkout at C:\Users\jbsil\fvm\default. Consider adding C:\Users\jbsil\fvm\default\bin to the
      front of your path.
    ! Warning: `dart` on your path resolves to C:\Dev\flutter-fvm\stable\bin\dart, which is not inside your current
      Flutter SDK checkout at C:\Users\jbsil\fvm\default. Consider adding C:\Users\jbsil\fvm\default\bin to the front of
      your path.
```
- Ja dentro de um projeto flutter usei `fvm use <versao>`para alterar entre as verções do flutter
  - Para consutar as versoes baixadas disponiveis use `fvm list`
  - Uma pasta deve ser criada criando um link simbolico da versao solicitada do flutter no fvm
  - Necessario configurar vsCode para direcionar o path com o json
    - Criar pasta no projeto -> .vscode\settigns.json
      - ```
        {
          "dart.flutterSdkPath": ".fvm/flutter_sdk",
          // Remove .fvm files from search
          "search.exclude": {
            "**/.fvm": true
          },
          // Remove from file watching
          "files.watcherExclude": {
            "**/.fvm": true
          }
        }
        ```
      - Ou passando "dart.flutterSdkPath": ".fvm/flutter_sdk" diretamente no json de configuração global do vsCode





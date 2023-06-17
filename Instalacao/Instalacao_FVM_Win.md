Abrir terminal
dart pub global activate fvm
  adicionar path na variavel de ambiente (olhar warning no terminal o caminho "C:\Users\jbsil\AppData\Local\Pub\Cache\bin")
fechar terminal
abrir terminal 
fvm --version
  verificar versao
fvm config
fvm config --cache-path E:\Development\StudyStation\flutter-fvm
fvm config
  verificar se apareceu o cachePath com o local informado
Comandos basicos - https://fvm.app/docs/guides/basic_commands
fvm releases
fvm install <versao desejada>
fechar terminal
abrir terminal COMO ADM
fvm global <versao baixada>
fechar terminal
abri terminal
criar variavel FVM_HOME
  passar o caminho que deseja onde sera instalado as versoes do flutter
    E:\Development\StudyStation\flutter-fvm\<versao flutter>
  mesmo caminho da variavel FVM_HOME porem sem a versao do flutter no final

rodar flutter doctor
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

fazer as instalações necessarias mostrada no arquivo de instalação do windows
setar as variaves que la mostra
usar flutter user<version> dentro do projeto para alterar a versao a ser usada nele, apos rodar flutter doctor

Instalar em uma pasta nova que nao precise de adm
jdk8 - https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html
jdk11 - https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html
   remover possiveis variaveis de ambiente criadas automaticamente
   No powershell navegar ate a pasta java e rodar comando DIR para verificar se as duas versoes estao la
    Criar links simbolicos
      New-Item -ItemType SymbolicLink -Path "C:\DevPrograms\Java\current" -Target "C:\DevPrograms\Java\jdk11" -Force
        para mudar entre as versoes do java alterar a pasta final apos o -Target (jdk11 -> jdk8)
      Adicionar o link da pasta current criada nas variaveis de ambiente +\bin
        funcoes notepad
          Comando para criar o link simbolico: 
          New-Item -ItemType SymbolicLink -Path "PATH_DA_PASTA_CORRENT" -Target "PATH_DA_VERSAO_DO_JAVA" -Force
          Comando para criar o profile do power shell:
          notepad $PROFILE
          Comando para liberar as politicas de execução do windows:
          ```
          Get-ExecutionPolicy
          Set-ExecutionPolicy RemoteSigned
          Exemplo do Profile criado na aula:
          ```
          ```
          function jdk8() {
          New-Item -ItemType SymbolicLink -Path C:\DevPrograms\java\current -Target C:\DevPrograms\java\jdk1.8.0_202 -Force
          }

          function jdk11() {
          New-Item -ItemType SymbolicLink -Path C:\DevPrograms\java\current -Target C:\DevPrograms\java\jdk-11 -Force
          }
          ```

instalar flutter via git
git clone https://github.com/flutter/flutter.git -b stable

auto complit - https://www.youtube.com/watch?v=jERL0wbhtsc&list=PLPU9zDUtTNCI7Je40XEllURLdQd3ngUDH






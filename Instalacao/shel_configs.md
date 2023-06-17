
auto complit - https://www.youtube.com/watch?v=jERL0wbhtsc&list=PLPU9zDUtTNCI7Je40XEllURLdQd3ngUDH
 
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
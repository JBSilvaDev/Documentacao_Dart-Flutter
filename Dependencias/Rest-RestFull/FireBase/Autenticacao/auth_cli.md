# FirebaseAuth
>Usado para autenticação de usuarios pois meio de login/senha.<br>
Docs: [Clique aqui](https://pub.dev/packages/firebase_auth)<br>
## Configuração de projeto site

> Acessar console do [firebase](https://console.firebase.google.com/)
- Criar um novo projeto e acessa-lo
    - Ir em configuracao -> configuracao do projeto informar a plataforma a sera usado e demais dados solicitados.
    - Para *SHA-1* usar um dos comandos abaixo ou acessar [dev.google](https://developers.google.com/android/guides/client-auth) para orientações.
        - Mac:
          - ```
              keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
            ```	

        - Windows:
          - ```       
            keytool -list -v -alias androiddebugkey -keystore "%USERPROFILE%\.android\debug.keystore"
            ```
    - Para *NOME DO PACOTE* é o *```com.exemplo.appnome```* pode ser encontrato em ```AndroidManifest.xml```
    - Adicionar um "apelido" ao projeto, não é necessario fazer download do arquivo `.json`
    - Em auteticação selecionar os tipos de autenticações que pretende usar no projeto.
## Configuração de projeto app
> Acessar documentação do [CLI](https://firebase.google.com/docs/cli?hl=pt-br)
- Efetuar a instação do *firebase-tools*
  - Veja documentação...
- Efetuar a instalação do *flutterfire_cli*
  - `dart pub global activate flutterfire_cli`
- Efetuar login no firebase via terminal
  - `firebase login`
- Efetuar configuração do flutterFire, ira baixar o arquivo `.json` e confgurar o projeto
  - `flutterfire configure`

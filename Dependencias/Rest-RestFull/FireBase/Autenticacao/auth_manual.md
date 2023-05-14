# FirebaseAuth
>Usado para autenticação de usuarios pois meio de login/senha.<br>
Docs: [Clique aqui](https://pub.dev/packages/firebase_auth)<br>
## Configuração de projeto site

> Acessar console do [firebase](https://console.firebase.google.com/)
- Criar um novo projeto e acessa-lo
    - Ir em configuracao -> configuracao do projeto informar a plataforma a sera usado e demais dados solicitados.
    - Para *SHA-1* usar um dos comandos abaixo ou acessar [dev.google](https://developers.google.com/android/guides/client-auth) para orientações.
        ```
        keytool -list -v -keystore "C:\Users\JBSilva\.android\debug.keystore"
        ```	
        ```									    
        keytool -list -v -keystore "C:\Users\JBSilva\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android 
        ```
        ```       
        keytool -list -v -alias androiddebugkey -keystore "%USERPROFILE%\.android\debug.keystore"
        ```
    - Para *NOME DO PACOTE* é o *```com.exemplo.appnome```* pode ser encontrato em ```AndroidManifest.xml```
    - Adicionar um "apelido" ao projeto, em seguida baixar o arquivo ```.json``` e adiciona-lo em *```android\app\```*
    - Em auteticação selecionar os tipos de autenticações que pretende usar no projeto.

## Configuração de projeto app
> Acessar documentação do [package](https://pub.dev/packages/firebase_auth)
- Ir no arquivo *```android/build.gradle```* e atualizar o ```buildscript``` acrescentando o *classoath* do google.
    ``` 
    buildscript {
        dependencies {
            // ... other dependencies
            classpath 'com.google.gms:google-services:4.3.8'
        }
    }
    ```
**ATENCAO A ABERTURA E FECHAMENTO DE TAGS NOS ARQUIVOS XML**
- Ir no arquivo *```android/app/build.gradle```* e adicionar ao final do arquivo
    ``` 
    apply plugin: 'com.google.gms.google-services'
    ```
    - Alterar ```minSdkVersion``` para 21 ou mais e adicionar ao mesmo mapa o ```multiDexEnabled true```
- ir ao arquivo *```android/app/src/debug/AndroidManifest.xml```*
    - Adicionar nova tag ao *<manifest xmlns:android*
    ```html
    <application android:usesCleartextTraffic="true">
    <!-- possibly other elements -->
    </application>
    ```



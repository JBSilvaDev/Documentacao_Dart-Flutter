# Configuracao de auutenticação no firebase
- Acessar https://pub.dev/packages/firebase_auth
- Acessar console do firebase https://console.firebase.google.com/
    - criar um novo projeto
    - entrar no projeto criado
    - ir em configuracao -> configuracao do projeto
    - informar a plataforma a ser usado
    - Passar as informações pedidas
        - para sha-1 verificar como conseguir (tem um.txt no onedriver) ou https://developers.google.com/android/guides/client-auth
        - Nome do pacote do Android (Arquivo AndroidManifest.xml) é o com.exemplo.appnome
        - Apelido do app
        - Baixar arquivo .json e adicionar a pasta app
        - Avança para console
    - Ir em antenticação e selecionar os tipos de autenticaçãoes que serao usadas no seu app'
- Voltar ao https://pub.dev/packages/firebase_auth
- Acessar documentação
- Rodar no terminal do app flutter pub add firebase_core
- ir a no arquivo android/build.gradle e atualizar o buildscript
    - ``` 
        buildscript {
            dependencies {
                // ... other dependencies
                classpath 'com.google.gms:google-services:4.3.8'
            }
        }
        ```
- ir a no arquivo android/app/build.gradle e adicionar ao final do arquivo
    - ``` 
        apply plugin: 'com.google.gms.google-services'
        ```
    - alterar minSdkVersion para 21 ou mais e adicionar ao mesmo mapa o ```multiDexEnabled true```
- ir ao arquivo android/app/src/debug/AndroidManifest.xml
    - Adicionar nova tag ao < manifest xmlns:android
    ```html
        <application android:usesCleartextTraffic="true">
        <!-- possibly other elements -->
        </application>
    ```
- ir ao arquivo android\app\src\main\AndroidManifest.xml
    - Adicionar nova tag ao < application
    ```html
        android:usesCleartextTraffic="true"
    ```
    - ATENCAO A ABERTURA E FECHAMENTO DE TAGS
- Rodar no terminal do app flutter pub add firebase_auth
- Rodar no terminal do app flutter run
- Importar import 'package:firebase_auth/firebase_auth.dart';
- Importar import 'package:firebase_core/firebase_core.dart';
- Colocar no main, antes do runApp 
    - WidgetsFlutterBinding.ensureInitialized();
    - await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
- Para testar se esta funcionando, usar no initState da tela ```FirebaseAuth  nomeVar = FirebaseAuth.instance;```, se nao ocorrer erros no app esta ok
-TIPOS DE ERRO QUE PODE RETORNAR https://firebase.google.com/docs/auth/admin/errors?hl=pt-br



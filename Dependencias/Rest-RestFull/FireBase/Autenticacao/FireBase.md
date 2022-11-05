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
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    firebase_auth: ^3.4.1 #(Ou qualquer outra versão na documentação)
```
- Ou no terminal do app rodar ```flutter pub add firebase_auth```
- Rodar no terminal do app ```flutter pub add firebase_core```
- Rodar no terminal do app ```flutter run```
## Configuração para efetuar cadastro (E-mail e Senha)
- Colocar no main, antes do runApp pois o firebase precisa ser iniciado antes do app
    - ![exemplo](../../../../Img/mainFireBase.jpg)
- Usando um [TextFormField](../../../../Flutter/Widgets/Forms.md)
    - Configure seus controllers para receber o email e senha do usuario
    - Configura botao para chamar a funcao de cadastro
- Exemplo de função que realizará cadastro no firebase
```dart
Future<void>cadastroUser()async{
    final cadastro = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: <TextFieldControllerEmail>.text,
        password:<TextFielControllerSenha>.text
    );
    cadastro.user?.sendEmailVerification(); // Verificação de email valido
}
```
- Se nao ocorrer erros siga para o projeto, caso ocorra refaça o todo processo, ou veja documentação
- Tipos de erros de autenticação [aqui](https://firebase.google.com/docs/auth/admin/errors?hl=pt-br)

## Configuração para efetuar login (Email e Senha)
- Usando um [TextFormField](../../../../Flutter/Widgets/Forms.md)
    - Configure seus controllers para receber o email e senha do usuario
    - Configura botao para chamar a funcao de cadastro
- Exemplo de função que realizará cadastro no firebase
```dart
Future<void>LoginUser()async{
    final credencial = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: <TextFieldControllerEmail>.text,
        password:<TextFielControllerSenha>.text
    );
    final user = cretencial.user;
    if(user != null && !user.emailVerified){
        // Acão apos verificar que usuario nao esta com email verificado
    }else{
        // Ação apos validação de usuario
    }
}
```
## Configurando verificação de usuario logado
- No ```initState(){}``` da aplicação chamar função do firebase
```dart
void initState(){
    FirebaseAuth.instance.authSateChanges().listen((User? user){
        print(user != null); // exibe true ou false
    });
}
```
-   Isto ficara "escutando" ações dentro do firebase
## Recebendo dados do usuario logado
- No ```State``` daa aplicação definir uma variavel do tipo ```User?``` que pertence ao pacote do firebase.
    - Em seguida popular esta variavel na inicialização do aplicativo.
```dart
User? user;
void initState(){
    user = FirebaseAuth.instance.currentUser;
}
```
- Feita a atribução a variavel user é possivel obter dados do usuario como instancia da variavel.
![](../../../../Img/userFirebase.png)

## Fazendo logout do usuario
- Dentro de um ```onPressed``` ou onde desejar chame a funcao do Firebase para efetuar logout.
```dart
Firebase.instance.signOut();
```



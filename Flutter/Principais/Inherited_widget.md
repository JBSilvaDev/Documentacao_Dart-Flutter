# Inherited widget
- Usado para adicionar uma classe peronalizada a arvore de componentes do flutter, podendo assim acessa-la de qualquer ponto.
- Toda estrutura que conter .of(context) é considerada um Inherited widget
- Para acessar contextos de qualquer ponto da aplicação, este contexto deve esta na arvere principal do app (main).
    - Em resumo, o Inherited Widget permite que declaremos um objeto na classe pai (main) e que seus filhos cosigam acessar estes dados.
    - Esta classe (OBJ) sera pai do [MaterialApp](../Principais/MateralApp.md)
- É necessario uma classe model que ira tratar o conteudo do contex podendo assim exibi-lo onde for chamado.
## Criando a classe(OBJETO) model que controla o conteudo do acesso
```dart
class UserModel extends InheritedWidget {
  final String name;

  UserModel({
    required this.name,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant UserModel oldWidget) {
    return name != oldWidget.name
  }

  static UserModel of(BuildContext context) {
    var userModel = context.dependOnInheritedWidgetOfExactType<UserModel>();
    assert(userModel != null, 'UserModel nao existe no BuildContext');
    return userModel!;
  }
}
```
## Explicando o Model
- Classe ira extender o InheritedWidget, passando seus atributos normalmente como visto em [OO](../../Dart/Dart_OO/OO_Em_Pratica/)
- Em seu contrutor se faz necessario adiconar +1 paramentro do tipo widget, pois este parametro ira receber o widget que compoe o aplicativo
    - Ainda no construtor, é necessario implementar o super, assim passando o conteudo de child para o seu pai *(InheritedWidget)*
- Necessario tambem criar um novo metodo booleano de nome updateShouldNotify, este metodo ira retornar se o valor passado é diferente do anterior, vefiricando assim se o widget foi alterado.
- Para conseguir acessar o conteudo deste objeto atravez do .of(context), é necessario um outro metodo, agora estatico que receberar o builder do contexto como paramentro.
    - Dentro deste metodo, uma variavel foi instanciada e recebe em seu conteudo as deependendias do InheritedWidget tipando-as para o modelo da classe
    - Ainda dentro do metodo, é criado uma verificação com assert que confirma se o valor da variavel é diferente de nula
- O metodo InheritedWidget retorna o valor da variaval seguinda de !, isso esta dizendo ao flutter/dart que o valor nao sera nulo.
## Declarando valores do objeto no main
- Como retorno do builder no main o objeto foi invocado, passando cada um dos seus atributos:
    - name: Recebeu uma String
    - child: Recebeu widget [MaterialApp](../Principais/MateralApp.md)
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserModel(
      name: 'Jb silva',
      imgAvatar: 'Link da imagem',
      birthDate: '30/05/1991',
      child: MaterialApp()
```
## Utulização
- Para exibir (recuperar) os dados passados no objeto em outros locais e paginas do aplicativo no arquivo .dart que ira receber estes dados foi criado uma variavel que recebeu o contexto do objeto, assim o objeto pode ser instaciado no local que se fazia necessario
>Declarando variavel no builder da pagina que ira usar o conteudo do objeto
```dart
var user = UserModel.of(context);
```
>Instanciando atributo do objeto
```dart
Text(user.name);
```



# Bindings
- Classe a ser instanciada
```dart
class AuthModel {
  String name;
  String email;
  String curso;
  AuthModel({
    required this.name,
    required this.email,
    required this.curso,
  });
}
```
- Classe inicializadora da instancia é a classe que ira buscar a classe a ser instanciada e disponibiliza-la como dsependencias. Classe que extenda/implementa o Bindings do Getx
```dart
class InitialBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(
    AuthModel(name: 'JB Silva', email: 'jb@gmail.com', curso: 'Jornada GetX'),
   permanent: true,
   );
  }
}
```
- Uma nova tag deve ser adicionada ao ```GetMaterialApp()```
```dart
GetMaterialApp(
  initialBinding: InitialBindings(),
)
```
- A rota no ***getPages*** é definida normalmeente passando seu nome e a pagina a qual ira navegar
```dart
GetPage(
  name: '/rota',
  page: () => InitialBindingPage(),
),
```
- A pagina a qual esta navegando deve conter o ```Get.find()``` da instancia a qual esta passando para ter acesso a seu conteudo
```dart
  Text(Get.find<AuthModel>().name),
  Text(Get.find<AuthModel>().email),
  Text(Get.find<AuthModel>().curso),
```

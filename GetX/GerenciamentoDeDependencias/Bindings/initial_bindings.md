# Bindings

- Classe a ser instanciada:
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

- Classe inicializadora da instância é a classe que irá buscar a classe a ser instanciada e disponibilizá-la como dependência. Uma classe que estende/implementa o `Bindings` do GetX.
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

- Uma nova tag deve ser adicionada ao `GetMaterialApp()`:
```dart
GetMaterialApp(
  initialBinding: InitialBindings(),
)
```

- A rota no `getPages` é definida normalmente, passando seu nome e a página para a qual irá navegar:
```dart
GetPage(
  name: '/rota',
  page: () => InitialBindingPage(),
),
```

- A página para a qual está navegando deve conter o `Get.find()` da instância que está sendo passada para ter acesso ao seu conteúdo:
```dart
Text(Get.find<AuthModel>().name),
Text(Get.find<AuthModel>().email),
Text(Get.find<AuthModel>().curso),
```

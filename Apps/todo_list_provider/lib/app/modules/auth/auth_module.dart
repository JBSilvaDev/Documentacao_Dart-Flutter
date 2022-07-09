import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_page.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';


class AuthModule extends TodoListModule {
  AuthModule():super(
    bindings:[
      ChangeNotifierProvider(create: (context)=> LoginController(userServices: context.read())),
      ChangeNotifierProvider(create: (context)=> RegisterController(userServices: context.read())),
    ],
    routers:{
      '/login':(context) => LoginPage(),
      '/register':(context) => RegisterPage(),
          }
    );
  
}
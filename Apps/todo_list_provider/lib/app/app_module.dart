import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/repositories/user/impl_user_repositories.dart';
import 'package:todo_list_provider/app/repositories/user/user_repositories.dart';
import 'package:todo_list_provider/app/services/user/impl_user_services.dart';
import 'package:todo_list_provider/app/services/user/user_services.dart';

import 'app_widget.dart';
import 'core/auth/auth_provider.dart';


class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (_) => FirebaseAuth.instance),
      Provider(create: (_)=> SqliteConnectionFactory(),lazy: false,),
        Provider<UserRepositories>(create: (context)=> ImplUserRepositories(firebaseAuth: context.read(), connectionFactory: context.read()),
        ),
        Provider<UserServices>(create: (context)=>ImplUserServices(userRepository: context.read())),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseAuth: context.read(), userServices: context.read())..loadListener(),
        lazy: false,),
    
    ],
    child: AppWidget(),);
  }
}

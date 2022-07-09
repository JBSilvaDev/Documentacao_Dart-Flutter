import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/core/navigator/todo_list_navigator.dart';


import '../../services/user/user_services.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserServices _userServices;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserServices userServices,
  })  : _firebaseAuth = firebaseAuth,
        _userServices = userServices;

  Future<void> logout() => _userServices.logout();

  User? get user => _firebaseAuth.currentUser;

  void loadListener() {
    //logout(); //Usado para deslogar do app sempre que abrir
    _firebaseAuth.userChanges().listen((_) => notifyListeners());
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        TodoListNavigator.to
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}

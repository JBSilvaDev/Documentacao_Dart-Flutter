import 'package:flutter/material.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier(false);
  String? _login;
  String? _pass;
  set login(String login) => _login = login;
  set pass(String pass) => _pass = pass;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    if (_login == 'admin' && _pass == '123') {
      return true;
    } else {
      return false;
    }
  }
}

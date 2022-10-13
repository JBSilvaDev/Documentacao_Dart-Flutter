// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class LoginComponent extends StatelessWidget {
  LoginController controller;
  TextEditingController loginEC;
  TextEditingController passEC;
   LoginComponent({
    Key? key,
    required this.controller,
    required this.loginEC,
    required this.passEC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.inLoader,
      builder: ((context, inLoader, child) {
        if (inLoader) {
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton(
            onPressed: () {
              controller.login = loginEC.text;
              controller.pass = passEC.text;
              controller.auth().then((value) {
                if (value) {
                  Navigator.pushReplacementNamed(context, '/homelogin');
                } else {
                  SnackBar snackBar =
                      const SnackBar(content: Text('Falha ao realizar login'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            },
            child: const Text('Login'),
          );
        }
      }),
    );
  }
}

import 'package:app_rascunhos/login/components/login_component.dart';
import 'package:app_rascunhos/login/controller/login_controller.dart';
import 'package:app_rascunhos/login/widget/custon_textfiled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginController controller = LoginController();
  final loginEC = TextEditingController();
  final passEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loginEC.text = 'admin';
    passEC.text = '123';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.people_alt,
              size: 90,
            ),
            CustomTextField(
              controllerField: loginEC,
              label: 'Login',
            ),
            CustomTextField(
              controllerField: passEC,
              label: 'Senha',
              obscureTex: true,
            ),
            const SizedBox(
              height: 20,
            ),
            LoginComponent(
                controller: controller, loginEC: loginEC, passEC: passEC)
          ],
        ),
      ),
    );
  }
}

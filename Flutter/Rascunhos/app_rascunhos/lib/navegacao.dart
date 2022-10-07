// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Navegacao extends StatelessWidget {
  String? name;
  Navegacao({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments ?? 'Nao informado';
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? args as String),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Voltar'),
          onPressed: () {
            Navigator.pop(context, 'Voltei');
          },
        ),
      ),
    );
  }
}

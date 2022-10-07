// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';

class BotaoPersonalizado extends StatelessWidget {
  final VoidCallback aoApertar;
  final String titulo;
  final double? tamanho;
  final bool desabilitar;

  const BotaoPersonalizado({
    Key? key,
    required this.aoApertar,
    required this.titulo,
    this.tamanho,
    this.desabilitar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: desabilitar ? null : aoApertar,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.red),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) return Colors.red;
          if (states.contains(MaterialState.pressed)) return Colors.blue;
          return Colors.green;
        }),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        textStyle: MaterialStateProperty.resolveWith((context) {
          if (context.contains(MaterialState.pressed)) {
            return const TextStyle(fontSize: 20);
          } else {
            return TextStyle(fontSize: tamanho);
          }
        }),
      ),
      child: Text(titulo),
    );
  }
}

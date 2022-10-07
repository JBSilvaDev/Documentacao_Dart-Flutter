import 'dart:math';

import 'package:app_rascunhos/botao_personalizado.dart';
import 'package:flutter/material.dart';

class GerenciaEstadoSetState extends StatefulWidget {
  const GerenciaEstadoSetState({Key? key}) : super(key: key);

  @override
  State<GerenciaEstadoSetState> createState() => _GerenciaEstadoSetStateState();
}

class _GerenciaEstadoSetStateState extends State<GerenciaEstadoSetState> {
  int valorAleatorio = 0;
  ramdom() async {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        valorAleatorio = Random().nextInt(10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SetState'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Valor atual: $valorAleatorio',
                style: const TextStyle(fontSize: 25),
              ),
              BotaoPersonalizado(aoApertar: ramdom, titulo: 'Start')
            ],
          ),
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import 'botao_personalizado.dart';

class GerenciaEstadoValueNotifier extends StatelessWidget {
  GerenciaEstadoValueNotifier({Key? key}) : super(key: key);
  ValueNotifier<int> valorAleatorio = ValueNotifier(0);

  ramdom() async {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));

      valorAleatorio.value = Random().nextInt(10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Value Notifier'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: valorAleatorio,
                  builder: ((__, value, _) {
                    return Text(
                      'Valor atual: $value',
                      style: const TextStyle(fontSize: 25),
                    );
                  })),
              BotaoPersonalizado(aoApertar: ramdom, titulo: 'Start')
            ],
          ),
        ));
  }
}

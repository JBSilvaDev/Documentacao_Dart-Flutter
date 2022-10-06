import 'dart:math';
import 'package:flutter/material.dart';

class StatefulBuilderPage extends StatelessWidget {
  const StatefulBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int texto = 1;
    return  StatefulBuilder(
        builder: ((context, setStateLocal) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto.toString(),
                style: const TextStyle(fontSize: 50, color: Colors.red),
              ),
              ElevatedButton(
                onPressed: () {
                  texto = Random().nextInt(10);
                  // Ira atualizar somente os dados dentro do StatefulBuilder e nao toda a pagina
                  setStateLocal(() {});
                },
                child: const Text('Botao'),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Voltar'),
              ),
            ],
          );
        }),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class StatefulBuilderPage extends StatelessWidget {
  const StatefulBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int texto = 1;
    return StatefulBuilder(
      builder: ((context, setStateLocal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                texto = Random().nextInt(10);
                // Ira atualizar somente os dados dentro do StatefulBuilder e nao toda a pagina
                setStateLocal(() {});
              },
              child: const Text('Botao'),
            ),
          ],
        );
      }),
    );
  }
}

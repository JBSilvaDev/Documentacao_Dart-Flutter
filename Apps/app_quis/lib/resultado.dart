import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() apos_reiniciarQuiz;

  Resultado(this.pontuacao, this.apos_reiniciarQuiz);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Voçê é bom";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          child: const Text('Reiniciar?'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18, color: Colors.white))),
          onPressed: apos_reiniciarQuiz,
        )
      ],
    );
  }
}

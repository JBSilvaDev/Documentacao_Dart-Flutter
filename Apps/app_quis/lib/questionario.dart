import './resposta.dart';
import 'package:flutter/material.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoresponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoresponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
           return Resposta(resp['texto'].toString(), 
           () => quandoresponder(int.parse(resp['pontuacao'].toString()))
           );
           }).toList()
      ],
    );
  }
}

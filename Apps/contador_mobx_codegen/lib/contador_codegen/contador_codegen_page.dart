import 'package:contador_mobx_codegen/contador_codegen/controller_codegen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ContadorCodeGenPage extends StatefulWidget {
  ContadorCodeGenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodeGenPage> createState() => _ContadorCodeGenPageState();
}

class _ContadorCodeGenPageState extends State<ContadorCodeGenPage> {
  final controller = ControllerCodeGen();
  final reactionsDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    // reacao 1 - variavel que é executada sempre que a tela é iniciada ou quando um dos seus observaveis é alterado
    final autoDispose = autorun((_) {
      print('=' * 50);
      print(controller.fullName1.nome);
      print(controller.fullName1.sobrenome);
    });

    reactionsDisposer.add(autoDispose);

    // reacao 2 - variavel que é executada somente quando seu observavel é alterado
    final reactionDispose = reaction((_) => controller.counter, (counter) {
      print('-' * 50);
      print(counter);
    });

    reactionsDisposer.add(reactionDispose);

    // reacao 3 - variavel que é executada somente quando a condição passada for atendida executa somente uma vez apos atender a condição
    final whenDispose = when((_) => controller.counter > 2, () {
      print('.' * 50);
      print(controller.counter);
    });
    reactionsDisposer.add(whenDispose);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reactionsDisposer.forEach((reacaoes) => reacaoes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador codegen MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                controller.nomeCompleto1,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              );
            }),
            Observer(builder: (_) {
              return Text(
                controller.saudacao,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ); //faz o mesmo dos text acima
            }),
            Observer(
              builder: (_) => Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            TextButton.icon(
                onPressed: (() {
                  controller.trocaNome();
                }),
                icon: Icon(Icons.remove),
                label: const Text('Alterar nome')),
            TextButton.icon(
                onPressed: (() {
                  controller.voltarNome();
                }),
                icon: Icon(Icons.compare_arrows),
                label: const Text('Voltar nome')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incremento();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

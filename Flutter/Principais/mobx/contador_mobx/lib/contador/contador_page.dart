import 'package:calcular_imc_mobx/contador/contador_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();

  ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(controller.fullName1, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),);
            }),
            Observer(builder: (_) {
              return Text(controller.fullName2.nome + controller.fullName2.sobrenome, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),); //faz o mesmo dos text acima
            }),
            Observer(builder: (_) {
              return Text(controller.saudacao, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),); //faz o mesmo dos text acima
            }),
            Observer(
              builder: (_) => Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            TextButton.icon(
                onPressed: (() {
                  controller.resetIncrement();
                }),
                icon: Icon(Icons.remove),
                label: const Text('Reset'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

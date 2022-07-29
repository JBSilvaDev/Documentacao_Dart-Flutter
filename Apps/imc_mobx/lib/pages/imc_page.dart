import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../widgets/imc_gauge.dart';
import '../controller/imc_controller.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final reactionsDispose = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    var erroIMC = reaction<bool>((_) => controller.riscoVida, (erro) {
      if (erro == true) {
        final snackBar = SnackBar(
          content: Text(controller.gravidade ?? 'Erro'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    reactionsDispose.add(erroIMC);
  }

  @override
  void dispose() {
    super.dispose();
    reactionsDispose.forEach((reaction) => reaction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Calculadora de IMC'),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Observer(builder: (_) {
                  return ImcGauge(imc: controller.imc);
                }),
                const SizedBox(
                  height: 5,
                ),
                Observer(builder: (_) {
                  if (controller.imc != 0) {
                    return Text(
                        'Seu IMC é ${controller.imc.toStringAsFixed(2)}');
                  }
                  return const Text('Informe seus dados abaixo!');
                }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: pesoEC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso' ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 0,
                        turnOffGrouping: true,
                      ),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: alturaEC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true,
                      ),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR',
                          decimalDigits: 2,
                        );
                        double peso = formatter.parse(pesoEC.text) as double;
                        double altura =
                            formatter.parse(alturaEC.text) as double;

                        controller.calcularImc(peso: peso, altura: altura);
                      }
                    },
                    child: const Text('Calcular IMC'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

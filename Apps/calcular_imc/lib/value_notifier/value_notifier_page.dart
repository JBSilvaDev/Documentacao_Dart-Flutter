import 'dart:math';
import 'package:calcular_imc/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';


class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = ValueNotifier(0.0);

  Future<void> _calcularIMC(
      {required double peso, required double altura}) async {
    imc.value = 0.0;

    //await Future.delayed(const Duration(milliseconds: 800));

    imc.value = peso / pow(altura, 2);
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Value Notifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ValueListenableBuilder<double>(
                    valueListenable: imc,
                    builder: (_, imcValue, __) {
                      return Column(
                        children: [
                          ImcGauge(imc: imcValue),
                          Text(
                            'Seu IMC é de: ${imc.value.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Peso'),
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
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura'),
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

                        _calcularIMC(peso: peso, altura: altura);
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

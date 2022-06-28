import 'package:calcular_imc/block_pattern/block_patter_controller.dart';
import 'package:calcular_imc/block_pattern/imc_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:calcular_imc/widgets/imc_gauge.dart';

class BlockPatternPage extends StatefulWidget {
  const BlockPatternPage({Key? key}) : super(key: key);

  @override
  _BlockPatternPageState createState() => _BlockPatternPageState();
}

class _BlockPatternPageState extends State<BlockPatternPage> {
  final controller = BlockPatterController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //final imc = double.parse(pesoEC.text) / pow(double.parse(alturaEC.text), 2);

  Future<void> _calcularIMC(
      {required double peso, required double altura}) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block Patterm'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder<ImcState>(
                    stream: controller.imcOut,
                    builder: (context, snapshot) {
                      var imc = 0.0;
                      imc = snapshot.data?.imc ?? 0;
                      return ImcGauge(imc: imc);
                    }),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: snapshot.data is IMCStateLoading,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    var imc = snapshot.data?.imc ?? 0;
                    return Text(
                      'Seu IMC é de: ${imc.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
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

                        controller.calcularIMC(peso: peso, altura: altura);
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

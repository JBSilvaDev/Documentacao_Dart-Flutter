import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Home(), debugShowCheckedModeBanner: false // Remove selo debug
      ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variaveis que controlam os campos de digitação
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  // Verificador se os campos estao preenchidos
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  // Botao recarregar
  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  // Funcao do botao calcular
  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"), // Titulo do app
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton( // Botao recarregar
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Faz tela ficar dinamica (caso telas pequenas o teclado cubra os campos é possivel rolar
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_pin, // Boneco pessoa
                  size: 120.0, color: Colors.lightBlue),
              TextFormField( // Campo de texto para peso
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.lightBlue)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
                controller: weightController, // controlador variavel no topo
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField( // Campo de texto para altura
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.lightBlue)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
                controller: heightController, // controlador variavel no topo
                validator: (value) {
                  if (value == null || value.isEmpty) { // msg se campo tiver vazio
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding( // distanciamento
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton( // Botao calcular
                    onPressed: () {
                      if (_formKey.currentState!.validate()) { // msg se campo tiver vazio
                        _calculate();
                      }
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                ),
              ),
              Text( // resultado do informado
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.lightBlue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'models/transation.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  final _transitions = [
    Transaction(
      id: 't1',
      title: 'Novo Tenis',
      value: 300.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.green,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transitions.map((tr){
              return Card(
                child: Text(tr.title),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

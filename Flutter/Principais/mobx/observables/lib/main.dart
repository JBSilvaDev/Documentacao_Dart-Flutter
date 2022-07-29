import 'package:contador_mobx_codegen/future/future_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'list/observable_list_page.dart';
import 'modelo_observado/modelo_observable_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/obslistpage': (context) => ObservableListPage(),
        '/modeloobslistpage': (context) => ModeloObservablePage(),
        '/futureobslistpage': (context) => FuturePage(),
      },
    );
  }
}


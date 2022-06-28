import 'package:calcular_imc/home_page.dart';
import 'package:calcular_imc/setState/imc_setstate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Default State Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(_) => const HomePage(),
        '/imc_setState_page':(_) => const ImcSetstatePage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:imc_mobx/pages/imc_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Created by: JB Silvaaa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ImcPage()
        );
  }
}

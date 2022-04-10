import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, foregroundColor: Colors.black),
      ),
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}

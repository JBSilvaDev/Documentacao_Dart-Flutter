import 'package:app_rascunhos/StatefulBuilderPage.dart';
import 'package:app_rascunhos/home_page.dart';
import 'package:app_rascunhos/pageview_page.dart';
import 'package:app_rascunhos/pageview_page_drawer.dart';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/stetefulbuilder':(context) => StatefulBuilderPage(),
        '/pageview':(context) => PageviewPage(),
        '/pageviewdrawer':(context) => PageviewPageDrawer(),
      },
    );
  }
}

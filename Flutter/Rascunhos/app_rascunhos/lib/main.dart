import 'package:app_rascunhos/StatefulBuilderPage.dart';
import 'package:app_rascunhos/api_dio/pages/home_detalhes.dart';
import 'package:app_rascunhos/api_dio/pages/home_page_login_api.dart';
import 'package:app_rascunhos/api_dio/pages/login_page_api.dart';
import 'package:app_rascunhos/api_dio/splash_page.dart';
import 'package:app_rascunhos/botao_page.dart';
import 'package:app_rascunhos/gerencia_estado_setState.dart';
import 'package:app_rascunhos/gerencia_estado_valueNotifier.dart';
import 'package:app_rascunhos/home_page.dart';
import 'package:app_rascunhos/navegacao.dart';
import 'package:app_rascunhos/pageview_page.dart';
import 'package:app_rascunhos/pageview_page_drawer.dart';
import 'package:app_rascunhos/login/pages/home_page_login.dart';
import 'package:app_rascunhos/login/pages/login_page.dart';
import 'package:app_rascunhos/login/splash_page.dart';
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
        '/': (context) => const HomePage(),
        '/stetefulbuilder': (context) => const StatefulBuilderPage(),
        '/pageview': (context) => const PageviewPage(),
        '/pageviewdrawer': (context) => const PageviewPageDrawer(),
        '/navegacao': (context) => Navegacao(),
        '/botao': (context) => const BotaoPage(),
        '/setstate': (context) => const GerenciaEstadoSetState(),
        '/valuenotifier': (context) => GerenciaEstadoValueNotifier(),
        '/splash': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/homelogin': (context) => const HomePageLogin(),
        '/homeloginapi': (context) => const HomePageLoginApi(),
        '/loginapi': (context) => LoginPageApi(),
        '/splashapi': (context) => const SplashPageApi(),
        '/homedetalhes': (context) =>  HomeDetalhes(),
      },
    );
  }
}

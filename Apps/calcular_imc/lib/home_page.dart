import 'package:calcular_imc/block_pattern/block_pattern_page.dart';
import 'package:calcular_imc/change_notifier/change_notifier_page.dart';
import 'package:calcular_imc/setState/imc_setstate_page.dart';
import 'package:calcular_imc/value_notifier/value_notifier_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _goToPage(context, const ImcSetstatePage());
              },
              child: const Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(context, const ValueNotifierPage());
              },
              child: const Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(context, const ChangeNotifierPage());
              },
              child: const Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(context, const BlockPatternPage());
              },
              child: const Text('Bloc Pattern (Strems)'),
            ),
          ],
        ),
      ),
    );
  }
}

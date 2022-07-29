import 'package:contador_mobx_codegen/future/future_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final controller = FutureController();

  @override
  void initState() {
    controller.buscarNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Observables Future'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.buscarNome();
          },
          child: Icon(Icons.refresh),
        ),
        body: Observer(builder: (_) {
          return FutureBuilder<String>(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return SizedBox.shrink();
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(snapshot.data!),
                    );
                  }
                  return Center(
                    child: const Text('Nome nao encontrado'),
                  );
              }
            },
            future: controller.nomeFuture,
          );
        }));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_rascunhos/api_dio/models/post_model.dart';
import 'package:flutter/material.dart';

class HomeDetalhes extends StatelessWidget {
  const HomeDetalhes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Container(
          
        color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              'ID: ${args.id}',
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Conteudo: ${args.body}',style: const TextStyle(fontSize: 20,  color: Colors.black,), textAlign: TextAlign.center,),
          ]),
        ),
      ),
    );
  }
}

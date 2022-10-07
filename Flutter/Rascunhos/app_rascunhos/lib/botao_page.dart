import 'package:app_rascunhos/botao_personalizado.dart';
import 'package:flutter/material.dart';

class BotaoPage extends StatelessWidget {

  const BotaoPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Bota personalizado page'),),
           body: Center(
             child: BotaoPersonalizado(
              desabilitar: false,
              tamanho: 18,
              aoApertar: (){}, 
              titulo: 'Botao Personalizado',
              ),
           )
       );
  }
}
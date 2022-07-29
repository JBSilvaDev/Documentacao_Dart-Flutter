import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home Page'),),
           body: Center(child: Column(
            children: [
              TextButton(onPressed: () => Navigator.of(context).pushNamed('/obslistpage'), child: Text('Observable List')),
              SizedBox(height: 10,),
              TextButton(onPressed: () => Navigator.of(context).pushNamed('/modeloobslistpage'), child: Text('Modelo Observable')),
              SizedBox(height: 10,),
              TextButton(onPressed: () => Navigator.of(context).pushNamed('/futureobslistpage'), child: Text('Future Observable')),
              SizedBox(height: 10,),
            ],
           )),
       );
  }
}
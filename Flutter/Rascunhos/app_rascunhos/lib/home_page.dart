import 'package:app_rascunhos/navegacao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginas para teste'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/stetefulbuilder'),
            child: const Text('StatefulBuilder', style: TextStyle(color: Colors.black, fontSize: 20, ),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pageview'),
            child: const Text('PageviewPage', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pageviewdrawer'),
            child: const Text('PageviewPageDrawer', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          // Por construtor
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => Navegacao(name: 'Rota Construtor')))),
            child: const Text('Navegação Construtor', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          // Por rota nomeada
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/navegacao', arguments: 'Rota Nomeada')
            .then((value) => print(value)),
            child: const Text('Navegação Nomeda', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/botao'),
            child: const Text('Botao Page', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/setstate'),
            child: const Text('Set State', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/valuenotifier'),
            child: const Text('Value Notifier', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
   
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/splash'),
            child: const Text('Login Page  Splash', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/splashapi'),
            child: const Text('Login API Splash', style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
          ),
        ],
        
      ),
    );
  }
}

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
        crossAxisCount: 2,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/stetefulbuilder'),
            child: const Text('StatefulBuilder', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pageview'),
            child: const Text('PageviewPage', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pageviewdrawer'),
            child: const Text('PageviewPageDrawer', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          // Por construtor
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => Navegacao(name: 'Rota Construtor')))),
            child: const Text('Navegação Construtor', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          // Por rota nomeada
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/navegacao', arguments: 'Rota Nomeada')
            .then((value) => print(value)),
            child: const Text('Navegação Nomeda', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/botao'),
            child: const Text('Botao Page', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
        ],
        
      ),
    );
  }
}

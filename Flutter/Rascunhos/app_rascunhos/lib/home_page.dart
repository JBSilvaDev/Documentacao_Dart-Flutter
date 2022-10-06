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
        ],
      ),
    );
  }
}

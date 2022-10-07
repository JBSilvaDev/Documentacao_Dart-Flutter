import 'package:app_rascunhos/StatefulBuilderPage.dart';
import 'package:flutter/material.dart';

class PageviewPage extends StatefulWidget {
  const PageviewPage({Key? key}) : super(key: key);

  @override
  State<PageviewPage> createState() => _PageviewPageState();
}

class _PageviewPageState extends State<PageviewPage> {
  final PageController _controller = PageController();

  int varIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _controller,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Ola Mundo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 180,
                    child: const Center(child: Text('Container 1')),
                  ),
                  Container(
                    color: Colors.purple,
                    height: 100,
                    width: 180,
                    child: const Center(child: Text('Container 2')),
                  ),
                ],
              ),
              
              FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              )
            ],
          ),
          Container(
            color: Colors.yellow,
            child: const Center(child: Text('Container 1')),
          ),
          Container(
            color: Colors.pink,
            child: const Center(child: Text('Container 1')),
          ),
          const StatefulBuilderPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: varIndex,
        onTap: (int index) {
          setState(() {
            varIndex = index;
          });
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.slowMiddle,
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp), label: 'Item 1'),
          BottomNavigationBarItem(
            label: 'Item 2',
            icon: Icon(Icons.local_laundry_service_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Item 3',
            icon: Icon(Icons.local_laundry_service_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Item 4',
            icon: Icon(Icons.local_laundry_service_sharp),
          ),
        ],
      ),
    );
  }
}

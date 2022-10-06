import 'package:flutter/material.dart';

class PageviewPageDrawer extends StatefulWidget {
  const PageviewPageDrawer({Key? key}) : super(key: key);

  @override
  State<PageviewPageDrawer> createState() => _PageviewPageDrawerState();
}

class _PageviewPageDrawerState extends State<PageviewPageDrawer> {
  final PageController _controller = PageController();

  int varIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('JB'),
              accountEmail: Text('jb@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Icon(
                  Icons.android,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                _controller.jumpToPage(0);
                Navigator.pop(context);
              },
              title: const Text('Page 1'),
              trailing: const Icon(Icons.pages),
            ),
            ListTile(
              onTap: () {
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.slowMiddle,
                );
                Navigator.pop(context);
              },
              title: const Text('Page 2'),
              trailing: const Icon(Icons.pages),
            ),
            ListTile(
              onTap: () {
                _controller.jumpToPage(2);
                Navigator.pop(context);
              },
              title: const Text('Page 3'),
              trailing: const Icon(Icons.pages),
            ),
          ],
        ),
      ),
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
        ],
      ),
    );
  }
}

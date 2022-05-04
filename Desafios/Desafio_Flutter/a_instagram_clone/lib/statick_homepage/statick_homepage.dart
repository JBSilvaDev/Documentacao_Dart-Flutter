// ignore_for_file: prefer_const_constructors

import 'package:a_instagram_clone/appBar/appBar.dart';
import 'package:a_instagram_clone/body/users.dart';
import 'package:flutter/material.dart';

class StatickHomepage extends StatefulWidget {
  const StatickHomepage({Key? key}) : super(key: key);

  @override
  State<StatickHomepage> createState() => _StatickHomepageState();
}

class _StatickHomepageState extends State<StatickHomepage> {
  final double circle = 75;
  int indice = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indice,
          onTap: (i) {
            setState(() {
              indice = i;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
              backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: '',
              backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: '',
              backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(backgroundImage: AssetImage('assets/image/1.jpg'),),
              label: '',
              backgroundColor: Colors.black87,
            ),
          ]),
      appBar: Appbars(),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Users(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('paulo.serra45',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 213),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.linear_scale,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image(image: AssetImage('assets/image/campanhavacina.jpg')),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.contact_support,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 170),
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                child: Text(
                  '1.463 Curtidas',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 5),
                child: Text(
                  'paulo.serra45 => GESTANTES, A 2ª DOSE É ESSENCIAL PARA SUA PROTEÇÃO...mais',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                  'Ver todos os 73 comentários',
                  style: TextStyle(color: Colors.white24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

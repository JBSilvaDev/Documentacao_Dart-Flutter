import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/appbar/app.dart';
import 'package:flutter_instagram_clone/corpo/corpo_cabecario.dart';
import 'package:flutter_instagram_clone/corpo/corpo_central.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarN(),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CorpoCabecarios(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.red, Colors.black, Colors.blue]),
                      ),
                      child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/imagens/1.jpg')),
                    ),
                  ),
                  const Text('JB Silva', style: TextStyle(color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
              CorpoCentral(),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 5, right: 20),
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, right: 20),
                    child: Icon(Icons.voice_chat, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, right: 20),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 220),
                    child: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text('1.500 curtidas', style: TextStyle(color: Colors.white),),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Text(
                      'JB Silva : Gestantes, a 2ª dose é essencial \npara sua proteção ...',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                   Text('Ver todos os 73 comentarios', style: TextStyle(color: Colors.white),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

        
/*
AppBar(
        title: const Text('Instagram',),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Icon(Icons.queue),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Icon(Icons.favorite),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Icon(Icons.message),
          ),
        ],
      ),

      */
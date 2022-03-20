import 'package:flutter/material.dart';

class CorpoCabecarios extends Column {
  CorpoCabecarios({
    final dimensoes = 70.0,
    Key? key,
    children,
  }) : super(key: key, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: dimensoes,
                        height: dimensoes,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.blue
                                ])),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/imagens/1.jpg',
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Icon(Icons.cloud, color: Colors.blue),
                    ),
                    const Positioned(
                      bottom: -3,
                      right: 10,
                      child: Text(
                        'Usuario 1',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: dimensoes,
                        height: dimensoes,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.blue
                                ])),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/imagens/2.jpg',
                          ),
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 15,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                        height: 15,
                        width: 30,
                        //color: Colors.red,
                        child: const Center(
                          child: Text('Live', 
                          style: TextStyle(color: Colors.white),),),),
                    ),
                    const Positioned(
                      bottom: -3,
                      right: 10,
                      child: Text(
                        'Usuario 2',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: dimensoes,
                        height: dimensoes,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.blue
                                ])),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/imagens/3.jpg',
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: -3,
                      right: 10,
                      child: Text(
                        'Usuario 3',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: dimensoes,
                        height: dimensoes,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.blue
                                ])),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/imagens/4.jpg',
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: -3,
                      right: 10,
                      child: Text(
                        'Usuario 3',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: dimensoes,
                        height: dimensoes,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.blue
                                ])),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/imagens/5.jpg',
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: -3,
                      right: 10,
                      child: Text(
                        'Usuario 3',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]);
}

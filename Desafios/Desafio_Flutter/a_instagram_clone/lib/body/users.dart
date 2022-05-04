import 'package:flutter/material.dart';

const double circle = 75;

class Users extends Container {
  Users({
    Key? key,
    Color? color,
    Widget? child,
  }) : super(
          key: key,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: circle,
                              height: circle,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.purple,
                                  Colors.black,
                                  Colors.red
                                ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/1.jpg'),
                              ),
                            ),
                            const SizedBox(
                                child: Align(
                                    child: Text(
                              'Seu Story',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            )))
                          ],
                        ),
                        Positioned(
                          bottom: 18,
                          right: 12,
                          child: Container(
                              width: 25,
                              height: 25,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Icon(
                                    Icons.hotel_class,
                                    color: Colors.white,
                                    size: 15,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: circle,
                              height: circle,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.purple,
                                ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/2.jpg'),
                              ),
                            ),
                            const SizedBox(
                                child: Align(
                                    child: Text(
                              'ricardodomelo',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            )))
                          ],
                        ),
                        Positioned(
                          bottom: 16,
                          right: 14,
                          child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.purple,
                                  Colors.pink,
                                  Colors.red
                                ]),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'Ao vivo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: circle,
                              height: circle,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.yellow,
                                  Colors.orange,
                                ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/3.jpg'),
                              ),
                            ),
                            const SizedBox(
                                child: Align(
                                    child: Text(
                              'dieegosf',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            )))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: circle,
                              height: circle,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.yellow,
                                  Colors.orange,
                                ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/5.jpg'),
                              ),
                            ),
                            const SizedBox(
                              child: Align(
                                child: Text(
                                  'valeskabruzzi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: circle,
                              height: circle,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.red,
                                  Colors.black,
                                  Colors.yellow,
                                  Colors.orange,
                                ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/4.jpg'),
                              ),
                            ),
                            const Text(
                              'codigo',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}

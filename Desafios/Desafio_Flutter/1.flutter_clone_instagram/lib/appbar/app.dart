import 'package:flutter/material.dart';

class AppbarN extends AppBar {
  AppbarN(
      {Key? key,
      Widget title = const Text(
        'Instagram',
        style:
            TextStyle(color: Colors.white, fontFamily: 'Satisfy', fontSize: 35),
      ),
      List<dynamic> actions = const []})
      : super(
          key: key,
          title: title,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Icon(Icons.queue, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Icon(Icons.favorite_border, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Icon(Icons.message, color: Colors.white),
            ),
          ],
        );
}

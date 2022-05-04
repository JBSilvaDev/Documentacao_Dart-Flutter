import 'package:flutter/material.dart';

class Appbars extends AppBar {
  Appbars(
      {Key? key,
      Color? backgroundColor,
      Widget? title,
      List<dynamic> actions = const []})
      : super(
            key: key,
            backgroundColor: Colors.black,
            title: const Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Satisfy', fontSize: 33),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline_rounded))),
              Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border))),
              Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mark_unread_chat_alt)))
            ]);
}

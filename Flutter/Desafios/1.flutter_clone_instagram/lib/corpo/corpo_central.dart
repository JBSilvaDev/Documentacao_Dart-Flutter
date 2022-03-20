import 'package:flutter/material.dart';

class CorpoCentral extends Container {
  CorpoCentral({
    Key? key,
    width,
    height,
    decoration,
  }) : super(key: key,
    width: 400,
    height: 350,
    decoration: const BoxDecoration(
              image:  DecorationImage(image: AssetImage('assets/imagens/imgPrincipal.jpg'))
            ), );
}

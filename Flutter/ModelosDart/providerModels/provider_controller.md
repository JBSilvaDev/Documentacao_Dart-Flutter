```dart
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String nome = 'Nome';
  String imgAvatar =
      'https://s1.static.brasilescola.uol.com.br/be/conteudo/images/imagem-em-lente-convexa.jpg';
  String aniversario = 'Data';

  void alterarDados() {
    nome = 'JULIANO';
    imgAvatar = 'https://avatars.githubusercontent.com/u/75276203?s=96&v=4';
    aniversario = '30.05.1991';

    notifyListeners();
  }

  void alterarNome() {
    nome = 'JB Silva';
    notifyListeners();
  }
}

````
# Menu lateral
## Drawer
- É um botão de menu que fica ao lado esquerdo da tela e pode receber botoes com funcoes, sendo ativado pelo clique
- [Documentação](https://api.flutter.dev/flutter/material/Drawer-class.html)
- Compoe:
    - > Filho, paramentro que determina conteudo do drawer
        - child: Recebe um outro widget
>Para configurar cabeçalhos usar em um Column ou ListView:
```dart
Drawer(
      child: ListView(
        children: [
            DrawerHeader(
                decoration:BoxDecoration()
                child: Widget()
                );
```
# endDrawer
- É um menu que fica ao lado direto da tela e pode receber botoes com funcoes, sendo ativado pelo arrastar
- [Documentação](https://api.flutter.dev/flutter/material/Drawer-class.html)
- Compoe:
    - > Filho, paramentro que determina conteudo do drawer
        - child: Recebe um outro widget
# Menu lateral
## Drawer
- É um botão de menu que fica à esquerda da tela e pode conter botões com funções, sendo ativado quando clicado.
- [Documentação](https://api.flutter.dev/flutter/material/Drawer-class.html)
- Composição:
    - Filho: parâmetro que determina o conteúdo do drawer.
        - child: recebe um outro widget.
        
Para configurar cabeçalhos, utilize um Column ou ListView da seguinte maneira:
```dart
Drawer(
      child: ListView(
        children: [
            DrawerHeader(
                decoration: BoxDecoration(),
                child: Widget(),
            ),
        ],
      ),
);
```

# endDrawer
- É um menu que fica à direita da tela e pode conter botões com funções, sendo ativado ao ser arrastado.
- [Documentação](https://api.flutter.dev/flutter/material/Drawer-class.html)
- Composição:
    - Filho: parâmetro que determina o conteúdo do drawer.
        - child: recebe um outro widget.
# Extensão Get Context
- É uma extensão usada para responsividade através do contexto da página ```.responsiveValue()```.
  - Com base no tamanho da tela de exibição, é possível determinar se é um smartwatch, celular, tablet ou desktop, e definir um layout específico para cada um deles.
> Método de uso:
```dart
context.responsiveValue(
  watch: Container(
    width: context.width,
    height: 200,
    color: Colors.grey,
    child: const Center(child: Text('Você está em um smartwatch')),
  ),
  mobile: Container(
    width: context.width,
    height: 200,
    color: Colors.green,
    child: const Center(child: Text('Você está em um celular')),
  ),
  tablet: Container(
    width: context.width,
    height: 200,
    color: Colors.purple,
    child: const Center(child: Text('Você está em um tablet')),
  ),
  desktop: Container(
    width: context.width,
    height: 200,
    color: Colors.red,
    child: const Center(child: Text('Você está em um desktop')),
  ),
)
```
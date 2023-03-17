# Get Context Extension
- É uma extension usada para resposividade atravez do contexto da pagina ```.responsiveValue()```
  - Com base no tamanho da tela de exibição é possivel determinar se é smartwath, mobile, tablet ou desktop, e determinar uma exibição para cada um deles.
> Metodo de uso:
```dart
context.responsiveValue(
  watch: Container(
      width: context.width,
      height: 200,
      color: Colors.grey,
      child: const Center(child: Text('Voce esta em um smartwatch'))
  ),
  mobile: Container(
    width: context.width,
    height: 200,
    color: Colors.green,
    child: const Center(child: Text('Voce esta em um celular')),
  ),
  tablet: Container(
    width: context.width,
    height: 200,
    color: Colors.purple,
    child: const Center(child: Text('Voce esta em um tablet')),
  ),
  desktop: Container(
      width: context.width,
      height: 200,
      color: Colors.red,
      child: const Center(child: Text('Voce esta em um desktop'))
  ),
)
# GetX Responsive View
- Usado para responsividade em telas com base nas suas dimenções
  - É necessario a pagina extender o ```GetResponsiveView```, se necessario pasar a controller da pagina `<Controller>`
  - ```dart
    class GetResponsiveViewPage extends GetResponsiveView<Controller> {}
    ```
- É passado dentro do super no settings do contrutor da pagina as configurações das dimenções da pagina, com o ```ResponsiveScreenSettings()```, que pode conter ou nao as dimenções, caso os valores nao seja passados ira assumir os valores padrão da classe.
> Exemplo de contrutor de pagina
```dart
GetResponsiveViewPage({Key? key})
    : super(
          key: key,
          settings: const ResponsiveScreenSettings(
            tabletChangePoint:
                800, // Define damanhos para configuração se é tablet ou desktop
            desktopChangePoint:
                1400, // Define damanhos para configuração se é tablet ou desktop
          ));
```
- Feito as alterações, não é mais possivel fazer o build de forma comum, atravez do BuilContext, agora cada tipo de tela deve ser configurada separadamente com suas respectivas configurações.
```dart
@override
  Widget? desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get View Page'),
      ),
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(child: Text('Voce esta em um desktop'))),
      ),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get View Page'),
      ),
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: const Center(child: Text('Voce esta em um phone'))),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get View Page'),
      ),
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            color: Colors.purple,
            child: const Center(child: Text('Voce esta em um tablet'))),
      ),
    );
  }
```
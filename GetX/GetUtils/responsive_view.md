# GetX Responsive View
- Utilizado para responsividade em telas com base em suas dimensões.
  - É necessário que a página estenda ```GetResponsiveView```. Se necessário, passe o controlador da página como `<Controller>`.
  - ```dart
    class GetResponsiveViewPage extends GetResponsiveView<Controller> {}
    ```
- Dentro do construtor da página, é passado no `super` as configurações das dimensões da página, utilizando ```ResponsiveScreenSettings()```. Essas configurações podem conter ou não as dimensões. Caso os valores não sejam passados, assumirão os valores padrão da classe.
> Exemplo do construtor da página:
```dart
GetResponsiveViewPage({Key? key})
    : super(
          key: key,
          settings: const ResponsiveScreenSettings(
            tabletChangePoint:
                800, // Define os tamanhos para a configuração de tablet ou desktop
            desktopChangePoint:
                1400, // Define os tamanhos para a configuração de tablet ou desktop
          ));
```
- Após as alterações, não é mais possível realizar a construção de forma comum, utilizando `BuildContext`. Agora, cada tipo de tela deve ser configurado separadamente, com suas respectivas configurações.
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
            child: const Center(child: Text('Você está em um desktop'))),
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
            child: const Center(child: Text('Você está em um telefone'))),
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
            child: const Center(child: Text('Você está em um tablet'))),
      ),
    );
  }
```

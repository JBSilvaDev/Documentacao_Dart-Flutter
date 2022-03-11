# ValueNotifier
## Aplicação
> É usado para atualização de parte da tela, tem um processamento mais rapido que o setState (um unico item)
- É uma função que em seu corpo recebe o que ira ser atualizado, seja uma variavel, funcao, classe widget...
## Modelo

## Exemplo de aplicação
>Uso em StatefulWidget
```dart
class _HomePageState extends State<HomePage> {
  // Variavel que sera altualizada na tela, efeutuar tipagem do que sera atribuido, nesse caso String
  var texto = ValueNotifier<String>('Este é o texto');
  // Funcao que iremos chamar para atualizazr o valor da variavel
  void novoTexto() {
    texto = 'este é o texto agora';}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          // Necessario envolter o que sera atualizado dentro deste widget, tbm deve ser tipado
            ValueListenableBuilder<String>(
              // Variavel que sera atualizada
              valueListenable: texto,
              // Builder recebe o mesmo valor da variavel original e o mesmo sera atualizado junto com a tela
              builder: (_, context, __) {
                // retorna o novo valor da variavel alterada pela funcao
                return Text('$context');
              }),
          ElevatedButton(
              // Chama a funcao que ira atualizar a variavel
              onPressed: controlador.novoTexto, child: Text('Botão')),
        ]),
      ),
    );
  }
}
```
![Logo do Markdown](./Flutter/assets/Tela/oldScreen.jpg)
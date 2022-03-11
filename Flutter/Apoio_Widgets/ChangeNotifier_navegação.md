# ChangeNotifier
## Aplicação
> É usado para atualização de partes da tela, tem um processamento mais rapido que o setState (mais de um item)
- É uma função que em seu corpo recebe o que ira ser atualizado, seja uma variavel, funcao, classe widget...
## Modelo - Criar uma classe que servira de controlador para o que deseja atualizar na tela
> Necessário importar o pacote cupertino
```dart
import 'package:flutter/cupertino.dart';

class ChangeNotifierController extends ChangeNotifier {
  // Variavel que sera altualizada na tela
  var texto = 'este é o texto';
  // Funcao que iremos chamar para atualizazr o valor da variavel
  void novoTexto() {
    texto = 'este é o texto agora';
    // Dispara uma nitificação (nao visivel) informando que a variavel precisa ser atualizada
    notifyListeners();}}
```
## Exemplo de aplicação
>Uso em StatefulWidget
```dart
class _HomePageState extends State<HomePage> {
  // Nova variavel que inicia o controlador
  var controlador = ChangeNotifierController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Necerrio envolter o que sera atualizado dentro deste widget
          AnimatedBuilder(
              // informa o nome da variavel que o controlador esta sendo iniciado
              animation: controlador,
              // Builde padrao, nao necessario alterar
              builder: (context, child) {
                        // Retorna o novo texto atualizado
                return Text(controlador.texto);
              }),
          ElevatedButton(
              // Chama a funcao que esta dentro do controlador
              onPressed: controlador.novoTexto, child: Text('Botão')),
        ]),
      ),
    );
  }
}
```
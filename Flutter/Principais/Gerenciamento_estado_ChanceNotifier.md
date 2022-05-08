# Gerenciamento de estado
## ChanceNotifier()
- Usado para atualizar um ou mais widgets na tela, um rebuild parcial diferente do [setState](./Gerenciamento_estado_setState.md).
- É usada com controlador, uma classe que extente o ChangeNotifier
- Esta classe ira conter o valor que sera atualizazdo juntamente com uma funcao que ira execultar a efetuar a atualização notificando seus ouvintes
```dart
class ChangeNotifierController extends ChangeNotifier {
  var variavel = 0.0; // valor original

  Future<void> funcaoChange(
      {required double parametro}) async {
    variavel = 0.0; // zera o valor atual para atualizar novamente
    notifyListeners(); // notifica que o valor foi alterado
    await Future.delayed(Duration(milliseconds: 800));
    variavel = parametro; // atualizar o valor para o paramentro passado quando chama a funcao
    notifyListeners(); // notifica que o valor foi alterado
  }
}
```
- Na pagina principal é criada uma variavel de controle
```dart
final controller = ChangeNotifierController();
```
- Esta variavel recebera o valor passado na classe *0.0* quando instaciada
```dart
controller.variavel
```
- Para chamar a funcao de controle usa a instancia pela variavel passando o novo valor que a variavel ira ter e atualizando na tela
```dart
 controller.calcularIMC(parametro: 50);
 ```
- A funcao ira receber o valor 50 passado e ira atualizar a variavel, repassando o valor para o controller.
- Para exbir os novor valors atualizados na tela é necessrio envolver o widget em um AnimatedBuilder que é composto por:
    - animatio: Recebe a variavel a ser atualizada
    - builder: Recebe por default (context, child) e retorna o widget que sera atualizado, assim como é feito no [ValueListenableBuilder](./Gerenciamento_estado_ValueNotifier.md)
```dart
    AnimatedBuilder(animation: controller, builder: (context, child){
        return Text('Seu IMC é de: ${controller.variavel}');
        }),
```
<br>
<br>

- Caso o valor quando for fazer uma nova atualização precise ser "resetado" usar a funcao dispose()=> Controladores de [formularios](../Widgets/Forms.md#form) por exemplo
- Em seu corpo passar o que precisa ser "resetado" .dispose(), dependendo da aplicação ira precisar resetar a pagina como um todo, passando o super.dispose().

```dart
@override
void dispose(){
    variavel.dispose();
    super.dispose();
}
```
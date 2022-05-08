# Gerenciamento de estado
## BlockPattern
- Usado para atualização de widgets atravez de [Streams](../../Dart/Dart_OO/Streams.md).
- Necessario criar um objeto que represeta o que sera atualizado
- Este objeto e seu construtor ira ser o extensor de outra classe, este extends, sera responsavel por aprensentar um loading na tela.
```dart
class ImcState {
  final double imc;
  ImcState({
    required this.imc,
  });
}

class IMCStateLoading extends ImcState {
  IMCStateLoading() : super(imc: 0);
}
```
- Necessario uma classe controladora que ira conter a variavel de StreamController, e na sua tipagem, ira receber a classe criada como objeto < ImcState >
    - .broadcast() => é o que permite mais de um ouvinte a [stream](../../Dart/Dart_OO/Streams.md#stream-asbroadcast)
    - ..add(ImcState(imc: 0)) => esta passando para o objeto o valor inicial de 0
```dart
final _imcStreamController = StreamController<ImcState>.broadcast()..add(ImcState(imc: 0));
```
- Nesta classe controller é criado um metodo get, que ira receber o valor de saida da stream, ou seja ira receber o valor que a stream "escultar", esse metodo é do tipo Stream e é tipada como o objeto criado.
```dart
Stream<ImcState> get imcOut => _imcStreamController.stream;
```
- O .add usado na explicação seguinte é uma substituição do sink, uma entrada para a stream
```dart
Stream<ImcState> get imcIn => _imcStreamController.sink;
```
- Com esse get sink instanciado poderiamos seguir da seguinte forma
>Substitituindo isso
```dart
_imcStreamController.add(IMCStateLoading());
```
>Por isso
```dart
imcIn.add(IMCStateLoading())
```
- Ainda na classe controller é criado a funcao que fara o calculo do imc
    - Esta funcao adiciona um novo valor a stream, este valor é a classe que extende o nosso objeto que passa para a classe pai em seu *super* o valor de 0. *Poderia usar sem a classe que extende passando o valor diretamente para o objeto => ImcState(imc: 0)* porem o load nao funcionaria
    - A funcao ainda inicia uma variaval que recebe os valores passados nos paramentros
    - É chamada novamente o controlador adicionando ao objeto o novo valor que ele ira ter
```dart
  Future<void> calcularIMC(
      {required double peso, required double altura}) async {
    _imcStreamController.add(IMCStateLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    final novoimc = peso / pow(altura, 2);
    _imcStreamController.add(ImcState(imc: novoimc));
  }
```
- Por padrao a classe controladora nao pode se manter aberta, entao um metoro dispose se faz necessario
```dart
  void dispose() {
    _imcStreamController.close();
  }
```
- Na pagina principal é criada uma variavel de controle
```dart
final controller = BlockPatterController();
```
- O widget que sera ataulizado é retornado num StreamBuilder com tipagem do objeto < ImcState >, o StreamBuilder é composto por:
    - stream : Recebe a variaviagem controller .funcao controladora a funcao de esculta (saida) da stream
    - builder: Recebe funcao que como parametro padrao tem (context, snapshot), em seu corpo
        - Variavel com valor inicial
        - Altera valor da variavel que se os dados do snapshor for nulo ira receber 0
            - snapshot.data é o valor retornado da stream
        - Retorna o widget que sera exibido com valor atualizado
```dart
StreamBuilder<ImcState>(
    stream: controller.imcOut,
    builder: (context, snapshot) {
        var imc = 0.0;
        imc = snapshot.data?.imc ?? 0;
        return ImcGauge(imc: imc);
    }),
```
- Para exbir o load é necessario retornar no streambuilder o visibility
- Visibility é composto por:
    - visible: Recebe uma condição para exibição, neste caso se o valor do snapshot.data for do tipo da classe extensora ele exibe
    - child: Recebe o widget que ira ser exbido, no exemplo é um load circular
```dart
StreamBuilder<ImcState>(
        stream: controller.imcOut,
        builder: (context, snapshot) {
        return Visibility(
            visible: snapshot.data is IMCStateLoading,
            child: const Center(child: CircularProgressIndicator()),
        );
        },
    ),

```

<br>
<br>

- Caso o valor quando for fazer uma nova atualização precise ser "resetado" usar a funcao dispose() => Controladores de [formularios](../Widgets/Forms.md#form) por exemplo
- Em seu corpo passar o que precisa ser "resetado" .dispose(), dependendo da aplicação ira precisar resetar a pagina como um todo, passando o super.dispose().

```dart
@override
void dispose(){
    variavel.dispose();
    super.dispose();
}
```

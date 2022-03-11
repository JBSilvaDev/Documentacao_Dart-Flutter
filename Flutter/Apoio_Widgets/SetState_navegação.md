# setState
## Aplicação
> É usado para atualização de toda a tela
- É uma função que em seu corpo recebe o que ira ser atualizado, seja uma variavel, funcao, classe widget...
## Modelo
```dart
setState(() {});
```
## Exemplo de aplicação
>Uso em StatefulWidget
```dart
class _HomePageState extends State<HomePage> {
  // 1.Variavel iniciada com um valor. 
  String texto = 'O texto é esse';

  // 4.Seta novo estado da variavel atualizando o valor da mesma e a exibição da tela
  void mudaTexto() {
    setState(() { 
    texto = 'O texto agora é esse';
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // 2.Exibe o valor da variavel
            Text(texto),
            // 3.Chama funcao para setar o novo estado da variavel
            ElevatedButton(onPressed: mudaTexto, child: Text('Botão')),
          ]),),);}}
```
>Caso nao houvesse o setState dentro da funcao o valor seria alterado somente na compilação e nao na tela do app, abaixo exemplo de uma atualização falha
```dart
class _HomePageState extends State<HomePage> {
 
  String texto = 'O texto é esse';

  void mudaTexto() {
    texto = 'O texto agora é esse';
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(texto),
            ElevatedButton(onPressed: mudaTexto, child: Text('Botão')),]),),);}}
```
>OU funcao dirreto dentro do onPressed do botao
```dart
ElevatedButton(onPressed: (){
    texto = 'O texto agora é esse';
}, child: Text('Botão'))
```    
```dart
ElevatedButton(onPressed: (valor){
    texto = valor;
}, child: Text('Botão'))
```  
> Exemplo tela antiga (nao atualizada)<br>

![Old Screen](/Flutter/assets/Tela/oldScreen.jpg)

> Exemplo tela nova (atualizada) <br>

![New Screen](/Flutter/assets/Tela/newScreen.jpg)

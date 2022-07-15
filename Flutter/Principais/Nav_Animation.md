# Navegação com animação

---

## PageRouteBuilder

- Atravez do [push](./Navegacao.md) é chamado o ```PageRouteBuilder``` passando as seguintes tags
  - transitionDuration: Recebe um Duration que determina o tempo que a animação ira durar
  - transitionsBuilder: Recebe função anonima com 4 paramentros, neste modelo é usado 2 deles:
    - (context, **animation**, secondAnimation, **child**){}, é passado os valores para *animation* que recebe um ```CurvedAnimation``` determinando o tipo de animação usada na tag *curve* e passando esta animação para o paramentro animation atravez da tag *parent*
    - o retorno desta funcão é um ```ScaleTransition``` que é composto por:
      - scale: Recebe a animação passada pelo ```CurvedAnimation``` ao *transitionsBuilder*
      - alignment: Recebe o alinhamento da transação
      - child: Recebe o paramento passado no *child(filho)* de *transitionsBuilder*
      - pageBuilder: Recebe função anonima com 3 parâmetros
        - (context, animation, secondaryAnimation) e retorna a pagina destino.

```dart
ElevatedButton(
    onPressed: () {
        Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInQuad);
            return ScaleTransition(
                scale: animation,
                alignment: Alignment.bottomCenter,
                child: child,
            );
            },
            pageBuilder: (context, animation, secondaryAnimation) => Page1(),
        ),
      );
    },
    child: Text('Pagina 1'),
    )
 ```
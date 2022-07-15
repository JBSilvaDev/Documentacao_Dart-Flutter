- Navegacao com animação
  - Dentro de uma ação de navegação
  - Usando ```Navigator.of(context).push()``` dentro do push chama o ```PageRouteBuilder``` que é comporto por:
    - transitionDuration: duração da transição de navegação
    - transitionsBuilder: recebe funcao anonima com 4 paramentros *contexto, anicamacao, animacaoSecundaria, filho que sera buildado (pagina)*
      - no corpo da funcao deve-se determina ações para os paramentros a serem usados
      - seu retorno é um ```ScaleTransition``` que é composto por:
        - scale: recebe a animação do transitionsBuilder
        - alignment: recebe o alinhamento da transacao
        - child: recebe o paramento passado no child(filho) de transitionsBuilder
    pageBuilder: recebe funcao anonima com 3 paramentros *context, animation, secondaryAnimation* e retorna a pagina destino.

    ```dart
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInQuad);
                  
              return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.bottomCenter, child: child,);
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                Page1(),
          ),
        );
      },
      child: Text('Pagina 1'),
    )
    ```

    - Ou para navegacao simples:

    ```dart
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Page2(),
            )
          );
        },
        child: Text('Pagina 2'),
      ),
    ```

- Barra de progresso ...
  - Usa-se  o ```TweenAnimationBuilder``` tipando com double
  - é composto por:
    - tween: Recebe ```Tween``` passando o valor inicial e final da barra (begin/end)
    - duration: Recebe o tempo que a barra ira demorar para atualizar
    - builder: Recebe funcao anonima com 3 paramentros *(contexto, valorfinal, child)* e retorna um ```LinearProgressIndicator``` que é composto por:
      - backgroundColor: Recebe a cor que representa progresso faltante
      - valueColor: Recebe ```AlwaysStoppedAnimation<Color>( Colors.black),``` que é a cor do progresso concluido
      - value: recebe o valorfinal recebido no paramentro

    ```dart
      TweenAnimationBuilder<double>(
        tween: Tween(
          begin: 0.0,
          end: 0.9,
        ),
        duration: Duration(seconds: 10),
        builder: (context, value, child) {
          return LinearProgressIndicator(
            backgroundColor:  Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>( Colors.black),
            value: value,
          );
        },
      )
    ```

    - Modo simplificado (sem animação de progresso)
    - ```LinearProgressIndicator``` que é composto por:
      - backgroundColor: Recebe a cor que representa progresso faltante
      - valueColor: Recebe ```AlwaysStoppedAnimation<Color>( Colors.black),``` que é a cor do progresso concluido
      - value: recebe o valorfinal, a % que ja foi concluida

    ```dart
    LinearProgressIndicator(
      backgroundColor:  Colors.grey.shade300,
      valueColor: AlwaysStoppedAnimation<Color>( Colors.black),
      value: .5,

      )
    ```

- Dismissible (Arrasta para alguma ação)
- Usado para executar alguma ação ao arrastar um item de uma lista, é composto por:
  - background: Recebe um widget que é exibido ao arastar um item da lista
  - direction: Recebe ```DismissDirection.ALGO``` que determina a direção do arrastar
  - confirmDismiss: Recebe funcao que retorna algo para confirmar a ação
  - key: Recebe uma ```final _formKey = GlobalKey<FormState>();```
  - child: Recebe view em lista dos items que a ação do dismiss tera efeito

```dart
Dismissible(
        background: Container(color: Colors.red),
        direction: DismissDirection.endToStart,
        confirmDismiss: (DismissDirection direction) {
          return showDialog(
              context: context,
              builder: (_) {
                final int id = model.id;
                return RemoveTask(context, model.description, id);
              });
        },
        key: _formKey,
        child: IntrinsicHeight(
          child: ListTile(),
        ),
      ),``

```

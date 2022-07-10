- buildcontext
    - todos os widgets recebem o buildcontext
    - com o build é possivel acessar algo de outro widget na arvore de apps
    - ao passar o context estara requisitando informações do build no widget mais proximo 
    - so é possivel ter informações do quem ja passou, filho consegue dados do pai, mas pai nao consegue dados do filho pois o filho ainda nao "aconteceu"
    - nao recomendado usar o context do builder dentro do initial state pois o builde ainda nao fui carregado, o initial é executado antes do builder
- extensions
    - é um tipo de classe que usa pra adicionar funcao a outra funcao
    - exemplo
      ```dart
      extension ThemeExtension on BuildContext {
        Color get primaryColor => Theme.of(this).primaryColor;
        }
        ```
    - acima estou adicionando uma variavel que recebe a cor primaria de theme e extendendo esta variavel para o buildercontext, assim posso acessar a cor primaria do app chamando o context.primaryColor
    - exemplo 2
      ```dart
      extension Texto on BuildContext {
        String get saudacao => 'JBS';
      }
      ```
    - chamando context.saudacao, obtenho o valor 'JBS', uma string que poderia ser passada num print(context.saudacao) ou num Text(context.saudacao)
- static
  - Classe com contrutor privado criada para para configuração de tema
  - compoe um metodo get static do tipo ThemeData onde é passado as configurações de cores e estilos que serao padrao no app, estes estilos sao chamados no MaterialApp -> theme como ThemaPersonalisado.theme, ou em tags de estilização como Theme.of(context).ESTILO_DESEJADO,
  - exemplo
      ```dart
      class ThemaPersonalisado {
        ThemaPersonalisado._();

        static ThemeData get theme => ThemeData(
              textTheme: GoogleFonts.mandaliTextTheme(),
              primaryColor: Color(0xff5C77CE),
              primaryColorLight: Color(0xffABC8F7),
              backgroundColor: Color(0xFFFAFBFE),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff5C77CE),
                ),
              ),
            );
      }
```
- layoutbuilder
  - widget usado para obter dados da tela, pede um builder que recebe (context, constraints) e retorna outro widget
  - o widget de retorno pode ser qualquer, porem um dos filhos precisa ser uma ConstrainedBox que segue a mesma ideia de um Container, porem tem a opcao de receber constraints, como constraints passa-se o BoxConstraints nele é possivel determinar o maximo e o minimo em altura e largura da pagina, usando como referencia a constraints passadas no LayoutBuilder.
  ```dart
    LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth, ),
            child: Widget()
  ```
- IntrinsicHeight
  - widget que passa para seu filho o tamanho de ocupação necessaria na tela, um collumn por exemplo nao teria tamanho infinito, ocuparia o tamanho exeto necessario para caber seus filhos
    ```dart
    IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min, // O tamanho minimo possivel da coluna
        children: []
    ```
  - o mesmo ocorre com IntrinsicWidth porem seu ajuste seria na largura
- TodoListLogo
  - classe  stateleswidget, e apos o builder no widget principal retorna uma coluna alinhada ao centro que ira receber nos filhos uma imagem e um texto ja estilizados
- Expanded
  - widget de expansão, ira expandir seu filho para ocupar todo o restante disponível em tela
- TextFormField (Personalizado)
  - Classe statelesswidget, e apos o builder no widget principal retorna um ValueListenableBuilder to tipo bool, 
  - Criada variavel ValueNotifier que na atribuição do construtor,antes do super foi atribuido o mesmo valor do obscureText, assim o value notifier pode "ouvir" quando houver mudança de valor da variavel, e com isso executar alguma ação,  ValueListenableBuilder foi composto por:
    - valueListenable: Recebe o valor antigo que sera atualizado pelo value do builder
    - builder: Recebe funcao com 3 parametros um que recebe context, um recebe value (novo valor a ser passado), um recebe widget e retorna o TextFormField.
  - Os campos onde a informação é dinamica, opcional, ou por algum motivo precisara ser atualizada, foram passados como variaveis dos seus respectivos tipos para receber seus valores quando for invocada a classe, no construtor foi feito um assert para verificar se obscureText é verdadeiro, caso for o icone do suffixIconButton assume valor de nulo, caso nao assume valor de true, uma msg foi definida caso esse assert seja executado
  - TextFormField personalizado foi composto por:
    - focusNode: Recebe true ou false, o pontero ou seleção ira para o campo que for definido true
    - validator: Recebe o validador do campo
    - controller: Recebe o controlador de conteudo do campo
    - decoration: Formatação de estilo *InputDecoration para passar **placeholders** no labelText, e estilizar em labelStyle*
    - border: Configuração padrão da borda
    - errorBorder: Configuracao da borda em caso de erro no form
    - isDense: Recebe true ou false para deixar o campo mais compacto
    - suffixIcon: Recebe widget, icone dentro do campo, feita uma logica para determinar se o icone iria aparecer ou nao
    - obscureText: Recebe true ou false para ocultar ou nao os caracteres digitados
  - Variavel privada _emailFocus recebe FocusNode(), que é chamado num onPressed como _emailFocus..requestFocus(), fazendo que o campo onde o focusNode for passado, sera selecionado
  - O usa esta classe chamando o NomeDoArquivo(Passando seus atributos)

```dart
  ValueListenableBuilder<Tipagem>(
          valueListenable: ValorDeAcordoComATipagem,
          builder: (_, obscureTextValue, __) {
            return TextFormField(
              focusNode: focusNode,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red),
                ),
                isDense: true,
                suffixIcon: this.suffixIconButton ??
                    (obscureText == true
                        ? IconButton(
                            onPressed: () {
                              obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(
                              !obscureTextValue
                                  ? TodoListIcons.eye_slash
                                  : TodoListIcons.eye,
                              size: 18,
                            ),
                          )
                        : null),
              ),
              obscureText: obscureTextValue,
            );
          });
```
- Tela de cadastro
  - Classe statefullwidget, adicionada nova rota no AuthModule e nos bindings passado mais um changeNotifierProvider que retorna a RegisterControler, o retorno do RegisterPage é uma tela Scaffold onde
  - AppBar composta:
    - title: Titulo da pagina
    - automaticallyImplyLeading: Desativa botao voltar padrao
    - backgroundColor: Cor de fundo
    - leading: Recebe widget (novo botao voltar)
  - body recebe todo o conteudo restante da pagina como formularios e botoes
- Exceções personalizadas
  - Classe que implementa Exception
  - Criada uma variavel que ira receber a msg de exceções
  - Criado construtor para passar a msg
  - Usa-se a classe chamando o throw NomeClasse(message: "Messagem de erro")
```dart
  class AuthExceptions implements Exception {
  final String message;
  AuthExceptions({
    required this.message,
  });
}
```
- Get & Set
- Usados para passar ou pegar valores de atributos privados dentro da classe
- Get obtem o valor de algo e atribui esse valor no metodo da classe
    - get:
        - Dentro da classe ```Tipo get atributoClasse => _atributoClassePrivado;```
    - Get esta pegando o atributo da classe e retornando ele para o set
- Set passa um valor de um metodo da classe para outro atributo na mesma classe
    - set:
        - Dentro da classe ```set atributoClasse(Tipo atributoClasse) => atributoClasse = _atributoClassePrivado;```
    - Set esta passando o valor de seu atributo para o atributo privado da classe
    - É possivel criar uma regra de negocio nos setes, atribuindo alguma condição para aceitar ou nao o valor passado para o atributo
        - ```dart
             set atributoClasse(String? atributoClasse) {
                if(atributoClasse != null && atributoClasse.length > 3){
                  _atributoClassePrivado = atributoClasse;
                }}
           ```
        - Acima, so ira aceitar o valor passado se o tamanho dele for maior que 3
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


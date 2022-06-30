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
  


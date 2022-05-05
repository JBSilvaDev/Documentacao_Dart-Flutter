# Formularios
- Usado par entrada de dados no aplicativo
- Usada como [Statefull](../Flutter_Topicos.md#tipos-basicos-widgets)

## Validação
- Para validação do formulario usar uma variavel que sera a chave deste
- Dentro do State< NomePagina > definir variavel que recebera a chave global
- Da mesma forma é definida uma variavel onde ira receber o valor passado no campo
```dart
class _FormsPageState extends State<FormsPage> {
  final formKey = GlobalKey<FormState>();
  final recebeDados = TextEditingController();
```
- Usar o dispose para discartar o cache de memoria usado pelo controlador (recebeDados)
```dart
 @override
  void dispose() {
    recebeDados.dispose();
    super.dispose();
  }
```
- Chamando a validação em um botao
- Dentro do onPressed ou similar definir nova variavel onde recebe a chave do form, seu estado atual (que pode ser nulo) e se o mesmo é valido, caso nao seja, retorna false
- Fazendo a verificação com if que recebe no parametro a variavel de validação (passo anterior) e retorna uma [snackbar](./WidgetGeral.md#snackbar) em caso de formulario validado contendo uma mensagem com o valor digitado usando a variavel recebeDados passada no controller do [TextFormField](./Forms.md#textformfield).
```dart
onPressed: () {
    var formValid =
        formKey.currentState?.validate() ?? false;
    var message = 'Formulario invalido)';

    if (formValid) {
    message =
        'Fomulario validado (Valor digitado foi ${recebeDados.text}';
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
},
```
## Form()
- Fomulario para inserir dados
- Compoe: 
    - key: Recebe a chave definida no State< NomePagina >
    - child: Recebe widget como Column para poder ter mais de um capo no formulario
## TextField()
- Usado para digitação de caracteres
- Compoe:
    - onChange: Recebe uma funcao que em seu paramentro recebe o valor digitado pelo usuario
    - style: Recebe um [TextStyle](./WidgetsTree.md#textstyle) para formatação do conteudo do campo
    - decoration: Recebe um [InputDecoration](WidgetsTree.md#inputdecoration) para formatação do campo

## TextFormField()
- Usado para digitação de catacteres
- Compoe:
    - controller: Recebe o controlador definido no State< NomePagina >
    - autovalidateMode: Recebe um *AutovalidateMode.onUserInteraction*, ira validar o campo quando houver uma interação do usuario, exibindo a mensagem do validador
    - keyboardType: Recebe o tipo de teclado => *TextInputType.number*
    - maxLines: Maximo de quebra de linhas dentro do campo, null para ilimitado (caso nao usado todo conteudo ficara em uma unica linha)
    - decoration: [InputDecoration](WidgetsTree.md#inputdecoration) para formatação do campo
    - validator: Recebe uma funcao anonima que em seu parametro é passado um valor, efetuando a verificação com if, pode constatar se o valor é igual a null ou valor.isEmpty, caso seja retorna uma mensagem ou uma ação.
    - obscureText: recebe true ou false para ocultar o conteudo digitado
## DropdownButtonFormField < Tipo de conteudo >()
- Usado para conteudo pre definido em uma lista de itens
- Compoe:
    - key: Recebe a chave definida no State< NomePagina >
    - isDense: Recebe true ou false para a densidade do campo
    - decoration: [InputDecoration](WidgetsTree.md#inputdecoration) para formatação do campo
    - icon: Recebe um [icon](./WidgetsTree.md#icons)
    - value: Recebe um valor string que se refencia a um dos itens da lista 
    - validator: Recebe uma funcao com parametro String? opcional que em seu parametro é passado um valor, efetuando a verificação com if, pode constatar se o valor é igual a null ou valor.isEmpty, caso seja retorna uma mensagem ou uma ação.
    - onChanged: Recebe uma funcao que em seu parametro ira receber o valor selecionado na lista
    - items: Recebe uma lista de *DropdownMenuItem* que é composto por:
        - child: Recebe widget que sera exibido na lista
        - value: Recebe valor de referencia para o value do *DropdownButtonFormField*
# Formulários

- Usados para entrada de dados no aplicativo.
- São utilizados como [Stateful](../Fundamentos.md#tipos-basicos-widgets).

## Validação

- Para validar o formulário, utilize uma variável que será a chave do mesmo.
- Dentro do `State<NomePagina>`, defina uma variável que receberá a chave global.
- Da mesma forma, defina uma variável que receberá o valor inserido no campo.

```dart
class _FormsPageState extends State<FormsPage> {
  final formKey = GlobalKey<FormState>();
  final recebeDados = TextEditingController();
```

- Utilize o método `dispose` para descartar o cache de memória usado pelo controlador (`recebeDados`).

```dart
@override
void dispose() {
  recebeDados.dispose();
  super.dispose();
}
```

- Em um botão, para validar os dados digitados nos campos do formulário:

```dart
ElevatedButton(
  onPressed: () {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      final email = _emailEC.text;
      final password = _passwordEC.text;
    }
  },
  child: Text('Login'),
),
```

- Chamando a validação em um botão:
- Dentro do `onPressed` ou similar, defina uma nova variável que recebe a chave do formulário, seu estado atual (que pode ser nulo) e verifica se o mesmo é válido. Caso não seja, retorna `false`.
- Faça a verificação com um `if` que recebe como parâmetro a variável de validação (passo anterior) e retorna uma [snackbar](./WidgetGeral.md#snackbar) em caso de formulário validado, contendo uma mensagem com o valor digitado usando a variável `recebeDados` passada no controlador do [TextFormField](./Forms.md#textformfield).

```dart
onPressed: () {
  var formValid = formKey.currentState?.validate() ?? false;
  var message = 'Formulário inválido';

  if (formValid) {
    message = 'Formulário validado (Valor digitado foi ${recebeDados.text})';
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
},
```

## Form()

- Formulário para inserir dados.
- Composição:
  - key: Recebe a chave definida no `State<NomePagina>`.
  - child: Recebe um widget como `Column` para poder ter mais de um campo no formulário.

## TextField()

- Usado para digitação de caracteres.
- Composição:
  - onChanged: Recebe uma função que tem como parâmetro o que está sendo digitado pelo usuário.
    - `(String valor) { print(valor) }`
  - onSubmitted: Recebe uma função que tem como parâmetro o que foi digitado pelo usuário após confirmar (tecla enter, botão ok).
  - style: Recebe um [TextStyle](./WidgetsTree.md#textstyle) para formatação do conteúdo do campo.
  - decoration: Recebe um [InputDecoration](WidgetsTree.md#inputdecoration) para formatação do campo.
  - keyboardType: Recebe `TextInputType.TIPO_TECLADO`.
  - maxLength: Recebe um número inteiro com a quantidade máxima permitida no campo.
  - maxLengthEnforced: Recebe `true` ou `false` para bloquear o valor máximo definido em `maxLength`.
  -

 obscureText: Recebe `true` ou `false` para ocultar o conteúdo digitado.
  - controller: Recebe o controlador definido no `State<NomePagina>`.

## TextFormField()

- Usado para digitação de caracteres.
- Composição:
  - controller: Recebe o controlador definido no `State<NomePagina>`.
  - autovalidateMode: Recebe `AutovalidateMode.onUserInteraction`, valida o campo quando há interação do usuário, exibindo a mensagem do validador.
  - keyboardType: Recebe o tipo de teclado, por exemplo: `TextInputType.number`.
  - maxLines: Máximo de quebras de linha dentro do campo. Use `null` para ilimitado (caso não seja usado todo o conteúdo ficará em uma única linha).
  - decoration: [InputDecoration](./WidgetsTree.md#inputdecoration) para formatação do campo.
  - validator: Recebe uma função anônima com um parâmetro opcional `String?` que, ao receber um valor, verifica se o mesmo é igual a `null` ou `valor.isEmpty`. Caso seja, retorna uma mensagem ou uma ação.
  - obscureText: Recebe `true` ou `false` para ocultar o conteúdo digitado.
  - focusNode: Recebe `true` ou `false`. O cursor ou seleção irá para o campo que tiver esse valor definido como `true`.
  - errorBorder: Configuração da borda em caso de erro no formulário.
  - isDense: Recebe `true` ou `false` para deixar o campo mais compacto.
  - suffixIcon: Recebe um widget, um ícone dentro do campo.

## DropdownButtonFormField<Tipo de conteúdo>()

- Usado para selecionar conteúdo pré-definido em uma lista de itens.
- Composição:
  - key: Recebe a chave definida no `State<NomePagina>`.
  - isDense: Recebe `true` ou `false` para a densidade do campo.
  - decoration: [InputDecoration](./WidgetsTree.md#inputdecoration) para formatação do campo.
  - icon: Recebe um ícone ([icon](./WidgetsTree.md#icons)).
  - value: Recebe um valor do tipo string que se refere a um dos itens da lista.
  - validator: Recebe uma função com um parâmetro `String?` opcional que, ao receber um valor, verifica se o mesmo é igual a `null` ou `valor.isEmpty`. Caso seja, retorna uma mensagem ou uma ação.
  - onChanged: Recebe uma função que, ao receber o valor selecionado na lista, é executada.
  - items: Recebe uma lista de *DropdownMenuItem* composta por:
    - child: Recebe um widget que será exibido na lista.
    - value: Recebe um valor de referência para o `value` do *DropdownButtonFormField*.
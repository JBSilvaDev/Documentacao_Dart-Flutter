# Classe para TextFormField Personalizada

- Utilizada para fornecer `TextFormFields` já formatados para várias telas, evitando a repetição de código.
- O objeto é criado de forma a permitir a passagem de atributos, como *rótulo* (label). Caso fosse um objeto com valores fixos em seus atributos, poderia ter sido utilizado o mesmo estilo do [ThemaPersonalizado](./Theme.md) com valores estáticos.
- A classe possui um construtor privado criado para configuração do tema.
- Construtor:
  - Variável `String` que recebe o texto a ser exibido no campo.
  - Variável `bool` que indica se o texto é oculto ou não (como no caso de senhas). Por padrão, essa variável recebe o valor `false`.
  - Variável do tipo [ValueNotifier](../Principais/Gerenciamento_estado_ValueNotifier.md), que notifica as alterações do estado do ícone.
  - Variável opcional do tipo `IconButton`, pois pode ou não haver um ícone no campo (a critério do desenvolvedor).
  - Após o construtor, é utilizado um `assert` para verificar se o desenvolvedor informou ou não o valor para `obscureText`. Se o valor informado for verdadeiro, o campo de ícone será nulo. Essa verificação é feita porque, neste modelo, a área do ícone está sendo definida no `TextFormField` com condições de troca de ícone (visível e não visível). No entanto, caso `obscureText` seja falso ou não seja informado (valor falso passado como padrão no construtor), é possível passar um ícone para o campo.
  - Ainda no `assert`, é fornecida uma mensagem caso a condição informada seja atendida.
  - Após o `assert`, o valor é passado para a [variável que notifica as alterações de estado](../Principais/Gerenciamento_estado_ValueNotifier.md). Essa variável recebe o valor informado em `obscureText`, e todas as informações são passadas para o `super`.
- Composição:
  - O retorno é um `ValueListenableBuilder` tipado como `bool`, pois é isso que ele recebe e notifica.
    - `valueListenable`: Recebe a variável notificadora que pode ser atualizada.
    - `builder`: Recebe três parâmetros (`BuildContext`, `ValorTipagem`, `Widget?`). Para este modelo, apenas o `ValorTipagem` é necessário, pois é o único que pode ser alterado.
  - No retorno, é fornecido o `TextFormField` com suas configurações adequadas.
  - A dinâmica do campo está no ícone, onde é verificado se o texto está com a opção de ocultação ativada (como em senhas). Caso esteja, o ícone será *visibility*; caso contrário, o ícone será *visibility_off*. No `onPressed` do `IconButton`, o valor da variável notificadora é alterado para a negação do builder do `ValueListenableBuilder`, dessa forma, sempre que o ícone for clicado, o valor será alterado para o oposto do atual. Se for verdadeiro, se tornará falso; se for falso, se tornará verdadeiro. Sempre que houver uma alteração, o builder será notificado, atualizando assim o ícone do campo.
  - A tag que define se o campo é um texto oculto ou não recebe o valor do builder do `Notifier`.
  - Para utilizar esta classe, é necessário chamá-la com o nome do arquivo e os atributos solicitados/desejados.

- Modelo:

```dart
class FormFieldDinamico extends StatelessWidget {
  final String texto;
  bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final IconButton? suffixIconButton;

  FormFieldDinamico({
    Key? key,
    required this.texto,
    this.suffixIconButton,
    this.obscureText = false,
  })  : assert(obscureText == true ? suffixIconButton == null : true,
            'ObscureText não pode ser enviado em conjunto com suffixIconButton'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, __) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: texto,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon: obscureText == true
                ? IconButton(
                    onPressed: () {
                      obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(
                      !obscureTextValue
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 18,
                    ),
                  )
                : null,
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
```
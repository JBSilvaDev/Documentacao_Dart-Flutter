# Classe para TextFormFields Personalizada

- Usada para passar ```TextFormFields``` ja formatados para diversas telas sem necessidade de repetição de código.
- Objeto criado a modo que possa passar alguns atributos como *label*, caso fosse um objeto com valores fixos em seus atributos, poderia ter usado o mesmo estilo de [ThemaPersonalisado](./Theme.md) com valores estaticos.
- Classe com construtor privado criada para para configuração de tema
- Construtor:
  - Variavel ```String``` que ira receber um texto para exibição no campo
  - Variavel ```bool``` que ira receber se o texto é oculto ou nao (tipo senha), no construtor ela recebe um valor padrao para false
  - Variavel tipo [ValueNotifier](../Principais/Gerenciamento_estado_ValueNotifier.md) que ira notificar para alteração de estado do icone
  - Variavel tipo ```IconButton``` opcional pois pode ou nao haver um icone no campo (a criterio do dev)
  - Apos contrutor um ```assert``` foi para verificar se o dev passou ou nao o valor para o *obscureText*, se o valor passado for verdadeiro entao o campo de icone sera nulo, esta verificação é feita pois para este modelo a area de icone esta sendo informada no ```TextFormField``` com condicoes de troca de icone (visivel e nao visivel) , porem caso o *obscureText* seja false ou nao informado (valor false passado como padrao no contrutor) é possivel passr um icone para o campo.
  - Ainda no ```assert``` uma mensagem é passada para caso a condição informada ser atendida.
  - Apos o assert é passado o valor para a [variavel que ira notificar alteração de estado](../Principais/Gerenciamento_estado_ValueNotifier.md), a mesma esta recebendo o valor informado no *obscureText*, todas informações sao passadas para o *super*
- Composição:
  - Como retorno é passado o [ValueListenableBuilder](../Principais/Gerenciamento_estado_ValueNotifier.md) tipada como ```bool``` pois é o que ela ira receber e notificar.
    - valueListenable: Passada a variavel notificadora que pode ser atualizada
    - builder: Recebe 3 paramentros *(BuildContext, ValorTipagem, Widget?)*, para este modelo necessario somente o *ValorTipagem*, pois somente este poderar ser alterado
  - Em seu retorno é passado o ```TextFormField``` com suas devidas configurações
  - A dinamica do campo esta no icone onde é verificado se o o texto esta com obscuro ativado (senhas), caso esteja seu icone é  *visibility* caso nao seu icone é *visibility_off*, no OnPressed do IconButton foi passado para a variavel notificadora o valor de negação do builder do [ValueListenableBuilder](../Principais/Gerenciamento_estado_ValueNotifier.md) assim sempre que clicado o valor sera alterado para o oposto to atual, se for true, vira false, se for false, vira true, e sempre que houver uma alteração o builder sera nitificado, atualizando assim o icone do campo.
  - A tag que define se o campo é texto oculto ou nao recebeu o valor do builder do ```Notifier```
  - O usa esta classe chamando o NomeDoArquivo(Atributos solicitados/Desejados)

- Modelo:

```dart
class FormFildDinamico extends StatelessWidget {
    final String texto;
    bool obscureText;
    final ValueNotifier<bool> obscureTextVN;
    final IconButton? suffixIconButton;
    FormFildDinamico({
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
        suffixIcon: obscureText == true ? IconButton(
                    onPressed: () {
                        obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(!obscureTextValue ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                    ),
                  )
                : null,
            ),
    obscureText: obscureTextValue,
        );
      }
    );
  }
}
```

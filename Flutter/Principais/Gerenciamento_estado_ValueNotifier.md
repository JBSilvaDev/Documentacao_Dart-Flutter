# Gerenciamento de estado
## ValueNotifier()
- Usado para atualizar um widget especifico, um rebuild parcial diferente do [setState](./Gerenciamento_estado_setState.md).
- O que deve ser atualizado deve ser passado dentro da classe ValueNotifie(Valor dynamic a ser atualizado)
```dart
var variavel = ValueNotifier(valorQualquer);
```
- O widget que ira ser atualizado com o valor deve ser passando dentro da funcao ValueListenableBuilder< Tipagem >(), onde ira receber:
    - valueListenable: Recebe a variavel que sera atualizada
    - builder: (_, value,__), que retorna o widget a ser atualizado com novo valor
        -   " _ " = context, opcional para evitar erros passa _ como valor
        -   " value " = é o novo valor que ira passar para variavel
        -   " __ " = child, opcional para evitar erros passa __ como valor ( __ para nao ficar com mesmo nome do context).
- Exemplo:
    - Defino uma varivel com um nome => *var variavel = ValueNotifier(0.0);*
    - Para alterar o valor da variavel é instaciado o seu valor com .value
        -   ```dart
            variavel.value = 'Novo Valor'
            ```
    - Em uma tela normalmente quando vamos exibir um texto usamos Text('variavel'), porem neste caso preciso que o conteudo da variavel sera atualizavel entao uso o ValueListenableBuilder(), ficando assim:
        -   ```dart
            ValueListenableBuilder<String>(
                      valueListenable: variavel,
                      builder: (_, value, __) {
                        return Text('${value}');
                      }),
            ```
    - O ValueListenableBuilder é tipado pelo conteudo que ira ser atualizado, neste caso uma String
    - No valueListenable passo a variavel que sera atualizada
    - O builder ira fazer a atualização do valor, exibindo na tela o Text atualizado.
        - No caso o ValueListenableBuilder() substituiu o Text() pois seu retorno é o proprio text, ou qualquer outro widget<br><br>
- Caso o valor quando for fazer uma nova atualização precise ser "resetado" usar a funcao dispose() => Controladores de [formularios](../Widgets/Forms.md#form) por exemplo
- Em seu corpo passar o que precisa ser "resetado" .dispose(), dependendo da aplicação ira precisar resetar a pagina como um todo, passando o super.dispose().
```dart
@override
void dispose(){
    variavel.dispose();
    super.dispose();
}
```
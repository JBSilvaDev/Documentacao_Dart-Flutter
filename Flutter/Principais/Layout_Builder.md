# Layout Builder

- Usado para obter informações sobre a tela do dispositivo

## Utilização

- Subistituir o widget principal pelo LayoutBuilder() e repassa-lo no return
  - Compoe:
    - builder: Função que recebe dois parametros (context, constraints) e retorna o widget principal
        -
        - ```dart
            child: LayoutBuilder(
            builder: (context, constraints) {
            return Column()
            ```

  - Constrainrs é o tamanho recebido do pai, ou seja, o tamanho total de tela disponivel
  - Para obter os valores de largura e altura de tela disponivel (ja descontados a AppBar e StatusBar), basta chamar a constraints.maxWidth ou constraints.maxHeight
- OBS: Com estes valores disponiveis nao se faz necessario subtração de outros tamanhos para obter o valor real a ser utilizado, como é feito em [Media Query](./MediaQuery.md)
- OBS: Para trabalhar com responsividade deve-se usar porcentagem nos valores e nao numeros fixos
  - Exemplo:
    - Considerando que querira que algo oculpe metade da altura de minha tela, sabendo que ela tem um total de AREA LIVRE (Total - Barra Status - AppBar) de 1000.
        > Errado

        ```dart
        Container(
            color: Colors.red,
            height: 500
        ```

        >Correto

        ```dart
        Container(
            color: Colors.red,
            height: constraints.maxHeight * .5,
        ```
  - Outro metodo, para ser mais dinamico é usar o ```ConstrainedBox``` é usado para receber os dados do ```LayoutBuilder```, possui a tag *constraints* que recebe um ```BoxConstraints``` onde é possível determinar o máximo e o mínimo em altura e largura da pagina, usando como referencia a constraints recebidas do ```LayoutBuilder```.
    - ```dart
        LayoutBuilder(
        builder: ((context, constraints) {
        return ConstrainedBox(
            constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
            ),
            child: Container(
            color: Colors.red,
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('${constraints.maxHeight}'),
                    Text('${constraints.maxWidth}'),
        ], ),),),);}),)
        ```

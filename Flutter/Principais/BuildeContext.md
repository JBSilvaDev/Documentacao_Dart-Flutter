# BuildeContext
-   É o pai de todos os widgets, atravez dele é possivel acessar alguma informação de outro widget ou arquivo.
## Utilização
- Subistituir o widget principal pelo LayoutBuilder() e repassa-lo no return
    - Compoe:
        - builder: Função que recebe dois parametros (context, constraints) e retorna o widget principal
        -   ```dart
            child: LayoutBuilder(
            builder: (context, constraints) {
            return Column()
            ```
    - Constrainrs é o tamanho recebido do pai, ou seja, o tamanho total de tela disponivel
    - Para obter os valores de largura e altura de tela disponivel (ja descontados a AppBar e StatusBar), basta chamar a constraints.maxWidth ou constraints.maxHeight
- OBS: Com estes valores disponiveis nao se faz necessario subtração de outros tamanhos para obter o valor real a ser utilizado, como é feito em [Media Query](./MediaQuery.md)
- OBS: Para trabalhar com responsividade deve-se usar porcentagem nos valores e nao numeros fixos
    -   Exemplo:
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
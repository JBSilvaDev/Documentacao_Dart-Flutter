# BuildeContext

- É o pai de todos os widgets, atravez dele é possivel acessar alguma informação de outro widget ou arquivo.

## Observações

- Ao passar o ```context``` estara requisitando informações do build no widget pai mais proximo
- So é possivel ter informações dos widgets pai, filho consegue dados do pai, mas pai nao consegue dados do filho.
- Nao recomendado usar o ```context``` do builder dentro do initial state pois o build ainda nao fui carregado, o initial é executado antes do builder.

***

- É uma classe utilitária dentro do flutter onde esta registrado TODOS os widgets de nossa estrutura
- Todo widget recebe em seu construtor o build context, pois seu conteudo precisa ser registrado na arvore de componentes
- Serve para encontrar/passar informações
- Quando passamos o context do build para uma classe, estamos passando todas informações da nossa aplicação, para a classe buscar nela o que ela foi programada para buscar.

- Usando o [MediaQuery](./MediaQuery.md#utilização) como exemplo
    -
    -
    - ```dart
        MediaQuery.of(context)
        ```

  - Neste caso estamos solicitando que a classe procure dentro do builder informações sobre a tela do dispositivo

- Usando o [Navigator](./Navegacao.md#utilização) como exemplo
    -
    -
    - ```dart
        Navigator.of(context).pushNamed('/page2');
        ```

  - Neste caso estamos passando as informações armazenadas no builder pai (main) tudo que foi criado e definido no app foi armazenado no context do builder, entao quando chamamos o navigator estamos passando todas informações para a classe e solicitando que faça a negevação para uma das paginas definidas anteriormente.

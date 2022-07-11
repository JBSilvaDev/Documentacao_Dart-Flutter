# BuildeContext
-   É o pai de todos os widgets, atravez dele é possivel acessar alguma informação de outro widget ou arquivo.
## Observações
- Ao passar o ```context``` estara requisitando informações do build no widget pai mais proximo 
- So é possivel ter informações dos widgets pai, filho consegue dados do pai, mas pai nao consegue dados do filho.
- Nao recomendado usar o ```context``` do builder dentro do initial state pois o build ainda nao fui carregado, o initial é executado antes do builder.
# Widgets de composição para parametros que compoe outros widgets

***
## EdgeInsets
- Usado para passar valores em margin e padding
    - EdgeInserts.
        -   EdgeInsets.all(todos os lados receberar o valor passado)
        -   EdgeInsets.fromLTRB(left, top, right, bottom)
***
## BoxDecoration
- É um conjunto de conficurações para o widget pai
    - Compoe:
        -   color: Colors.red,
        -   image: Recebe DecorationImage
        -   borderRadius: Recebe BorderRadius,
        -   boxShadow: Recebe uma lista de configurações para sombreamento como BoxShadow()
        [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset:
                        Offset(10, 10) // (-10, -10) para lado esquerdo e acima
                    )
              ]),
### BorderRadius
- Usado para passar valores que definem arrendondamento das bordas de um widget
    - BorderRadius.
        - BorderRadius.all(Recebe Radius)
        - BorderRadius.horizontal(left:Recebe Radius, right: Recebe Radius)
#### Radius
- Usado para passar valores ao BorderRadius
    - Radius.circular(Valor a ser passado)
    - Radius.elliptical(valor topo, valor button)
### DecorationImage
- Usado para adicionar uma imagem ao widget
    - Compoe:   
        - image: Recebe um AssetImage(Link da imagem) ou um NertWorkImage(Url da imagem)
#### BoxShadow
- Usado para passar valores de sombreamento
    - Compoe:
        - color: Recebe uma cor (Colors.black)
        - blurRadius: Recebe um inteiro para tonalidade da sombra
        - offset: Recebe Offset(int, int) posicao da sombra, int positivo = button, right, int negativo = top, left
***
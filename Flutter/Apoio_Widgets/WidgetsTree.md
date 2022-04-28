# Widgets de composição para parametros que compoe outros widgets
[rad](WidgetsTree.md#radius)
***
## EdgeInsets
- Usado para passar valores em margin e padding
    - EdgeInserts.
        -   EdgeInsets.all(todos os lados receberar o valor passado)
        -   EdgeInsets.fromLTRB(leftValor, topValor, rightValor, bottomValor)
        -   EdgeInsets.only(left: valor, top: valor, right: valor, bottom: valor)
***
## BoxDecoration
- É um conjunto de conficurações para o widget pai
    - Compoe:
        -   color: Colors.red,
        -   image: Recebe DecorationImage
        -   borderRadius: Recebe BorderRadius,
        -   boxShadow: Recebe uma lista de configurações para sombreamento como BoxShadow()
### BorderRadius
- Usado para passar valores que definem arrendondamento das bordas de um widget
    - BorderRadius.
        - BorderRadius.all(Recebe Radius)
        - BorderRadius.horizontal(left:Recebe Radius, right: Recebe Radius)
        - BorderRadius.vertical(top:Recebe Radius, buttom: Recebe Radius)
        - BorderRadius.only(topLeft:Recebe Radius, topRight: Recebe Radius, buttomLetf: Recebe Radius, buttomRight: Recebe Radius)
#### Radius
- Usado para passar valores ao BorderRadius
    - Radius.circular(Valor a ser passado)
    - Radius.elliptical(valor topo, valor button)
### DecorationImage
- Usado para adicionar uma imagem ao widget
    - Compoe:   
        - image: Recebe um AssetImage(Link da imagem) ou um NertWorkImage(Url da imagem)
        - fit: Recebe um BoxFit... que define o preenchimento da imagem
#### BoxShadow
- Usado para passar valores de sombreamento
    - Compoe:
        - color: Recebe uma cor (Colors.black)
        - blurRadius: Recebe um inteiro para tonalidade da sombra
        - offset: Recebe Offset(int, int) posicao da sombra, int positivo = button, right, int negativo = top, left
    - É possivel definir mais de um BoxShadow
***

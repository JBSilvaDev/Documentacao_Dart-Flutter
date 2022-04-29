# Widgets de composição para parametros que compoe outros widgets

***
## Image
- Usado para adionar imagens ***Importante configurar a tag assets no .yaml***
- É possivel colocar imagens iguais, porem de tamanhos diferentes para serem usadas de acordo com a resolução do aparelho. 
-   Se baseando pela imagem original, basta criar pastas de nomes 2.0x para imagem 2x maior, 3.0x para 3x maior e assim sucessivamente, o flutter ira reconhecer o tamanho da tela e pegar a melhor imagem para ela. A imagem menor fica na pasta raiz, e as maiores ficam nas pastas correspondentes 2.0x, 3.0x, 4.0x, etc...
- Compoe:
    -   image: Recebe Widget de imagem
        - NetworkImage ou AssetsImage que irão receber o link da imagem
- Pode ser passado da seguinte forma:
    -   Image.asset() recebe link local da imagem
    -   Image.network() recebe link online da imagem
***
## Text
- Usado para exibir textos nos aplicativos, texto passado diretamente nos ()
- Compoe:
    - style: Rebece um [TextStyle()](WidgetsTree.md#TextStyle)
### TextStyle
- Usado para estilizar textos
- Compoe:
    -   backgroundColor: Recebe Colors.cor (cor de fundo no texto)
    -   fontSize: Tamanho da fonte
    -   fontFamily: Familia a qual a fonte que vai usar pertence
    -   color: Recebe Colors.cor (cor do texto)
    -   fontWeight: Tonalidade do texto (negrito, normal...)
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
    -   color: Colors.cor,
    -   image: Recebe [DecorationImage()](WidgetsTree.md#DecorationImage)
    -   borderRadius: Recebe [BorderRadius()](WidgetsTree.md#BorderRadius),
    -   boxShadow: Recebe uma lista de configurações para sombreamento como [BoxShadow()](WidgetsTree.md#BorderRadius)
    -   image: Recebe um [DecorationImage()](WidgetsTree.md#DecorationImage) *Necessario ter configurado o .yaml **assets**
### BorderRadius
- Usado para passar valores que definem arrendondamento das bordas de um widget
    - BorderRadius.
        - BorderRadius.all(Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.horizontal(left:Recebe [Radius()](WidgetsTree.md#Radius), right: Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.vertical(top:Recebe [Radius()](WidgetsTree.md#Radius), buttom: Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.only(topLeft:Recebe [Radius()](WidgetsTree.md#Radius), topRight: Recebe [Radius()](WidgetsTree.md#Radius), buttomLetf: Recebe [Radius()](WidgetsTree.md#Radius), buttomRight: Recebe [Radius()](WidgetsTree.md#Radius))
#### Radius
- Usado para passar valores ao BorderRadius
    - Radius.
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



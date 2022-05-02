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
## CircleAvatar()
- Usado para definir imagens em formato circular (comuns em imagens de perfil)
- Compoe:
    -   backgroundImage: Recebe Widget de [imagem](./WidgetsTree.md#image)
    -   child: Recebe widget para exibição no circleavatar
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
    -   gradient: Recebe [LinearGradient()](WidgetsTree.md#LinearGradient)
    -   color: Colors.cor,
    -   image: Recebe [DecorationImage()](WidgetsTree.md#DecorationImage)
    -   borderRadius: Recebe [BorderRadius()](WidgetsTree.md#BorderRadius),
    -   boxShadow: Recebe uma lista de configurações para sombreamento como [BoxShadow()](WidgetsTree.md#BorderRadius)
    -   image: Recebe um [DecorationImage()](WidgetsTree.md#DecorationImage) *Necessario ter configurado o .yaml **assets**
## BorderSide
- Usado para formatação de bordas
    - Compoe:
        - color: Recebe um Colors.cor
        - width: Recebe a largura das bordas
        - style: Recebe um BorderStyle.nome ou BorderStyle.solid
## LinearGradient
-   Usado para passar mais de uma cor a um widget
-   Compoe:
    -   colors: Recebe uma lista de cores -> [Colors.red, Colors.green, Colors.blue]
## BorderRadius
- Usado para passar valores que definem arrendondamento das bordas de um widget
    - BorderRadius.
        - BorderRadius.all(Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.horizontal(left:Recebe [Radius()](WidgetsTree.md#Radius), right: Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.vertical(top:Recebe [Radius()](WidgetsTree.md#Radius), buttom: Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.only(topLeft:Recebe [Radius()](WidgetsTree.md#Radius), topRight: Recebe [Radius()](WidgetsTree.md#Radius), buttomLetf: Recebe [Radius()](WidgetsTree.md#Radius), buttomRight: Recebe [Radius()](WidgetsTree.md#Radius))
        - BorderRadius.circular(Valor ro radios)
## Radius
- Usado para passar valores ao BorderRadius
    - Radius.
        - Radius.circular(Valor a ser passado)
        - Radius.elliptical(valor topo, valor button)
## DecorationImage
- Usado para adicionar uma imagem ao widget
- Compoe:   
    - image: Recebe um AssetImage(Link da imagem) ou um NertWorkImage(Url da imagem)
    - fit: Recebe um BoxFit... que define o preenchimento da imagem
## BoxShadow
- Usado para passar valores de sombreamento
- Compoe:
    - color: Recebe uma cor (Colors.black)
    - blurRadius: Recebe um inteiro para tonalidade da sombra
    - offset: Recebe Offset(int, int) posicao da sombra, int positivo = button, right, int negativo = top, left
- É possivel definir mais de um BoxShadow
***
## Buttons
- Widgets recebidos nas composições de botoes
## TextButton.styleFrom()
- Recebido em TextButton()
- Compoe:
    -   primary: Recebe a cor do texto,
    -   padding: Recebe um [EdgeInsets](./WidgetsTree.md#EdgeInsets)
    -   minimumSize: Recebe tamanho minimo -> Size(largura, altura),
    -   shape: Recebe [RoundedRectangleBorder](./WidgetsTree.md#RoundedRectangleBorder) para formatação do botao ao ser clicado.
## ElevatedButton.styleFrom()
- Recebido em ElevatedButton()
- Compoe:
    -   primary: Recebe a cor do texto,
    -   padding: Recebe um [EdgeInsets](./WidgetsTree.md#EdgeInsets)
    -   minimumSize: Recebe tamanho minimo -> Size(largura, altura),
    -   shape: Recebe [RoundedRectangleBorder](./WidgetsTree.md#RoundedRectangleBorder) para formatação do botao.
## Icons
- Usado para icones
-   Compoe:
    - Icon.icone_desejado
    - size: Recebe o tamanho do icone
    - color: Recebe Colors.cor
## ButtonStyle
- Usado para estilização
    - Compoe:
        -   shadowColor: Recebe a cor da sombra do botao -> MaterialStateProperty,
        -   minimumSize: Recebe o tamanho minimo do botao - MaterialStateProperty,
        -   backgroundColor: Recebe a cor de fundo do botao em MaterialStateProperty
        -   shape: Recebe formatação do MaterialStateProperty
## MaterialStateProperty
- Usado para passar propriedades para [ButtonStyle](./WidgetsTree.md#ButtonStyle)
- Compoe:
    -   MaterialStateProperty.all(Recebe propriedades a ser passada para o botao, aceita outros widgets),
        -   MaterialStateProperty.all(Colors.cor),
        -   MaterialStateProperty.all(Size(largura, altura)),
        -   MaterialStateProperty.all([RoundedRectangleBorder()](./WidgetsTree.md#RoundedRectangleBorder)),
    -   MaterialStateProperty.resolveWith([Pode receber uma funcao com condições para aplicar uma propriedade](../img/MaterialStateProperty.png))
## RoundedRectangleBorder
-   Usado para passar formatação de bordas para widget
-   Compoe:
    -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#BorderRadius)
    -   side: Recebe BorderSide(color: Colors.red) para cor das bordas
    -   shadowColor: Recebe a cor da sombra
***
## Divider
- Usado para efetuar separação de itens (comum em listas)
- Compoe:
    - color: Recebe a cor do divisor
    - thickness: Recebe a espessura do divisor
    - height: Recebe a altura de cada item dividido
    - indent: Recebe onde a linha divisora ira iniciar,
    - endIndent: Recebe onde a linha divisora ira terminar
***
## Duration
- Usado para daley de itens ou aguardar algum tempo para continuar algo
- Compoe:
    - days: Recebe numero inteiro indormando quantos ***dias*** ira aguardar
    - hours: Recebe numero inteiro indormando quantas ***horas*** ira aguardar
    - microseconds: Recebe numero inteiro indormando quantos ***microsegundos*** ira aguardar
    - milliseconds: Recebe numero inteiro indormando quantos ***milissegundos*** ira aguardar
    - minutes: Recebe numero inteiro indormando quantos ***minutos*** ira aguardar
    - seconds: Recebe numero inteiro indormando quantos ***segundos*** ira aguardar
***
## InputDecoration
- Usado para formatação de campos de formularios
- Compoe:
    -   labelText: Recebe uma String, é o titulo do campo 
    -   border: Recebe *OutlineInputBorder()* que é composto por:
        -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#borderradius)
        -   borderSide: Recebe [BorderSide](./WidgetsTree.md#borderside)
    -   labelStyle: Recebe [TextStyle](./WidgetsTree.md#textstyle) para formatação do titulo do campo
    -   isDense: Recebe true ou false para a densidade do campo
    -   enebledBorder: Formatação da borda quando campo esta ativo, recebe *OutlineInputBorder()* que é composto por:
        -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#borderradius)
        -   borderSide: Recebe [BorderSide](./WidgetsTree.md#borderside)
    -   focusedBorder: Formatação da borda quando campo esta selecionado, recebe *OutlineInputBorder()* que é composto por:
        -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#borderradius)
        -   borderSide: Recebe [BorderSide](./WidgetsTree.md#borderside)
    -   errorBorder: Formatação da borda quando ha erro no campo, recebe *OutlineInputBorder()* que é composto por:
        -   borderRadius: Recebe [BorderRadius](./WidgetsTree.md#borderradius)
        -   borderSide: Recebe [BorderSide](./WidgetsTree.md#borderside)
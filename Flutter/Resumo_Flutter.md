# MaterialApp
## Configuração de inicialização do app
>Verificar .yaml para utilizar:
- Assets (Imagens, Fontes)
- Dependencias
    - Http > [HTTP](./Dependencias/http.md)
    - Formatação Moeda > [Currency Formatter](./Dependencias/Currency_formatter.md)
    - Conversao de valores txt/num > [intl](./Dependencias/intl.md)
    - Graficos tipo conometro/acelerador > [Gauges](./Dependencias/Gauges_Visual_Acelerometros.md)
    
>Titulo do app
- title : 'Titulo aqui'
>Tema/Cor
- theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.black))
>Pagina inicial
- initialRoute: '/nome da pagina'
>Telas/Paginas do app (Metodo 1: Navegacao entre paginas)
- routes: {'/caminho': (_) => NomeClassePage()}
>Ocultar msg de debug
- debugShowCheckedModeBanner: false,
>Alinhamento to titulo ao centro
- centerTitle: true

# HomePage
## Controle de estado da aplicação
>Controle de estado - Atualização de conteudo de tela
- setState: [Clique Aqui](./Apoio_Widgets/SetState_navegação.md)
- ChangeNotifier: [Clique Aqui](./Apoio_Widgets/ChangeNotifier_navegação.md)
- ValueNotifier: [Clique Aqui](./Apoio_Widgets/ValueNotifier_navegação.md)

## Navegação
### Por nomeacao de paginas
>Com routes{} definidos usar dentro do onPressed/onTap
```dart
Navigator.of(context).pushNamed('/Nome da pagina igual ao routes{}');
```
>Usando funcao para nevegar entre paginas por nome (referenciando aos routes{})
```dart
  void _goToPage(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed('/' + pageName);}
```
>Invocando funcao para nevegacao por nomes (com base nos routers{})
```dart
// Dentro de um onPressed/onTap
_goToPage(context, 'imc_setState_page');
```
### Por pagina (nome da classe)
```dart
// Dentro de um onPressed/onTap
Navigator.push(context, MaterialPageRoute(builder: (context) => NomeDaClassePage()),);
```
>Funcao para navegar entre paginas por classe
```dart
void _goToPage(BuildContext context, Widget page) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => page),);}
```
>Invocando funcao para navegacao por classe
```dart
// Dentro de um onPressed/onTap
 _goToPage(context, NomeDaClassePage());
 ```
>Fechar tela 
```dart
Navigator.of(context).pop();
```

## Scaffold/AppBar
>Nao redimencionar imagem de fundo
>```dart
resizeToAvoidBottomInset: false,
```
>Nome da AppBar
```dart
title: Text('Nome aqui')
```
>Ações na AppBar
```dart
actions: [ Adicona icones, botoes, textos e outras opções na barra ]
```
>Multi-Pages (Varias telas em uma só)
```dart
bottomNavigationBar: BottomNavigationBar(
    currentIndex: indice,
    onTap: (index) {
        setState(() {
            indice = index;});},
        items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.next_plan), label: 'Pagina 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.skip_next), label: 'Pagina 2'),],),
            IndexedStack(
                index: indice,
                children: [
                    Page1(),
                    Page2(),],),
```
>Botao flutuante parte inferior
```dart
floatingActionButton: FloatingActionButton(
    onPressed: (){},
    tooltip: 'Texto exibido ao parar mouse em cima',
    child: const Icon(Icons.add),),
```
>Menu lateral
```dart
drawer: const Drawer(
    child: Center(child: Text('Menu lateral (Drawer)')),
```
## Corpo da pagina/tela
>Conteudo da tela/pagina
```dart
body: Widget('Conteudo da pagina')
```
# Paginas/telas
## Conteudo das paginas/telas
>Widget de texto
```dart
Text('Texto aqui', 
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Colors.red, 
    fontWeight: 
    FontWeight.bold, 
    fontSize: 10, 
    fontFamily: 'Tourney',))
```
>Caixa com dimeções personalizaveis
```dart
Container(
// Conteudo do container, define o que sera exibido, como imagens, textos ou outros widgets
    child:
        Image.asset()
        Image.network()
        Widget...
// Define tamanho do container (recebem valor numerico)
    width/height: 10
// Distancia da borda para margem (recebem outro widget para definir o valor)
    margin: EdgeInsets.all(10),
// Distancia da margem para conteudo (recebem outro widget para definir o valor)
    padding: const EdgeInsets.all(10),
// Formatacao do container (recebe outro widget para definir cor, radius etc...)
    decoration: BoxDecoration(
        color: Define a cor do container,
        borderRadius: BorderRadius.circular(int),
        image: DecorationImage(
            image: AssetImage('Link asset da imagem') - NetWorkImage('Link da internet da imagem'),
            fit: BoxFit.fill,)
        boxShadow:[BoxShadow(
            color: Cor do sombreamento,
            offset: Offset(int, int) - posicao da sombra)])
// Opcão se deseja usar container como botao (recebe uma funcao)
    onTap: (){})
```
>Colunas e Linhas
```dart
Column/Row(
    // Conteudo da linha/coluna, define o que sera exibido, como imagens, textos ou outros widgets
    children: [ Adiciona outros widgets, textos, icones, botoes que serao exibidos dentro da coluna/linha ]
    // Posicionamento do conteudo na linha/coluna
    mainAxisAlignment: MainAxisAlignment.center, (Alinhamento conluna/linha)
    crossAxisAlignment: CrossAxisAlignment.center, (Alinhamento da conluna/linha))
```
>Media Query
```dart
// Para obter informações sobre a tela do app, configurar dendo do build do app.
final midiaQuery = MediaQuery.of(context);
// Com variavel definida é possivel obter dados da mesma como:
midiaQuery.size.width  // Obtem informação sobre largura da tela total
midiaQuery.size.height  // Obtem informação sobre altura da tela total
midiaQuery.orientation  // Obtem informação sobre orientacao da tela
midiaQuery.padding.top  // Obtem informação sobre tamanho da barra de status (parte do relogio/bateria/sinal de rede)
kToolbarHeight  // Obtem informação sobre tamanho da AppBar
```
>Rotacionar itens da tela
```dart
RotatedBox(
    // Nivel de rotacao (recebe numero inteiro positivo ou negativo)
    quarterTurns: -1
    // Conteudo que sera rotacionado
    child: Text('Este texto ficaria rotacionada para esquerda'))
```
>Scrow view para rolagem de tela
```dart
SingleChildScrollView(
    child: // Conteudo que ira ter rolagem na tela
    scrollDirection: /* Direcao da rolagem, */ 'Axis.horizontal/vartical',)
```
>Lista de itens com separador
```dart
ListView.separated(
    // Separador dos items da lista
    separatorBuilder: (context, index) {
        return Divider(
            color: Colors.black,
            thickness: 2,);}
    // Tamanho da lista
    itemCount: lista.lenght
    // Conteudo da lista
    itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text('${lista[index]}'),
            subtitle: Text('Flutter'),
            leading: CircleAvatar(
            backgroundImage: NetworkImage('Link da imagem na web'),),);},)
```
>Items sobrepostos, um sobre o outro
```dart
Stack(
    children: [ 
        Positioned(
            top: 'distancia do topo'
            right: 'distancia da direita'
            left: 'distancia da esqueda'
            bottom: 'distancia da base'
            child: Widget())
        Align(
            alignment: 'Alinhamento na tela' Alignment.topRight
            child: Widget())])
```
## Tipos de Botoes
>Botoes em textos
```dart
TextButton(
    onPressed: () {},
    child: Text('Nome no Botao'),
    // Formatação do texto
    style: TextButton.styleFrom(
        primary: Colors.red,
        padding: EdgeInsets.all(10),
        minimumSize: Size(50, 10),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)))))
```
>Botoes em icones
```dart
IconButton(
    onPressed: () {},
    // Tipo de icone
    icon: Icon(Icons.add_a_photo),
    color: Colors.green)
```
>Botao padrao
```dart
ElevatedButton(
    onPressed: () {},
    child: Text('Nome no botao'),
    // Estilizado com ElevatedButton.styleFrom
    style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
        padding: EdgeInsets.all(10),
        minimumSize: Size(50, 10),
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
        shadowColor: Colors.green),),
    // Estilizado com ButtonStile 
    style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.red),
        minimumSize: MaterialStateProperty.all(Size(50, 35)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
                return Colors.black;
            } else if (states.contains(MaterialState.hovered)) {
                return Colors.amber;
            }
    return Colors.red;},),),
```
>Botao padrao com icone
```dart
ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.airplanemode_active),
    label: Text('Nome do Botao'),)
```
>Botao em texto2
```dart
InkWell(
    onTap: () {},
    child: Text('InkWeel'),)
```
>Botao com detector de gestos
```dart
GestureDetector(
    child: Text('Dedetector de gestos'),
    onTap: () => print('Gesture Detector'),
    onVerticalDragStart: (_) => print('Movimentacao detectada'),)
```
>Container como botao
```dart
Container(
    onTap: (){})
```
## Caixas de dialogo
>Dentro de onPressed/onTap de um botao defina
```dart
showDialog(
    barrierDismissible: 'Defina' true 'ou' false 'para fechar caixa ao clicar fora dela',
    context: context,
    builder: (_) {
    return Dialog() 'Verificar tipos de Dialog() no proximo topico';},);
```
### Tipos de Dialog()
#### Dialog() - Android / Cupertino...() - IOS
>Simples 1
```dart
Dialog(
    // Definicao de tipo de bordas
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    // Define o tipo de caixa exibida e suas dimensões
    child: Widget())
```
>Simples 2
```dart
SimpleDialog(
    title: Text('Titulo da caixa'),
    contentPadding: EdgeInsets.all(10),
    children: [ 'Defina conteudo da caixa, incluindo botoes com acoes de fechar ou direcionar para outra pagina/tela' ],);
```
>Alerta
```dart
AlertDialog(
    title: Text('Titulo do alerta'),
    content: Widget()
    actions: ['Botoes de ação do alerta (confirmar/cancelar por exemplo)'],);
```
>Horarios
```dart
// Dentro de um onPressed/onTap de um botao defina
onPressed () async {
    final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),);
    'PODE OBTER A HORA SELECIONADA USANDO A VARIAVEL' (selectedTime)},
```
>Datas
```dart
// Dentro de um onPressed/onTap de um botao defina
onTap: () async {
    final dataSelecionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),  'DATA QUE IRA INICIAR'
        firstDate: DateTime(2000),  'DATA MININA'
        lastDate: DateTime(2025),  'DATA MAXIMA'
    );
    'PODE OBTER A DATA SELECIONADA USANDO A VARIAVEL' (dataSelecionada);},
```
### SnackBar
>Simples
```dart
// Dentro de um onPressed/onTap de um botao defina
onPressed: () {
    final snackbar = SnackBar(
        content: Text('Texto exibido na snackbar'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);}
```
>Com Ação
```dart
// Dentro de um onPressed/onTap de um botao defina
onPressed: () {
    final snackbar = SnackBar(
        content: Text('Texto exibido na snackbar'),
        action: SnackBarAction(
            label: 'Nome exibido no botao de acao',
            onPressed: () {},),);         
    ScaffoldMessenger.of(context).showSnackBar(snackbar);},
```
### Material Banner
>Dentro de um onPressed/onTap de um botao defina
```dart
onTap: () {
    final materialBanner = MaterialBanner(
        // Da uma quebra de linha dentro do banner para botoes adicionados
        forceActionsBelow: true,
        // Exibe o banner
        ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
        // Conteudo do Banner
        content: Text('Ola Usuario'));
        // Necessario acao apra ocultar pois nao some automaticamente 
        actions: [
        // Acao por botao
            TextButton(
            onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();},
            child: Text('Cancelar'),),],
    // Para fechamento automatico apos x tempo, definir fora do actions[]
    Future.delayed(Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();});}
```
# Formularios - StatefulWidget
>Simples
```dart
// Definir variavel dentro da class extends
String texto = '';
TextField(
    onChanged: (value) {
        setState(() {
        texto = value;});},),
```
>Completo
```dart
// Definir variavel dentro da class extends
// Variavel de chave para acesso a informações do formulario 
final formKey = GlobalKey<FormState>();
// Variavel para recuperar valor informado no campo do formulario 
final nameEC = TextEditingController();
Form(
    key: 'CHAVE DE ACESSO' formKey,
    child: Column(
        children: [
        TextFormField(
            // Configura tipo de teclado usaado para o campo
            keyboardType: TextInputType.number
            obscureText: true 'PARA SENHA,' false 'PARA TEXTOS NORMAIS'
            controller: 'VARIAVEL QUE IRA RECEBER O CONTEUDO DIGITADO' nameEC,
            // Usado para validar campo
            autovalidateMode: AutovalidateMode.onUserInteraction, 
            // Se adapta a quantidade digitada quebrando linhas
            maxLines: null,
            // Recebe um widget de formatação exemplo CurrencyTextInputFormatter() 
            inputFormatters: [Widget()]
            // Formatação do formulario
            decoration: InputDecoration(
                // Adiciona icone a direita do campo do form
                suffixIcon: Icon(Icons.done),
                // Adiciona icone a esquerda do campo do form
                prefixIcon: Icon(Icons.done),
                labelText: 'Nome do campo',
                // Formatação do texto do campo
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                // Borda padrão
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), 
                    borderSide: BorderSide(color: Colors.green)), 
                // Borda quando selecionado
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue),) 
                // Borda quando erro
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),), 
                isDense: true),
    // Validador do campo
    validator: ((value) { 
    if (value == null || value.isEmpty) {
        return 'Campo Nao Preenchido';}}),),
```
>DropDown em formulario
```dart
DropdownButtonFormField<String>(
    isDense: true,
    // Icone para exibir no dropdrown
    icon: Icon(Icons.download),
    // Usado para referenciar um dos valores na lista do dropdown (opcional)
    value: '1', 
    decoration: InputDecoration(
        labelText: 'Itens',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    // Sem este campo o drop nao abre, é possivel execultar ações dentro dele
    onChanged: (String? newValue) {},
    // Items que ira compor o dropdown
    items: [
        DropdownMenuItem(
            child: 'Conteudo Exibido no dropdown',
            value: '1',),], 
    // Validar se foi definido um conteudo no dropdown
    validator: (value) {
    if (value == null || value.isEmpty) {
        return 'Nao preenchido';}},),
```
>Exemplo de uso do formkey num botao
```dart
ElevatedButton(
    onPressed: () {
        // Obtem estado atual do formkey, se o mesmo foi validado, se nao foi fique false
        var formValid = formKey.currentState?.validate() ?? false;
        var message = 'Formulario invalido';
        // Verifica se formkey na variavel é true ou false
        if (formValid) {
        message ='Fomulario validado Valor digitado foi ${nameEC.text}';
        }
        // Exibe uma snackBar com a informação
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)));},
```
>Desafios
- Desafio 1 : [Clique aqui](./Desafios/1.flutter_clone_instagram)
    - Efetuar clone de uma tela do instagram


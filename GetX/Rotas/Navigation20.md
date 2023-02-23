# Get navigation 2.0
- Navegação entre paginas na mesma tela (NavigationBar)
- Usando com [rotas nomeadas](Rotas_Nomeadas.md)
- Utilização:
  - Declarada uma variavel observavel que corresponde ao index de cada pagina
  ```dart
    final currentIndex = 0.obs;
  ```
  - Foi envolvido por um ```Obx(){}``` na tag *bottomNavigationBar* todo o widget ```BottomNavigationBar()``` para o mesmo ser observavel pelo Getx
    - A tag *currentIndex* dentro do ```BottomNavigationBar()``` foi passado a variavel observavel declarada anteriormente 
    - Na tag *onTap* do ```BottomNavigationBar()``` é passada uma função cujo seu paramentro é um valor inteiro, ainda no onTap, á passado um switch/case do valor no paramentro da função, onde para cada caso a navegação ira direcionar para uma pagina, nesta navação ainda é passado um id, este id é o mesmo valor passado ao Getx na chave do ```Navigator()```
  - No corpo da pagina (body), é passado o widget ```Navigator() ```
    - Na tag key é pasado um ```Get.nestedKey(1)``` que nada mais é que o id de identificação do navegador, o numero 1 é o mesmo passado na navegação do switch/case.
    - Na tag *initialRoute* é passado a pagina inicial, neste caso '/'.
    - Na tag onGenereteRoute é passada uma função cujo seu paramentro é a configuração de rotas.
      - Ainda dentro da função, foi realizado um ```if(){}``` onde é feita a condição que se a configuração do nome da rota for '/', ira direcionar para pagina 1, e se for '/android', ira direcionar para pagina 2, caso contrario ira exibir um texto de pagina nao encontrada.
      - Nesta função foi declarada uma variavel do tipo Widget, onde é atribuida a pagina, e esta pagina é o retorno dentro do ```GetPageRoute()```.
- Exemplo Completo:
```dart
  Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar Page'),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            currentIndex: currentIndex.value,
            onTap: (value) {
              switch (value) {
                case 0:
                  Get.offNamed('/', id: 1);
                  break;
                case 1:
                  Get.offNamed('/android', id: 1);
                  break;
                default:
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.apple), label: 'IPhone'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.android), label: 'Android')
            ]);
      }),
      body: Navigator(

        key: Get.nestedKey(1),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          Widget page;

          if (settings.name == '/') {
            page = const BarPage1();
          } else if (settings.name == '/android') {
            page = const BarPage2();
          } else {
            page = const Center(child: Text('Pagina não encontrada'));
          }

          return GetPageRoute(page: () => page);
        },
      ),
    );
```

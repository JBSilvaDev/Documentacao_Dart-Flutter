# Get navigation 2.0

- Navegação entre páginas na mesma tela (NavigationBar).
- Utilizando [rotas nomeadas](Rotas_Nomeadas.md).
- Utilização:
  - Declaração de uma variável observável que corresponde ao índice de cada página.
  ```dart
    final currentIndex = 0.obs;
  ```
  - Envolve-se todo o widget ```BottomNavigationBar()``` com ```Obx(){}``` para torná-lo observável pelo GetX.
    - Passa-se a variável observável declarada anteriormente para a propriedade *currentIndex* do ```BottomNavigationBar()```.
    - Na propriedade *onTap* do ```BottomNavigationBar()```, é passada uma função cujo parâmetro é um valor inteiro. Dentro dessa função, é utilizado um switch/case para realizar a navegação para cada caso. A navegação é feita passando-se um ID, que é o mesmo valor passado ao GetX na chave do ```Navigator()```.
  - No corpo da página (body), utiliza-se o widget ```Navigator()```.
    - Na propriedade *key*, utiliza-se ```Get.nestedKey(1)```, que é o ID de identificação do navegador. O número 1 é o mesmo valor passado na navegação do switch/case.
    - Na propriedade *initialRoute*, passa-se a página inicial, neste caso, '/'.
    - Na propriedade *onGenerateRoute*, passa-se uma função cujo parâmetro é a configuração de rotas.
      - Dentro da função, há uma condicional ```if(){}``` que verifica se o nome da rota é '/', redirecionando para a página 1, e se for '/android', redirecionando para a página 2. Caso contrário, exibe um texto informando que a página não foi encontrada.
      - Dentro dessa função, declara-se uma variável do tipo Widget que recebe a página correspondente e essa página é retornada dentro do ```GetPageRoute()```.
- Exemplo completo:
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
        BottomNavigationBarItem(icon: Icon(Icons.android), label: 'Android')
      ],
    );
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
        page = const Center(child: Text('Página não encontrada'));
      }

      return GetPageRoute(page: () => page);
    },
  ),
);
```
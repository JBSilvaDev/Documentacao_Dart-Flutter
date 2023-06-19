# Get Rotas Nomeadas

- Configuração do `main()`
  - Dentro do `GetMaterialApp()`, defina:
    - `unknownRoute`: Recebe `GetPage()` com uma página alternativa caso uma das rotas não seja encontrada.
    - `initialRoute`: Recebe uma String com a rota da página inicial (não pode ser '/' para evitar conflito com o `unknownRoute`).
    - `getPages`: Recebe uma lista de `GetPage()`.
  - Exemplo:
  ```dart
  GetMaterialApp(
    unknownRoute: GetPage(name: '/404', page: () => const PaginaAlternativa()),
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => const PageName()),
      GetPage(
        name: '/parametros',
        page: () => const PageName2(),
        // Filho de parametros
        children: [
          GetPage(name: '/arguments', page: () => const PageName2_1()), // = '/parametros/arguments'
        ],
      ),
    ],
  );
  ```
- Navegação com rotas nomeadas segue o mesmo padrão da navegação comum, acrescentando um ***Named***.
  - `Get.toNamed()`
  - `Get.offNamed()`
  - `Get.offAllNamed()`

- Usando a navegação nomeada, há mais duas opções para envio de parâmetros.
> Path params
- O parâmetro é passado na URL na posição indicada na rota inicial.
  - Nas rotas do `GetMaterialApp()`, insira um parâmetro no meio da URL *:nome*.
  ```dart
  GetPage(name: '/pathParam/:nome/algumacoisa', page: () => const PathParamPage()),
  ```
  - Enviando o parâmetro.
  ```dart
  () {
    final param = Uri.encodeFull('Parâmetro passado por path param');
    Get.toNamed('/parametros/pathParam/$param/algumacoisa');
  },
  ```
  - Recuperando o parâmetro.
  ```dart
  Text(Get.parameters['nome'] ?? 'Sem parâmetros')
  ```
> Query params
- Os parâmetros podem ser passados tanto pela URL como por `parameters` (objeto).
```dart
Get.toNamed('/parametros/queryParam?nome=JB Silva&id=1&curso=jornada getx&descricao=Enviado por query parameters na URL');
```
```dart
Get.toNamed('/parametros/queryParam',
  parameters: {
    'nome':'JB Silva',
    'id':'1',
    'curso':'jornada getx',
    'descricao':'Enviado por query parameters em parameters'
  });
```
- Recuperando os parâmetros.
```dart
Text(Get.parameters['nome'] ?? 'Sem nome'),
Text(Get.parameters['id'] ?? 'Sem id'),
Text(Get.parameters['curso'] ?? 'Sem curso'),
Text(Get.parameters['descricao'] ?? 'Query Parameters'),
```
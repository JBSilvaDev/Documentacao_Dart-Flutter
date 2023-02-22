# Get Rotas Nomeadas
- Configuração ```main()```
  - Dentro do ```GetMaterialApp()``` definir:
    - unknownRoute: Recebe ```GetPage()``` com uma pagina alternativa caso uma das rotas nao seja encontrada
    - initialRoute: Recebe uma String com a rota da pagina inicial ( Não pode ser '/' para nao dar conflito com o ```unknownRoute``` )
    - getPages: Recebe uma lista de ```GetPages()```
  - Exemplo:
  ```dart
  GetMaterialApp(
      unknownRoute:
          GetPage(name: '/404', page: () => const PagAlterrnativa()),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const PageName()),
        GetPage(
            name: '/paramentros',
            page: () => const PageName2(),
            // Filho de paramentros
            children: [
              GetPage(
                  name: '/arguments', page: () => const PageName2_1()), // = '/paramentros/arguments'
            ]),
      ],
    );
  ```
- Navegação com rotas nomeadas segue o mesmo padão da navegação comum acrecentando um ***Named***
  - Get.toNamed()
  - Get.OffNamed()
  - Get.OffAllNamed()
- Usando a navegação nomeadas ganha-se mais duas opções para envio de paramentros
> Path params
- O paramentro é passado na URL na posição indicada da rota inicial
  - Nas rotas do ```GetMaterialApp()``` pede paramentro no meio da url *:nome*
  ```dart
    GetPage(name: '/pathParam/:nome/algumacoisa', page: () => const PathParamPage()),
  ```
  - Enviando o paramentro
  ```dart
  () {
    final param = Uri.encodeFull('Paramentro passado por path param');
        Get.toNamed('/paramentros/pathParam/$param/algumacoisa');
    },
  ```
  - Recuperando paramentro
  ```dart
  Text(Get.parameters['nome'] ?? 'Sem paramentros')
  ```
> Query params
- Os paramentros podem ser passados tanto por url ou como parameters (object)
```dart
Get.toNamed('/paramentros/queryParam?nome=JB Silva&id=1&curso=jornada getx&descricao=Enviado por query parameters na URL');
```
```dart
Get.toNamed('/paramentros/queryParam', 
  parameters: {
    'nome':'JB Silva',
    'id':'1',
    'curso':'jornada getx',
    'descricao':'Enviado por query parameters em parameters'
      });
```
- Recuperando paramentros
```dart
Text(Get.parameters['nome'] ?? 'Sem nome'),
Text(Get.parameters['id'] ?? 'Sem id'),
Text(Get.parameters['curso'] ?? 'Sem curso'),
Text(Get.parameters['descricao'] ?? 'Query Parameters'),
```

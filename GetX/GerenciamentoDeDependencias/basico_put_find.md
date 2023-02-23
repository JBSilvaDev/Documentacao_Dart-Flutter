# Get gerenciamento de dependencias basico
- No padrão flutter uma controller é disponibilizada apenas na pagina a qual foi declarada
```dart
final controller = PagController();
```
- No Get é possivel disponibilizar esta controller para todas as paginas que são posteriores a que ele foi declarado ***Home (nao consegue usar controller da pag1) -> Pag1 (controller aqui) -> Pag2 (consegue usar a controller da pag1)***, esta controller é encerrada quando a pagina a qual foi declarada é fechada.
  - Para fazer a declaração da controller usa-se o ```Get.put()```, deste modo sempre que a instancia for chamada uma nova sera criada
  ```dart
    final controller = Get.put(PagController());
  ```
  - Para manter a instancia da controller ativa (nao encerrar apos fechar), usar a tag permant do ```Get.put()```, neste modo sempre que a instancia for chamada ira buscar a que ja esta criada na memoria
  ```dart
    final controller = Get.put(PagControllerPermanent(), permanent: true);
  ```
  - Para usar a controller passada ao **Get** usa-se o ```Get.find()```
  ```dart
    Get.find<PagController>()
  ```
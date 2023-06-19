# Get Gerenciamento de Dependências Básico

No Flutter padrão, um controller é disponibilizado apenas na página em que foi declarado da seguinte forma:

```dart
final controller = PageController();
```

No GetX, é possível disponibilizar esse controller para todas as páginas que são subsequentes à página em que ele foi declarado. Por exemplo: ***Home (não consegue usar o controller da página 1) -> Pagina1 (controller declarado aqui) -> Pagina2 (consegue usar o controller da página 1)***. Essa instância do controller é encerrada quando a página em que foi declarado é fechada.

- Para declarar o controller, utiliza-se o método `Get.put()`, assim toda vez que a instância for chamada, uma nova será criada:

```dart
final controller = Get.put(PageController());
```

- Para manter a instância do controller ativa (não ser encerrada ao fechar a página), utiliza-se o parâmetro `permanent: true` no método `Get.put()`. Dessa forma, sempre que a instância for chamada, o GetX buscará a instância existente na memória:

```dart
final controller = Get.put(PageControllerPermanent(), permanent: true);
```

- Para utilizar o controller fornecido pelo GetX, utiliza-se o método `Get.find()`:

```dart
Get.find<PageController>()
```

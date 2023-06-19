# Gerenciamento básico de estado com GetX

No GetX, é possível realizar um gerenciamento de estado básico utilizando variáveis observáveis, as quais podem ser atualizadas e ter seu novo valor exibido na tela sem a necessidade de reconstruir toda a interface.

## Variável observável no GetX

Para criar uma variável observável no GetX, utiliza-se o seguinte formato:

```dart
final counter = 0.obs;
```

## Atualização da variável observável

Para atribuir um novo valor ou incrementar o valor existente da variável, pode-se usar uma função comum ou diretamente em um evento como o `onPressed`. Nesse caso, é necessário acessar o valor da variável utilizando `.value` para que o GetX entenda que o valor será alterado:

```dart
onPressed: () {
  counter.value += 1;
},
```

## Exibição do valor atualizado

Para garantir que o valor seja sempre atualizado conforme ele é alterado, é necessário envolver o widget de exibição da variável em um `Obx()`. Dessa forma, o GetX entenderá que aquele widget deve ser reconstruído sempre que um novo valor for atribuído à variável observável:

```dart
Obx(() {
  return Text('${counter.value}');
}),
```
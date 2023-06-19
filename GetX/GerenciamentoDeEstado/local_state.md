# GetX Estado Local

O GetX oferece recursos para o controle de estado local, sem a necessidade de uma controller. Duas opções comumente utilizadas são `ValueBuilder` e `ObxValue`.

## ValueBuilder

O `ValueBuilder` é usado para construir um widget que possui um estado local. A propriedade `initialValue` recebe o valor inicial, e a propriedade `builder` recebe uma função que recebe o valor inicial e um atualizador para esse valor.

```dart
ValueBuilder<String?>(
  initialValue: 'JB',
  builder: (variavel, updater) {
    return TextButton(
      onPressed: () {
        updater('JB Silva');
      },
      child: Text(variavel!),
    );
  },
),
```

Nesse exemplo, a variável `variavel` é iniciada com o valor 'JB', e o `updater` é usado para atualizá-la para 'JB Silva' quando o botão é pressionado.

## ObxValue

O `ObxValue` é usado quando o valor inicial é um observável. A função de atualização é passada como um parâmetro para o `ObxValue`, e ao ser chamada, atualiza o valor do observável.

```dart
ObxValue<RxString>(
  (variavel) => TextButton(
    onPressed: () {
      variavel('JB Silva');
    },
    child: Text(variavel.value),
  ),
  'JB'.obs,
)
```

Nesse exemplo, o valor inicial é passado como o segundo parâmetro, `'JB'.obs`, para criar um observável. Quando o botão é pressionado, a função `variavel` é chamada para atualizar o valor para 'JB Silva'.
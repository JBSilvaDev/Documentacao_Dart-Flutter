# GetX Local State
- Usados para controle de estado local, sem necessidade de uma controller
- Na tag *initialValue* ira receber o valor inicial, e na tag *builder* uma função cujo paramentro é o valor inicial e o atualizador do valor inicial
> ValueBuilder
- *variavel* inicia como 'JB', e o *updater* o atualiza para 'JB Silva'
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
> ObxValue
- O valor inicial é passado como segundo paramentro no caso 'JB'.obs, pois é um valor observavel, que ao ser clicado é alterado para 'JB Silva'
```dart
ObxValue<RxString>(
  (variavel) => TextButton(
        onPressed: () {
          variavel('JB Silva');
        },
        child: Text(variavel.value),
      ),
  'JB'.obs
)
```

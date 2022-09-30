> StatefulBuilder - Usando para rebuild dados da tela
```dart
StatefulBuilder(
            builder: ((context, setStateLocal) {
              return Column(
                children: [
                  const Text('Valor a ser atualizado'),
                  ElevatedButton(
                    onPressed: () {
                      // Ira atualizar somente os dados dentro do StatefulBuilder e nao toda a pagina
                      setStateLocal(() {});
                    },
                    child: const Text('Botao'),
                  ),
                ],
              );
            }),
          )
```

> Observers
```dart

```
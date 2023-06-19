# Workers no GetX
> Ever
- O `ever` é um worker que recebe um observável e uma função, e, à medida que o valor do observável é atualizado, uma ação é executada na função. Também é possível passar opções para não executar a função em caso de erros, uma condição para determinar se o worker deve ser executado ou não, e uma função a ser executada em caso de erros.
```dart
ever<String>(
  _nome,
  (n) {
    print('Executando o worker ever \n$n');
  },
  // Executa o worker apenas quando não há erros
  cancelOnError: true,
  // Condição para ser executado
  condition: () => _nome.value == 'jb',
);
```
- É uma boa prática definir uma lista de workers para armazenar os workers, permitindo executar o `dispose` quando necessário ou quando não forem mais utilizados.
```dart
// Lista de workers
final _workers = <Worker>[];
```
```dart
// Worker executado ao iniciar
void onInit() {
    // Executa ação sempre que a variável obs é iniciada
    // Worker a ser adicionado à lista de workers
    final everWorkers = ever<String>(
      _nome,
      (n) {
        print('Executando o worker ever \n$n');
      },
      // Executa o worker apenas quando não há erros
      cancelOnError: true,
      // Condição para ser executado
      condition: () => _nome.value == 'jb',
    );
    // Adicionando worker à lista
    _workers.add(everWorkers);
    super.onInit();
  }

  void onClose() {
    // Efetuando dispose dos workers dentro da lista
    for (var worker in _workers) {
      worker();
    }
    super.onClose();
  }
  ```
  > Once
  - O `once` possui as mesmas características do `ever`, porém a função é executada apenas uma vez.
  ```dart
ever<String>(
    _nome,
    (n) {
      print('Executando o worker once \n$n');
    },
    // Executa o worker apenas quando não há erros
    cancelOnError: true,
  );
```
- Importante não esquecer da boa prática de sempre fazer o `dispose` quando não for mais necessário utilizar o worker.
```dart
final _workers = <Worker>[];
```
```dart
@override
  void onInit() {
    // Executa ação apenas uma vez após a variável obs ser iniciada
    final onceWorkers = ever<String>(
      _nome,
      (n) {
        print('Executando o worker once \n$n');
      },
      // Executa o worker apenas quando não há erros
      cancelOnError: true,
    );
    _workers.add(onceWorkers);
    super.onInit();
  }

  @override
  void onClose() {
    for (var worker in _workers) {
      worker();
    }
    super.onClose();
  }
```
> Interval
- O `interval` executa ações com base no valor do observável em intervalos de tempo específicos.
```dart
interval<String>(_nome, (n) {
      print('#' * 50);
      print('Executando o worker interval \n$n');
    },
    // Executa o worker apenas quando não há erros
    cancelOnError: true,
    // Intervalo de execução
    time: const Duration(seconds: 3)
);
```
- Ação para o `dispose` do worker.
```dart
final _workers = <Worker>[];
```
```dart
@override
  void onInit() {
    // Executa ação a cada 3 segundos
    final intervalWorkers = interval<String>(_nome, (n) {
      print('#' * 50);
      print('Executando o worker interval \n$n');
    },
        // Executa o worker apenas quando não há erros
        cancelOnError: true,
        // Intervalo de execução
        time: const Duration(seconds: 3));
    _workers.add(intervalWorkers);
    super.onInit();
  }

  @override
  void onClose() {
    for (var worker in _workers) {
      worker();
    }
    super.onClose();
  }
```
> Debounce
- O `debounce` executa a ação após a conclusão da digitação (ou após uma pausa de 800 milissegundos, que pode ser alterada no timer, assim como no `interval`).
```dart
debounce<String>(_nome, (n) {
    print('#' * 50);
    print('Executando o worker debounce \n$n');
  },
      // Executa o worker apenas quando não há erros
      cancelOnError: true,
    );
```
- Preparação para o `dispose`.
```dart
@override
  void onInit() {
    // Executa ação após parar de digitar
    final debounceWorkers = debounce<String>(_nome, (n) {
      print('#' * 50);
      print('Executando o worker debounce \n$n');
    },
        // Executa o worker apenas quando não há erros
        cancelOnError: true,);
    _workers.add(debounceWorkers);
    super.onInit();
  }

  @override
  void onClose() {
    for (var worker in _workers) {
      worker();
    }
    super.onClose();
  }
  ```

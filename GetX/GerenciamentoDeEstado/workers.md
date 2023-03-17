# GetX Workers
> Ever
- É um worker que recebe um observavel e uma função, e conforme o valor do observavel é atualizado alguma ação é axecutada na função, t ambem é possivel passar opção de nao executar em caso de erros, um condicional e uma função a ser executada em caso de erros.
```dart
ever<String>(
  _nome,
  (n) {
    print('Executando o worker ever \n${n}');
  },
  // Executa o worker apenas quando não há erros
  cancelOnError: true,
  // Condição para ser executado
  condition: () => _nome.value == 'jb',
);
```
- É uma boa pratica definir uma variavel list do tipo Worker que ira armazener workers, assim é possivel executar o dispose do mesmo quando necessario ou nao for mais utilizado
```dart
// Lista de workers
final _workers = <Worker>[];
```
```dart
// Worker executado ao iniciar
void onInit() {
    // Executa ação sempre que a variavel obs é iniciada
    // Worker a ser adicionado a lista de workers
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
    // Adicionando worker a lista
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
  - Possui as mesmas caracteristicas do Ever, porem a função é executada somente uma vez
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
- Importante nao esquecer da boa pratica para sempre fazer o dispose quando nao for mais utilizar o worker
```dart
final _workers = <Worker>[];
```
```dart
@override
  void onInit() {
    // Executa ação apenas 1 vez apos variavel obs ser iniciada
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
- Executa ações com base na variavel observavel a cada certo tempo
```dart
interval<String>(_nome, (n) {
      print('#' * 50);
      print('Executando o worker interval \n$n');
    },
    // Executa o worker apenas quando não há erros
    cancelOnError: true,
    // Intervalos de execução
    time: const Duration(seconds: 3)
);
```
- Ação para dispose do worker
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
        // Intervalos de execução
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
- Executa a ação apos finalizar digitação (ou pausa de 800 milisegundos, pode ser alterado no timer assim como no Interval)
```dart
debounce<String>(_nome, (n) {
    print('#' * 50);
    print('Executando o worker debounce \n$n');
  },
      // Executa o worker apenas quando não há erros
      cancelOnError: true,
    );
```
- Preparando para dispose
```dart
@override
  void onInit() {
    // Executa ação apos parar de digitar
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

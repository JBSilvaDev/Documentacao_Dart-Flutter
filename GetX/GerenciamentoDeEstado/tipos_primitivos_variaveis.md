# GetX - Tipos primitivos e variáveis

Os tipos primitivos podem ser utilizados dentro do GetX de forma que sejam automaticamente observáveis quando declarados corretamente. Para atualizar os valores na tela, o widget de exibição deve estar envolvido com um `Obx()`. Em alguns casos, pode ser necessário forçar uma atualização executando um `.refresh()` no item a ser atualizado.

```dart
final nome = RxString('JB Silva');
final isAluno = RxBool(true);
final qtdCursos = RxInt(2);
final valorCurso = RxDouble(1497.00);
final jornadas = RxList(['Jornada GetX', 'Jornada ADF']);
final alunoData = RxMap({'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'});
```

Também é possível declarar as variáveis sem informar o tipo, utilizando apenas `.obs` ao final. O Dart reconhecerá o tipo da variável e a converterá automaticamente em um observável.

```dart
final nome = 'JB Silva'.obs;
final isAluno = true.obs;
final qtdCursos = 2.obs;
final valorCurso = 1497.00.obs;
final jornadas = ['Jornada GetX', 'Jornada ADF'].obs;
final alunoData = {'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'}.obs;
```

Também é possível usar classes personalizadas como tipos genéricos para torná-las observáveis. Por exemplo, considerando a classe `Aluno`:

```dart
class Aluno {
  String nome;
  Aluno({
    required this.nome,
  });
}
```

Podemos criar uma variável observável do tipo `Aluno`:

```dart
final alunoModel = Rx<Aluno>(Aluno(nome: 'JB'));
```

Ou utilizar `.obs`:

```dart
final alunoModel = Aluno(nome: 'JB').obs;
```

A forma de uso difere um pouco, sendo necessário utilizar `.value` ao acessar ou alterar os valores da variável:

```dart
Text('Aluno nome: ${alunoModel.value.nome}'),
```

Para trabalhar com tipos nulos, o GetX oferece o `Rxn`, que permite que a variável receba valores nulos automaticamente. Para esses casos, não é necessário atribuir um valor à declaração inicial da variável.

```dart
final nome = Rxn<String>();
```

Ao acessar os valores, é necessário utilizar `!` ou `?` após `.value`. Recomenda-se utilizar o operador de nulos para tratar os valores caso sejam nulos:

```dart
Text('Nome: ${nome.value ?? 'JB'}'),
```

Ou, caso tenha certeza de que o valor não será nulo:

```dart
Text('Nome: ${nome.value!}'),
```

Para atualizar um objeto na tela, pode-se utilizar os métodos de atualização disponíveis.

Considerando a classe `UsuarioModel`:

```dart
class UsuarioModel {
  String nome;
  UsuarioModel({
    required this.nome,
  });
}
```

Podemos criar uma variável observável:

```dart
final usuarioModel = UsuarioModel(nome: 'JB').obs;
```

E exibir o valor na tela:

```dart
Obx(() {
  return Text('Nome: ${usuarioModel.value.nome}');
}),
```

Para atualizar o valor do

 objeto, existem dois métodos disponíveis:

**Atualizando com `.refresh()`**

```dart
ElevatedButton(
  onPressed: () {
    usuarioModel.value.nome = 'Silva';
    usuarioModel.refresh();
  },
  child: const Text('Atualizando com refresh'),
),
```

**Atualizando com `.update()`**

```dart
ElevatedButton(
  onPressed: () {
    usuarioModel.update((usuario) {
      usuario?.nome = 'Silva JB';
    });
  },
  child: const Text('Atualizando com update'),
),
```
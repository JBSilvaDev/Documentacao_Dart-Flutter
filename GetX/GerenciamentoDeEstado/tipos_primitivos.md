# Get tipos primitivos
- Os tipos primitivos foram reestruturados para serem usados dentro do GetX, todos eles são automaticamente observaveis quando sao declarados de forma correta
```dart
  final nome = RxString('JB Silva');
  final isAluno = RxBool(true);
  final qtdCursos = RxInt(2);
  final valorCurso = RxDouble(1497.00);
  final jornadas = RxList(['Jornada GetX', 'Jornada ADF',
  ]);
  final alunoData = RxMap({'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'});
```
- Tambem podem ser declarados sem informar o tipo, passando apenas um .obs ao final, o dart ira reconhecer o tipo da variavel e ira repassar a informação ao GetX convertendo automaticamente a variavel para um observavel.
```dart
  final nome = 'JB Silva'.obs;
  final isAluno = true.obs;
  final qtdCursos = 2.obs;
  final valorCurso = RxDle(1497.00.obs;
  final jornadas = ['Jornada GetX','Jornada ADF'].obs,
  ]);
  final alunoData = {'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'}.obs;
```
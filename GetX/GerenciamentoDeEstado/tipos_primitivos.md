# Get tipos primitivos
- Os tipos primitivos foram reestruturados para serem usados dentro do GetX, todos eles são automaticamente observaveis quando sao declarados de forma correta.
- Necessario para atualização dos valores na tela o widget de exibição deve esta envolvido com um ```Obx()```, em alguns casos se faz necessario forçar uma atualização executando um ```.refresh()``` no item a ser atualizado
```dart
  final nome = RxString('JB Silva');
  final isAluno = RxBool(true);
  final qtdCursos = RxInt(2);
  final valorCurso = RxDouble(1497.00);
  final jornadas = RxList(['Jornada GetX', 'Jornada ADF',
  ]);
  final alunoData = RxMap({'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'});
```
- Tambem podem ser declarados sem informar o tipo, passando apenas um *.obs* ao final, o dart ira reconhecer o tipo da variavel e ira repassar a informação ao GetX convertendo automaticamente a variavel para um observavel.
```dart
  final nome = 'JB Silva'.obs;
  final isAluno = true.obs;
  final qtdCursos = 2.obs;
  final valorCurso = RxDle(1497.00.obs;
  final jornadas = ['Jornada GetX','Jornada ADF'].obs,
  ]);
  final alunoData = {'id': 1, 'nome': 'Jb Silva', 'tipo': 'Estudante'}.obs;
```
> Tipos gerenicos
- Neste modelo de declaração de variavel é possivel usar classes priprias para assim torna-las observaveis
- Classe usada
```dart
class Aluno {
  String nome;
  Aluno({
    required this.nome,
  });
}
```
- Variavel observavel atribuida a classe propria usada
```dart
  final alunoModel = Rx<Aluno>(Aluno(nome: 'JB'));
```
- O *.obs* tambem pode ser usado para estes
```dart
  final alunoModel = Aluno(nome: 'JB').obs;
```
- A diferenças no modo de utilização, sendo obrigado a passa um *.value* ao final da variavel para fazer alterações ou consultas a seus valores.
```dart
  Text('Aluno nome: ${alunoModel.value.nome}'),
```

# Get tipos primitivos e variaaveis
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
> Tipos nulos
- Para trabalhar com tipos nulos no **GetX** temos o *Rxn* que torna automaticamente possivel a variavel receber valores nulos, pare estes casos não se faz necessario atribuir valores a declaração inicial da variavel
```dart
final nome = Rxn<String>();
```
- Para acessar oa valores se faz necessario usar "!" ou "?" apos o velue da variavel, é recomendado usar o null operator para tratar os valores caso sejam nulos
```dart
Text('Nome: ${nome.value ?? 'JB'}'),
```
- Ou caso tenha certeza que o valor nao sera nulo
```dart
Text('Nome: ${nome.value!}'),
```
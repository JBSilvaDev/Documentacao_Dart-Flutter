# Dart
- Fundamentos: [Clique Aqui](./Fundamentos.md)
## Controle de estado da aplicação
>Principais interações da linguagem
- Lista: [Clique Aqui](./Lista_Map_Set_Enum/Listas.md)
- Map: [Clique Aqui](./Lista_Map_Set_Enum/Maps.md)
- Set: [Clique Aqui](./Lista_Map_Set_Enum/Set.md)
- Enum: [Clique Aqui](./Lista_Map_Set_Enum/Enums.md)
- Exceptions: [Clique Aqui](./Lista_Map_Set_Enum/Exceptions.md)
- For: [Clique Aqui](./Loops/For.md)
- While: [Clique Aqui](./Loops/While_DoWhile.md)
- Interables: [Clique Aqui](./Loops/Interables.md)
>Dart OO
- Async: [Clique Aqui](./Dart_OO/Async.md)
- Funcoes: [Clique Aqui](./Dart_OO/Funcao.md)
- Classes: [Clique Aqui](./Dart_OO/Classe.md)
>Desafios
- Desafio 1 : [Clique Aqui](/Desafios/Desafio_1.dart)
-   Baseado no array abaixo monte um relatório onde:
    - Apresente os pacientes com mais de 20 anos e print o nome deles
    - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
    - Apresente a quantidade de pacientes que moram em SP
```dart
//A String é composta por 3 campos (Nome|Idade|Profissao|Estado)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];
```
- Desafio 2 : [Clique Aqui](/Desafios/Desafio_2.dart)
- Baseado na lista acima.
  - 1 - Remova os pacientes duplicados e apresente a nova lista
  - 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  - 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome 
  - 4 - Encontre a pessoa mais velha e apresente o nome dela.
```dart
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];
```

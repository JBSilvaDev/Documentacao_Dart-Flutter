# Tratando mapas complexos estilo Json
- Mapas neste estilo sao comuns em retornos de bancos de dados.
- Neste arquivo vou tratar o map usando a orientação a objeto, com classes para tratar cada conteudo do mapa, no caso usarei tres classes, Aluno, Cursos e Endereco.
>Mapa usado para este exemplo
- Mapa modelo contem nome de um aluno e ainda uma lista com os cursos que este aluno esta inscrito juntamente com sua descrição, tambem conteu o endereço do aluno
    - Modelo:
        ```dart
        var alunosAdf = <String, Object>{
            'nome': 'JB Silva',
            'cursos': [
            {'nome': 'Academia do flutter', 'descricao': 'Curso atual em aprendizagem'},
            {'nome': 'Python da Hashtag', 'descricao': 'Curso em standby'}
            ],
            'endereco': 
            {'rua': 'Rua das Olivas', 'numero': 100, 'bairro': 'centro'}};
        ```        
>Classes usadas
- Aluno:
    - Esta classe ira receber os nomes dos alunos e duas listas contendo os cursos destes alunos e seus endereços.
    - Construtor criado indica que os itens sao obrigatorios e nominais
    - Ao final da classe converte o conteudo para String, assim exibindo no console o resultado.
    - Esta classe importa outras duas classes, mencionadas a seguir
    - Modelo:
        ```dart
        import 'cursos.dart';
        import 'endereco.dart';

        class Aluno {
            String nome;
            List<Cursos> cursos;
            List<Endereco> endereco;
            Aluno({
                required this.nome,
                required this.cursos,
                required this.endereco,
            });

            @override
            String toString() => 'Nome: $nome, \nEstuda: $cursos, \nMora em: $endereco';
        }
        ```
- Cursos
    - Esta classe ira receber os nomes dos cursos que cada aluno faz e a descrição deles
    - Construtor criado indica que os itens sao obrigatorios e nominais
    - Ao final da classe converte o conteudo para String, assim exibindo no console o resultado.
    - Modelo:
        ```dart
        class Cursos {
            String nome;
            String descricao;
            Cursos({
                required this.nome,
                required this.descricao,
            });

            @override
            String toString() => 'Curso: $nome, Descricao: $descricao)';
        }
        ```
- Endereço
    - Esta classe ira receber os endereços de cada aluno
        - Rua, Numero, Bairro
    - Construtor criado indica que os itens sao obrigatorios e nominais
    - Ao final da classe converte o conteudo para String, assim exibindo no console o resultado.
    - Modelo:
        ```dart
        class Endereco {
            String rua;
            int numero;
            String bairro;
            Endereco({
                required this.rua,
                required this.numero,
                required this.bairro,
            });

            @override
            String toString() => 'Rua: $rua, Numero: $numero, Bairro: $bairro)';
        }
        ```
>Aplicação
- Para os cursos:
    - Foi criada uma variavel que ira receber o conteudo da chave cursos no map, ou seja sera um novo mapa, este mapa foi tipado como <i>Map<String, String></i> pois as chaves e valores dentro dele sao ambas String.
        -  ```dart
            final cursosMap = alunosAdf['cursos'] as List<Map<String,String>>;  
            ```
    - Criada uma nova variavel onde o mapeio sera feito, obtendo assim os valores de cada chave no mapa
    - Dentro deste mapeio foi criado novas variaveis que irao receber os nomes dos cursos e suas descrições, ambas foram convertidas para String.
    - O retorno deste mapeio é a classe Cursos onde foram passados em seus metodos os valores das variaveis nome e descrição.
    - Ao final este mapeio foi convertido em uma lista
        - ```dart
            final cursosMap = alunosAdf['cursos'] as List<Map<String,String>>; 
            final cursos = cursosMap.map((curso) {

                var nome = curso['nome'] as String;
                var descricao = curso['descricao'] as String;

                return Cursos(nome: nome, descricao: descricao);
            }).toList();
            ```
- Para o endereço:
    - Foi criada uma nova variavel, apontando para a chave endereço dentro do mapa, esta variavel foi convertida em um mapa do tipo <i><String, Object></i> pois suas chaves sao Strings e seus objetos podem ser valores diversos.
        -   ```dart
            final enderecoAluno = alunosAdf['endereco'] as Map<String, Object>;
            ```
    - Dentro deste novo mapa foi buscado as chaves que compoe o endereço e setada cada uma em um nova variavel.
    - Estas variaveis foram passadas para a classe Endereco preenchedo assim seus metodos
        - ```dart
            var rua = enderecoAluno['rua'] as String;
            var numero = enderecoAluno['numero'] as int;
            var bairro = enderecoAluno['bairro'] as String;

            var endereco = [Endereco(rua: rua, numero: numero, bairro: bairro)];
            ```
- Para Aluno:
    - Foi criada uma variavel que recebeu o valor da chave nome na lista principal e foi convertida em String
    - Ao final as variaveis onde cada metodo das classes foi armazenado foi passado para a classe Aluno, atendendo assim os requisitos da mesma.
        - ```dart
            final nomeAluno = alunosAdf['nome'] as String;
            final aluno = Aluno(nome: nomeAluno, cursos: cursos, endereco: endereco);
            ```
    - Para obter somente um metodo da classe Aluno masta interar a invocação
        - ```dart
            print(aluno.nome);
            print(aluno.curso);
            print(aluno.endereco);
            ```
[Resultado consulta Map/List OO](../../Img/mapaComLista.png)


# OO Em Prática

- Usado estilo [Repository Pattern](../Repository_pattern/Repository_pattern.md)
- Usando o package [Dartion](https://pub.dev/packages/dartion) que cria um servidor local onde ira aceitar os comandos [HTTP](./../../../Dependencias/Rest-RestFull/Models/HTTP_Models.md).
    - GET  
    - POST 
    - PUT  
    - PATCH
    - DELETE
- Json Modelo usado em servidor local, arquivo bruto [aqui](./backend/db.json)
## Models
- Para cada objeto dentro da API é criado uma classe, para o modelo usado criamos as seguintes classes, <b>cada classe em um arquivo diferente</b>:
- Cada classe contendo os itens no json/map que desejamos obter
    - [Aluno](./models/aluno.md)
        ```dart
        class Aluno {
            String? id;
            String nome;
            int? idade;
            List<String> nomeCursos;
            Endereco endereco;
            List<Curso> cursos;
        }
        ```
    - [Cidade](./models/cidade.md)
        ```dart
        class Cidade {
            int id;
            String nome;
        }
        ```
    - [Curso](./models/curso.md)
        ```dart
        class Curso {
            int id;
            String nome;
            bool isAluno;
        }
        ```
    - [Endereco](./models/endereco.md)
        ```dart
        class Endereco {
            String rua;
            int numero;
            String cep;
            Cidade cidade;
            Telefone telefone;
        }
        ```
    - [Telefone](./models/telefone.md)
        ```dart
        class Telefone {
            int ddd;
            String telefone;
        }
        ```

- Note que quando um dos metodos das classes é um objeto o mesmo é tipado como a classe que ira representa-lo, exemplo, o <b>*endereço*</b> é um {objeto} no retorno da API, e seu tipo é <b>*Endereco*</b> pois é a classe que esta representando este objeto.
- Cada classe possue seus metodos
    - toMap() - É um metodo pega o objeto e transforma em um *Map* de <String, dynamic>
        - Normalmente usado para enviar dados para [API](./backend/db.json), neste metodo passamos os valores (mesmos da classe mãe) e ele nos retorna um mapa com de chave e valor de acordo com o que foi tipado
            - <b>*Objeto.id -> {"id": id}*</b>
    - fromMap() É um contrutor, onde transforma um *Map* e transforma em um objeto
        - Processo reverso do toMap() - Normalmente usado quando recebemos dados da [API](./backend/db.json) neste contrutor recebemos um *Map* e retorna seus itens (key, value) para o contrutor da classe mãe, transformando assim em um objeto
            - <b>*{"id": id} -> Objeto.id*</b>
    - toJson() É um metodo que retorna uma string do objeto (converte o objeto em string)
        - Normalmente usado para enviar dados a API (*Post, Patch/Put*) pois devemos enviar dados no formato de *MAP* porem como uma *String*, este método Encoda o o que é retornado no toMap() ou seja transforma um mapa em uma string 
            - <b>*{'key':value} -> "{'key':value}"*</b>
    - fromJson() É um contrutor que baseado no json, retorna um objeto
        - Processo reverso to toJson() - Normalmente os valores retornados da API chegam como String as este construtor Decodifica a stringo recebida e a transforma em um mapa usando o fromMap() que por sua vez transforma o mapa em objeto
            - <b>*"{'key':value}" -> {'key':value}*</b>
    - @override toString()
        - Este método é apenas para retornar o conteudo da classe, assim podemos ver o resultado no console por exemplo, sem este metodo o retorno da classe sera uma Instancia.

## Observações sobre conteudos passados nas instancias dos metodos
- Note que em alguns valores para evitar que seja passado valor nulo foi usado o aware operator *?? ''* onde é definido um valor *default* para cada instacia
***
### Classe [Endereco](./models/endereco.md)
#### Item cidade/telefone
>Envio de informações
- <b>API espera receber nesta chave um Map<String, Object></b>
    - toMap()
        - É passado na chave cidade/telefone a instacia.toMap() pois se faz necessario realizar conversao de objeto para mapa porque é o que a [API](./backend/db.json) espera receber nestas chaves.
>Recebimento de informações
- <b>A classe nesta instancia espera receber um objeto [Cidade](./models/cidade.md)/[Telefone](./models/telefone.md)</b>
    - fromMap()  
        - É passado na chave cidade/telefone os objetos [Cidade](./models/cidade.md)/[Telefone](./models/telefone.md).fromMap() pois se faz necessario realizar conversao do mapa retornado da [API](./backend/db.json) para objeto pois é o tipo que a classe espera receber.

***
### Classe [Aluno](./models/aluno.md)
#### Item nomeCurso
>Envio de informações
- <b>API espera receber nesta chave um List< String ></b>
    - toMap()
        - Uso convencional pois o valore recebido é o mesmo retornado
>Recebimento de informações
- <b>A classe nesta instancia espera receber uma List< String ></b>
    - fromMap()
        - Foi usado o *map['nomeCursos'].cast< String >()* para garantir que o tipo da lista que recebemos da [API](./backend/db.json) sera do tipo string pois é o que a classe espera receber
        - Outra alternativa para garantir o tipo correto seria *List< String >.from(map['nomeCursos']*
<br><br>

#### Item endereco
>Envio de informações
- <b>API espera receber nesta chave um Map<String, Object></b>
    - toMap()
        - É passado na chave endereco a instacia.toMap() pois se faz necessario realizar conversao de objeto para mapa porque é o que a [API](./backend/db.json) espera receber nesta chave.
>Recebimento de informações
- <b>A classe nesta instancia espera receber um objeto [Endereco](./models/endereco.md)</b>
    - fromMap()
        - Foi usado o objeto [Endereco](./models/endereco.md).fromMap() pois se faz necessario realizar conversao do mapa retornado da [API](./backend/db.json) para objeto pois é o tipo que a classe espera receber.
<br><br>

#### Item cursos:
>Envio de informações
- <b>API espera receber nesta chave uma List< Object ></b>
    - toMap()
        - É usado o [.map()](../TratamentoListMap.md) para tratar item a item da lista que a é enviado para [API](./backend/db.json)
        - Dentro dos itens mapeados é usado o .toMap() para converter os objetos em mapas e ao final usa-se o .toList() assim os mapas convertidos sao colocados dentro de uma lista se tornando o que a [API](./backend/db.json) espera receber.
>Recebimento de informações
- <b>A classe nesta instancia espera receber uma List<[Curso](./models/curso.md)></b>
    - fromMap()
        - A [API](./backend/db.json) nesta chave retorna uma lista de mapas, entao foi necessario percorrer esta lista pegando mapa a mapa tipando-os para o esperado na classe <[Curso](./models/curso.md)> e retornando cada um desses mapas como objeto ao final usa-se o .toList() para adicionar estes objetos em uma lista, se tornando assim o que a classe mãe espera receber
***
---
## Repositories
- Neste arquivo foi trabalhada a conexão com a [API](./backend/db.json) usando a classe [AlunosRepositories{}](./repositories/alunos_repositories.md)
- Dentro da classe foram criadas funcoes para execultar alguma ação no conteudo da [API](./backend/db.json)
- Todas as funcoes foram criadas para serem [ascincronas](../Async.md)
- Abra o arquivo com codigo compl
    - findALL()
        - Funcao do tipo <List<[Aluno](./models/aluno.md)>> que retorna uma lista de alunos contidos na [API](./backend/db.json)
    - findById()
        - Funcao do tipo <[Aluno](./models/aluno.md)> que recebe como parametro um id

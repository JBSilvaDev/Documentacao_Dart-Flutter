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
        -   ```dart
                Map<String, dynamic>toMap()=>{"id": id};
            ```
    - fromMap() É um contrutor, onde transforma um *Map* e transforma em um objeto
        - Processo reverso do toMap() - Normalmente usado quando recebemos dados da [API](./backend/db.json) neste contrutor recebemos um *Map* e retorna seus itens (key, value) para o contrutor da classe mãe, transformando assim em um objeto
            - <b>*{"id": id} -> Objeto.id*</b>
        -   ```dart
                factory Objeto.fromMap(Map<String, dynamic> map)=>Objeto(id:map['id']);
            ```
    - toJson() É um metodo que retorna uma string json do objeto (converte o objeto em string)
        - Normalmente usado para enviar dados a API (*Post, Patch/Put*) pois devemos enviar dados no formato de *MAP* porem como uma *String*, este método Encoda o o que é retornado no toMap() ou seja transforma um mapa em uma string 
            - <b>*{'key':value} -> "{'key':value}"*</b>
        -   ```dart
                String toJson() => jsonEncode(toMap());
            ```
    - fromJson() É um contrutor que baseado no json, retorna um objeto
        - Processo reverso to toJson() - Normalmente os valores retornados da API chegam como String as este construtor Decodifica a string recebida e a transforma em um mapa usando o fromMap() que por sua vez transforma o mapa em objeto
            - <b>*"{'key':value}" -> {'key':value}*</b>
        -   ```dart
                factory Objeto.fromJson(String json) => Objeto.fromMap(jsonDecode(json));
            ```
    - @override toString()
        - Este método é apenas para retornar o conteudo da classe, assim podemos ver o resultado no console por exemplo, sem este metodo o retorno da classe sera uma Instancia.
        -   ```dart
                @override
                String toString() {
                    return 'Objeto(id: $id);}
            ```

## Observações sobre conteudos passados nas instancias dos metodos
- Mapas por default (padrão) aceitam valores nulos, para evitar isto, uso o ***aware operator (?? '')*** onde é definido um valor caso o recebido seja nulo.
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
        - É usado o [.map()](../TratamentoListMap.md) para percorrer o conteudo da chave cursos na [API](./backend/db.json) *instancia.map((e) => retorno)*
        - Dentro dos itens mapeados é usado o .toMap() para converter os objetos em mapas e ao final usa-se o .toList() assim os mapas convertidos sao colocados dentro de uma lista se tornando o que a [API](./backend/db.json) espera receber. *instancia.map((e) => e.toMap()).toList()*
>Recebimento de informações
- <b>A classe nesta instancia espera receber uma List<[Curso](./models/curso.md)></b>
    - fromMap()
        - A [API](./backend/db.json) nesta chave retorna uma lista de mapas, entao foi necessario percorrer esta lista pegando mapa a mapa tipando-os para <[Curso](./models/curso.md)> pois é o esperado na classe e retornando cada um desses mapas como objeto ao final usa-se o .toList() para adicionar estes objetos em uma lista, se tornando assim o que a classe mãe espera receber. *map['chave'].map((e)=>Objeto.fromMap(instancia)).toList()*
***
<center>Acessando Backend</center>

---
## Repositories
- Neste arquivo foi trabalhada a conexão com a [API](./backend/db.json) usando a classe [AlunosRepositories{}](./repositories/alunos_repositories.md)
- Dentro da classe foram criadas funcoes para execultar alguma ação no conteudo da [API](./backend/db.json)
- Todas as funcoes foram criadas para serem [ascincronas](../Async.md)
- Abra o arquivo com codigo completo [aqui](./repositories/alunos_repositories.md)
    - findAll()
        - Função ajustada para comandos [HTTP](./../../../Dependencias/Rest-RestFull/Models/HTTP_Models.md).
            - get(Uri.parse('http://linkdaAPI/'))
            - jsonDecode(response.body)
        - Uso do GET
        - Funcao do tipo <List<[Aluno](./models/aluno.md)>> que retorna uma lista de alunos contidos na [API](./backend/db.json).
        - O uso deste funçao esta atrelada ao findAll() em controller
    - findById()
        - Função ajustada para comandos [HTTP](./../../../Dependencias/Rest-RestFull/Models/HTTP_Models.md).
            - get(Uri.parse('http://linkdaAPI/'))
            - jsonDecode(response.body)
        - Uso do GET
        - Funcao do tipo <[Aluno](./models/aluno.md)> que recebe como parametro um id e retorna um mapa de alunos que passa pelo fromMap() convertendo em um objeto [Aluno](./models/aluno.md)
        - O uso deste funçao esta atrelada ao findById() em controller
        - Para este caso como o retorno ja é um Objeto entre aspas, ou seja é um objeto string, podederia passar diretamente para o fromJson no retorno
            -   ```dart
                returno Aluno.fromJson(alunosResponse.body)
                ```
    - update()
        - Função ajustada para comandos [HTTP](./../../../Dependencias/Rest-RestFull/Models/HTTP_Models.md).
            - get(Uri.parse('http://linkdaAPI/'))
            - jsonDecode(response.body)
        - Uso do PUT
        - Funcao sem retorno que recebe como parametro um objeto [Aluno](./models/aluno.md) que dentro do put é passado como valor do *body* que passa pelo .toJson(), assim o .toJson(toMap()) invoca o toMap() que ira tranformar o objeto [Aluno](./models/aluno.md) em um mapa, este mapa retorna para o toJson() que o Encoda, transformando-o em uma string json, atualizando assim o BD pelo id do aluno.
        - Dependendo do tipo da API pode ser necessario incluir no put os headers, necessario ler documentação da API usada para entender suas necessidades
            - ```dart
                put(Uri.parse('http://localhost:3031/alunos/${aluno.id}'),body: aluno.toJson(), headers: {'content-type': 'application/json'});
                ```
        - O uso deste funçao esta atrelada ao update() em controller
    - insert()
        - Função ajustada para comandos [HTTP](./../../../Dependencias/Rest-RestFull/Models/HTTP_Models.md).
            - get(Uri.parse('http://linkdaAPI/'))
            - jsonDecode(response.body)
        - Uso do POST
        - Funcao sem retorno que recebe como parametro um objeto [Aluno](./models/aluno.md) que dentro do post é passado como valor do *body* que passa pelo .toJson(), assim o .toJson(toMap()) invoca o toMap() que ira tranformar o objeto [Aluno](./models/aluno.md) em um mapa, este mapa retorna para o toJson() que o Encoda, transformando-o em uma string json, inserindo assim um novo aluno ao BD.
        - Dependendo do tipo da API pode ser necessario incluir no put os headers, necessario ler documentação da API usada para entender suas necessidades
            - ```dart
                post(Uri.parse('http://localhost:3031/alunos/'),body: aluno.toJson(), headers: {'content-type': 'application/json'});
                ```
        - O uso deste funçao esta atrelada ao insert() em controller

### Observações sobre conteudos dentro das funcoes
- findALL()
    - Foi feito um mapeamento tipando o retorno da [API](./backend/db.json) como <[Aluno](./models/aluno.md)> onde cada item foi convertido em um objeto do mesmo tipo ao final com .toList() salva estes objetos retornados em uma lista, assim dando o retorno final da funcao como uma <List< Aluno >>

***
---
## Controlers
- Neste arquivo foi defina uma classe [AlunosController](./controller/alunos_controller.md) onde foi criado uma variavel _privada que recebe o conteudo de [AlunosRepositories{}](./repositories/alunos_repositories.md).
- Dentro da classe tambem foram criadas funcoes que chamam as funcoes do repositories passando informações a mesma para consulta, atualização, e inclusao de dados.
    - findAll()
        - Funcao sem retorno
        - Criada variavel onde aguarda um retorno dos repositorio chamando a variavel _privada.findAll()
        - Percorre o conteudo retornado e printa os nomes dos alunos
    - findById()
        - Funcao sem retorno que recebe um id
        - Criada variavel onde aguarda um retorno dos repositorio chamando a variavel _privada.findById(id) passando um id existente na [API](./backend/db.json) para identificar um aluno expecifico.
        - Retorna somente um aluno que corresponde ao id passado como parametro
    - update()
        - Funcao sem retorno que recebe um id
        - Criada variavel onde aguarda um retorno dos repositorio chamando a variavel _privada.findById(id) passando um id existente na [API](./backend/db.json) para identificar um aluno expecifico
        - Apos identificar um aluno é instanciado o .nomeCursos como esta instancia é uma lista de string usamos o metodo .add() para adionar um novo conteudo a esta lista
            - Em caso de setar um valor diretamente basta instanciar o objeto e passar seu valor de acordo com que a instancia pede, neste caso pede um objeto [Cidade](./models/cidade.md)
                ```dart
                aluno.endereco.cidade = Cidade(id: 9, nome: 'Posto da mata');
                ```
        - Passado o conteudo a ser atualizado,  é invocada a variavel *_privada.update(aluno)*
    - insert()
        - Criada variavel onde é passado o Objeto [Aluno](./models/aluno.md)
        - Neste objeto é preenchido os campos requeridos com seus respectivos tipos
        - Passando todo o requerido para adionar um novo conteudo a [API](./backend/db.json), é invocada a variavel _privada.insert(aluno) passando no paramentro o objeto que sera inserido no BD.

> Arquivo main
- No [arquivo principal main](./oo_em_pratica.md) invocamos a classe [AlunosController{}](./controller/alunos_controller.md) instanciando a funcao desejada



# **MVVM** Conexão com BD SQLite
- Baseado no projeto TotoListProvider
***
## Arquivo de criação do BD
- Arquivo 1 com classe ```abstract``` contendo metodos que recebem parametros tipo *Batch*. 
    - [Exemplo](../../../../../Apps/todo_list_provider/lib/app/core/database/migrations/migration.dart)
- Arquivo 2 com classe que ```implementa``` a classe do *Arquivo 1*, esta classe ira conter as funcoes que irão interagir com o BD criando tabelas atravez de comandos SQL.
    - [Exemplo](../../../../../Apps/todo_list_provider/lib/app/core/database/migrations/migration_impl.dart)
- Arquivo 3 com classe que irá conter uma lista tipada como a classe do *Arquivo 1* com um metodo que retorna uma lista de objetos a serem executados, como o objeto criado no *Arquivo 2*.
    - [Exemplo](../../../../../Apps/todo_list_provider/lib/app/core/database/sqlite_migration_factory.dart)
- Arquivo 4 com classe que abre conexão com BD e invoca os metodos no *Arquivo 3*
    - É a classe do SQLite que gera uma "fabrica" de conexões, para esta classe foi criado um construtor privado para evitar acessos diretos a classe.
    - Criadas constantes staticas e privadas onde é passado nome e versao do BD
        - Estas constantes servem para localização do BD criado
    - Criada variavel privada _db do tipo DataBase que pode ser nula
        - Esta variavel recebe o BD e serve para verificar siatuação do mesmo como saber se ele é nulo ou nao
    - Criada variavel statica privada _instace to dipo *Arquivo 4* que pode ser nulo pois pode ou nao haver conexao com o BD
    - Criado construtor vazio e privado.
        - Esta variavel serve para status da conexão com BD
        - Em seguida uma ```factory``` da classe é criada e nela é feita uma verificação se a variavel _instace é nula, e caso seja ira receber o contrutor vazio privado, e apos verificação é retornada a variavel seguida de ! onde afirmamos que ela não é nula.
    - Criada variavel _lock para trabalhar com multiplas tarefas, evitando conflitos de multiplas conexoes, esta variavel bloqueia o user de deixar "duas portas abertas", necessario importar o <i>import 'package:synchronized/synchronized.dart';</i>
***
#### Funções
> Criado funcao factory onde é feita a verificação se a conexao é nula ou nao evitando assim multiplas conexoes, caso for nulo uma conexao é aberta, caso nao ele retorna a conexao atual.
***
> Criado função openConnection que é a funcao responsavel por abrir uma conexao com BD, mais [aqui](../../../../Dependencias/Rest-RestFull/SQLite/Modelos/Criando_ConexaoBD.md)
***
> Feita condições para verificar se há conexao com BD, usando a variavel _lock para sincronizar a conexao, verificando se há alguma requisicao em aberto caso chegue uma nova solicitação ele ira aguardar a primeira concluir para executar, e caso a primeira tentativa seja falha a segunda tentara novamente, se a primeira for sucesso nao executara a segunda ira apenas retornar a conexao existente _db! que ao criar a conexao recebeu o valor de openDatabase()
***
> Os atributos de openDatabase
- databasePathFinal:  é o caminho do bd concatenado com o nome do bd
- version: recebe a versao criada na classe
- onConfigure: recebe metodo de configuracao (abaixo)
- onCreate: recebe metodo para criar o bd (abaixo)
- onUpgrade: recebe metodo para atualizar o bd caso a versao mude pra + (abaixo)
- onDowngrade: recebe metodo para desatualizar o bd caso a bersao mude pra -(abaixo)
***
> Criado método para fechar a conexao que ira chamar o .close no _db? e depois ira passar o valor de null para o mesmo, assim possibilitando nova abertura de conexao quando necessário
***
> Criado método privado de configuracao do bd _onConfigure, que recebe o bd e executa comando SQL para configura as chaves do BD
***
> Criado metodo privado para criar tabela no bd _onCreate que recebe o bd e sua versao, usando o metodo de criacao em SqliteMigrationFactory, em seguida com um for cria uma tabela para cada migration passada em SqliteMigrationFactory, no caso V1 e V2, criando duas tabelas, todo e teste. Ao final executa um commit para rodar e salvar as tabelas.
***
>Criado metodo privado que atualiza tabela no bd _onUpgrade que recebe o bd a versao antiga e a nova versao, segue a mesma logica da criacao, porem passando o valor da versao antiga do bd a ser atualizado, e com um for executa a atualizado os BDs contidos na Migration. Ao final executa um commit para rodar e salvar as tabelas.
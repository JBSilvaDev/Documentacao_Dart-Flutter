## sqlite_connection_factory
### Configurações de bd baseadas no SQLIte
- SqliteConnectionFactory:
#### Construtores
> É a classe do SQLite que gera uma "fabrica" de conexões, para esta classe foi criado um construtor privado para evitar acessos diretos a classe.
***
> Criadas constantes staticas e privadas onde é passado as versoes do BD e o nome do mesmo
***
> Criada variavel privada _db do tipo DataBase que pode ser nula
***
> Criado um _instace privado e que pode ser nulo pois pode ou nao haver conexao com o BD
***
> Criada variavel _lock para trabalhar com multiplas tarefas, evitando conflitos de multiplas conexoes, esta variavel bloqueia o user de deixar "duas portas abertas", necessario importar o <i>import 'package:synchronized/synchronized.dart';</i>
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

## sqlite_migration_factory
- Usado para controle de versoes do BD, criar e atualizar etc...
### migration
- Migration
> Classe abstract com metodos que servirao como obrigatorios para classes que as implementam
- Em ambos os metodos (create e update) foi passado o Batch do pacote sqflite usado para enviar querys de comandos para o sql
***
- MigrationV1
>Classe que implementa Migration, logo é obrigado a ter os metodos da classe implementada
- create recebe batch e executa comando sql de criação de tabela
- update recebe batch
***
- MigrationV2
>Classe criada para teste de criacao e atualização que implementa Migration, logo é obrigado a ter os metodos da classe implementada.
- create recebe batch e executa comando sql de criação de tabela
- update recebe batch e executa comando sql de atualização da tabela substituindo a anterior pela nova
***
- SqliteMigrationFactory
>Criado um metodo que cria uma lista de Migration
- Chama o MigrationV1 executando seu conteudo e criando tabela no bd
***
>Criado um metodo que atualizada uma lista de Migration, que recebe o valor da versao do bd, em seu conteudo uma variavel ira receber uma lista de Migrations e um condicional ira verificar a versao do bd, se a versao passado for verdadeira ele ira adicionar o conteudo de V2 a lista de Migrations, assim retornando uma nova lista de tabelas que substituirao as anteriores
- OBS: Em caso de atualizações, se o usuario tiver na versao 1 e seu bd estiver indo para versao 3 nao deve-se atualizar diretamente, o processo deve ser atualizar da 1 para 2 e depois da 2 para 3

## sqlite_adm_connection
- Usada para controle da conexao com bd, ira fechar a conexao caso user saia do aplicativo
- SqliteAdmConnection
>Classe que é um mixin representado pelo with, de WidgetsBindingObserver que é um observador do flutter em geral, permitindo executar ações dependendo do que usuario faça com o aplicativo.
***
>Criado metodo que fornece uma lista de opções de coisas que usuario pode fazer no app didChangeAppLifecycleState, que recebe como parametro o estado atual da aplicação, ao final o resutado do switch é passado para o pai da funcao que ira executar ou nao o novo estado da conexao.
- criada variavel para conexao com bd que recebe o SqliteConnectionFactory
- criado um switch que verifica o estado da aplicação, e ira executar uma ação para cada estado
    - em caso de ativo (resume) apenas para a funcao e nao executa nada
    - em caso de inativo, pausado ou desanexado(fechado) ira fechar a conexao com bd.





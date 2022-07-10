- Main/runApp:
>Executa o app chamando o AppModule
***
- AppModule:
>Classe principal do app, onde ira receber as estruturas no caso multiprovider, em seu child é passado o AppWidget que recebe toda configuração do Provider de seu pai.
***
>Na lista de providers foram passados
- Provider onde seu create é uma funcao sem parametros que retorna um SqliteConnectionFactory, criando assim uma conexao com bd para todo o app, em sem lazy passa o valor de false pois a conexao com o BD sera feita assim que invocada a funcao, na abertura do aplicativo
***
- AppWidget:
>Widget view principal que retorna o MaterialApp
- title : titulo do app
- home: pagina inicial do app SplashPage()
- routers:
***
>Criado na classe o initState que executa acoes quando a aplicação é inicializada
- WidgetsBinding.instance.addObserver que recebe o sqliteAdmConnection, assim verificando estado da conexao ao abrir o app
***
>Criado na classe o dispose que executa acoes ao fechar o app
- WidgetsBinding.instance.removeObserver para a verificacao de estado ao fechar o app
***
- SplashPage:

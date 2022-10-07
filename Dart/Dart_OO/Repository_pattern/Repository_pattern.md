# Repository Patern
É um padrão de projeto, onde seguimos um "modelo" que foi criado para sanar algum problema assim nao é necessario "reinventar a roda", refazer algo que ja existe, apenas usamos um metodo que outra pessoa ja desenvolveu.<br>
Com a criação deste modelo, o codigo main fica ainda mais limpo, ou seja a manutenção do codigo fica melhor e mais rapida, visto que identificar erros em menos codigo é mais facil.
Este modelo consiste em organizar os arquivos de codigos em pastas que os representem, e no arquivo principal fazemos as chamadas dos conteudos destes arquivos "externos".<br>
- Exemplos:
    - Pasta 📁 *repositories* => é a pasta que ira conter os arquivos que fazem conexão com BD/API passando os dados brutos para o controller
    - Pasta 📁 *controller* => é a pasta que ira conter a classe para onde ira controlar os dados vindos do repositories fazendo os filtros necessarios e eviando para o model
    - Pasta 📁 *models* => é a pasta onde ira conter as classe que ira modelar os dados vindos do controller e enviar para a view
    - Pasta 📁 *view* => é a pasta de interação com o usuario que capitura e recebe os dados os exibindo na tela

>Dependencias
- A implementação inicial para este caso de uso, é similar ao [HTTP](../../../Dependencias/Rest-RestFull/HTTP.md).
- Foi criada uma classe assim como mostrado no modolo [HTTP](../../../Dependencias/Rest-RestFull/HTTP.md).
- Usado a mesma [API via CEP](https://viacep.com.br/ws/45936000/json) para esta classe
- A classe importa outro arquivo dart [cidade](./arquivos/cidade.dart) e tambem o pacote [HTTP](../../../Dependencias/Rest-RestFull/HTTP.md).
- Pasta 📁 *repositories*
    - ```dart
        import "package:http/http.dart" as http;
        import 'cidade.dart';

        class CidadeRepository {
        Future<Cidade> buscarCidade() async {
            var url = 'https://viacep.com.br/ws/45936000/json';
            var link = Uri.parse(url);
            var response = await http.get(link);

            if (response.statusCode == 200) {
                return Cidade.fromJSON(response.body);
            } else {
            throw Exception();
                }
            }
        }
        ```
>Main - Arquivo principal
- No arquivo principal foi usado o seguinte codigo:
    - ```dart
        import 'package:cidade_repository.dart';
        Future<void> main() async {
            var cidadeRepository = CidadeRepository();

            try{
                var cidade = await cidadeRepository.buscarCidade();
                print(cidade);
            }catch(e){
                print("Erro ao buscar cidade");
            }
        }
      ```
- O codigo foi importado o repositório e criada uma função future, explicada [aqui](../Async.md).
- Esta função cria uma nova instância de ```CidadeRepository()``` e faz uma solicitação a mesma, caso tenha sucesso na busca, retorna a cidade, caso nao, exibe uma mensagem de erro.

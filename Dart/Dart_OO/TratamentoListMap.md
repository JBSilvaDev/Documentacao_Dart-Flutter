# Mapeamento de Listas e mapas
- Uma função muito utilizada para tratamento de mapas e listas é a funcao <i>.map()</i>, esta funcao percorre toda a lista/mapa salvando seus items/valores e retornando o conteudo salvo/mapeado.
- O retorno por padão é um interable, ou seja é um arquivo bruto que precisa ser convertido usando o <i>.toList()</i> ao final da funcão.
- Ainda neste arquivo é mostrado como é feito o tratamento usando OO
## Tratamento de listas e mapas
>Lista simples
- Modelo
    ```dart
    var frutas = ['banana','abacaxi','laranja','uva'];
    ```
    - Tratamento com For in
    ```dart
    var lista = [];
    for (var fruta in frutas) {
        lista.add('Suco de $fruta');
    }
    print(lista);
    ```
    - Tratamento com .map()
    ```dart
    var lista = frutas.map((fruta) => 'Suco de $fruta').toList(); 
    print(lista);
    ```
>Lista com mapa
- Modelo
    ```dart
    var frutasMap = [
        {'nome':'banana'},
        {'nome':'abacaxi'},
        {'nome':'laranja'},
        {'nome':'uva'}];
    ```
    - Tratamento com For in
    ```dart
    var lista = [];
    for (var fruta in frutasMap) {
        lista.add('Suco de ${fruta['nome']}');
    }
    print(lista);
    ```
    - Tratamento com .map()
    ```dart
    var lista = frutas.map((fruta) => 'Suco de ${fruta['nome']}').toList(); 
    print(lista);
    ```  
<i>[Resultado](../../Img/tratamentoLista.png)</i> 

-  For in em muitos dos casos pode ser substituido por <i>.forEach()</i>, com exceções de conexoes com banco de dados que muitas das vezes precisam de uma conexao ascincrone, e o <i>.forEach()</i> não oferece esta opção.
- Em ambos os exemplos a função percorre toda a lista pegando item a item e salvando em uma nova lista.
- Quando utilizaz o <i>.map()</i> o retorno é uma instancia, para converte-lo em lista usar o <i>.toList()</i>.

## Tratamento de listas e mapas com OO
- Para tratamento de listas e mapas com OO se faz necessario criar classes onde determinamos nela o que vamos precisar.
- Classes criadas para esta didatica
    ```dart
    class Fruta {
        String nome;
        Fruta(
        this.nome,
        );

        @override
        String toString() => 'A fruta é: $nome';
    }
    ```
    ```dart
    class Suco {
        String sabor;
        Suco(this.sabor);

        @override
        String toString() => 'Suco $sabor';
    }
    ```
- As classes acima representam o objeto que se deseja retornar
    - Classe Fruta:
        - Vai receber os nomes das frutas de uma lista/map e ira retornar o conteudo com sua formatação determinada no seu @override <i>toString()</i>
    - Classe Suco:
        - Vai receber os nomes das frutas de uma lista/map e ira retornar o conteudo com sua formatação determinada no seu @override <i>toString()</i>
>Conversão simples com OO
- Modelo
    ```dart
    var frutas = ['banana','abacaxi','laranja','uva'];
    ```
    - Tratamento com For in + OO
    ```dart
    var lista = [];
    for (var fruta in frutas) {
        lista.add(Fruta(fruta));
    }
    print(lista);
    ```
    - Tratamento com .map()
    ```dart
    var lista = frutas.map((fruta) => Fruta(fruta)).toList(); 
    print(lista);
    ```
>Conversao lista com mapa OO
- Modelo
    ```dart
    var frutasMap = [
        {'nome':'banana'},
        {'nome':'abacaxi'},
        {'nome':'laranja'},
        {'nome':'uva'}];
    ```
    - Tratamento com For in
    ```dart
    var lista = [];
    for (var fruta in frutasMap) {
        lista.add(Fruta('${fruta['nome']}'));
    }
    print(lista);
    ```
    - Tratamento com .map()
    ```dart
    var lista = frutas.map((fruta) => Fruta('${fruta['nome']}')).toList(); 
    print(lista);
<i>[Resultado OO simples](../../Img/tratamentoOO.png)</i>

- Agora usaremos as duas classes, onde a classe <i>Suco</i> ira receber os valores da classe <i>Fruta</i> como objeto.
- Neste exemplo vamos "fazer um suco" das frutas que contem na lista usando OO
- Para este exemplo vamos passar os nomes das frutas para a classe fruta dentro de uma lista, assim conseguimos criar os objetos frutas, logo poderemos instaciar seus nomes usando a classe <i>ex: fruta.nome</i>>
>Lista simples OO
- Modelo
    ```dart
    var frutas = [
        Fruta('banana'),
        Fruta('abacaxi'),
        Fruta('laranja'),
        Fruta('uva'),];  
    ```
    - Tratamento com For in
    - Note que nao sera usado como anteriormente <i>'Suco de $fruta'</i> para preenchimento da nova lista, pois agora a lista de fruta é um conjunto de objetos da classe <i>Fruta</i>.
        - Necessario criar uma nova lista tipando seu conteudo com a classe <i>Suco</i>
        ```dart
        List<Suco> sucos = []; // Cria uma lista vazia to tipo Suco
        for (var fruta in frutas) {
            final suco = Suco(fruta.nome); // Pega cada item na lista de frutas e salva
            sucos.add(suco); // Adiciona os itens salvos a lista de sucos
        }
        print(sucos);
    - Tratamento com .map()
        ```dart
        // Percorre toda lista frutas e salva seu conteudo em uma nova lista do tipo <Suco>, e efetua a conversao para lista
        var sucos = frutas.map((fruta) => Suco(fruta.nome)).toList(); 
        print(sucos);
>Lista com mapa
- Modelo
    ```dart
    var frutasMap = [
        {'nome':'banana'},
        {'nome':'abacaxi'},
        {'nome':'laranja'},
        {'nome':'uva'}];
    ```
    - Tratamento com For in
        - Necessario criar uma nova lista tipando seu conteudo com a classe <i>Suco</i>
        - Note que o valor passado para classe <i>Suco</i>. nao pode ser nulo, entao uso o Aware Operators(??) para que, caso seja nulo, adicione <i>Sem Sabor</i>.
        - Usamos o Aware Operators (??) quando nos deparamos com o erro:
            - <i>The argument type 'String?' can't be assigned to the parameter type 'String</i>
        ```dart
        List<Suco> sucos = []; 
        for (var fruta in frutasMap) {
            final suco = Suco(fruta['nome'] ?? 'Sem Sabor'); 
            sucos.add(suco);
        }
        print(sucos);  
    - Tratamento com .map()
    ```dart
    var sucos = frutasMap.map((fruta) => Suco(fruta['nome'] ?? 'Sem Sabor')).toList();
    print(sucos);
    ```
<i>[Resultado OO ](../../Img/sucoOO.png)</i>  
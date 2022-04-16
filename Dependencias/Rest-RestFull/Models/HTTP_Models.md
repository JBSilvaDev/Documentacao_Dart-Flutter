# Models
> Segue mesmos principios do [HTTP](/Dependencias/Rest-RestFull/HTTP.md), alterando apenas o metodo de uso.

>Usa-se classes para representar o que o json ira retornar, nos exemplos uso [Cidade](.\ClassesModels\cidade.dart).

- Os atributos da classe [Cidade](.\ClassesModels\cidade.dart):
    - sao alguns dos items que estao retornando do json [API via CEP](https://viacep.com.br/ws/45936000/json).
- O construtor:
    - usa o required para dizer que os itens sao obrigatorios
- Metodos:
    - foram criados 4 métodos, métodos sao contrutores e como ja existe um construtor chamado Cidade, usamos um extensor no nome para identifica-los, no caso fromMap.
- Metodo 1 
   - ```dart
        factory Cidade.fromMap(Map<String, dynamic> map) {}
     ```
    - Ira receber um mapa de String e dynamic de nome map.
    - Ira retornar o contrutor Cidade, passando as informações para cada item requerido, caso o json nao retorne um dado passa a informação como vazia
        - ```dart
            return Cidade(
                cep: map['cep'] ?? '')
          ```
- Metodo 2
    - ```dart
        factory Cidade.fromJSON(String source) {}
      ```
    - Ira receber uma String de nome source
    - Em seu conteudo tera uma variavel onde ira converter esta String recebida em mapa
    - Ira retornar o método Cidade.fromMap que irá efetuar a criação do objeto solicitado

# Parei no minuto 7 da aula de models, continua...

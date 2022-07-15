# Geters e Seters

>Usados para passar ou pegar valores de atributos privados dentro da classe <br>

## Criando uma classe

```dart
class NomeDaClasse {}
```

>Classes possuem caracteristicas e comportamentos

```dart
class NomeDaClasse{
    // Atributos / Caracteristicas
    String? nome;
    int? idade;;
}
```

>Invocando/Instaciando uma classe

```dart
// Criando o Objeto
var variavel = NomeDaClasse();
// Passsando valores para os atributos do objeto
variavel.nome = 'Nome';
variavel.idade = 10;
```



- Usa-se get/set para acessados
- Se a classe estiver no mesmo arquivo que o main pode ser acessado diretamente
- Se a classe estiver em arquivo separado so pode acessar com get/set
  - Neste get/set pode-se colocar alguma condicao para aceitar o valor passado ou nao
  - Exemplo abaixo se o valor da idade for igual a 0 retorna um erro e nao aceita

```dart
class NomeDaClasse {
// Caracteristica
String? nome;
int? _idade;
// Get/Set
int? get idade => _idade;
set idade(int? idade) {
    if (idade == 0) {
        throw Exception('Informe uma idade valida');
    }
}
}
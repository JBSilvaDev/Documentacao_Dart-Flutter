# Validatorless
>Usado para fazer validações, comumente usado em formularios<br>
Docs: [Clique aqui](https://pub.dev/packages/validatorless)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    validatorless: ^1.2.1 #(Ou qualquer outra versão na documentação)
```
- Dentro do ```TextFormField``` em seu validator passar o ```ValidatorlessMutiple([])``` que recebe uma lista de validações dos tipos:
    - Validatorless.required(String)
        - Torna o campo obrigatorio, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.email(String)
        - Verifica se o email é valido, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.min(int, String)
        - Determina a quantidade minima no campo, recebe uma msg para ser exibida ao usuario
    - Validatorless.max(int, String)
        - Determina a quantidade maxima no campo, recebe uma msg para ser exibida ao usuario
    - Validatorless.between(int, int, String)
        - Determina a quantidade media, entre um valor e outro para o campo, recebe uma msg para ser exibida ao usuario
    - Validatorless.number(String)
        - Verifica se o digitado é numero, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.cpf(String) 
        - Verifica se o numero é um CPF valido, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.cnpj(String) 
        - Verifica se o numero é um CPF valido, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.date(String) 
        - Verifica se o numero é um CNPJ valido, caso não, recebe uma msg para ser exibida ao usuario
    - Validatorless.compare(*controller do campo que ira comparar*, String)
        - Verifica se o valor digitado é igual ao controlador, caso não, recebe uma msg para ser exibida ao usuario
        - Necessario class com funcao comparadora
        ```dart
         class Validators{
            Validator._();
            static FormFildValidaror compare (TextEditingController? valueEC, String msg){
                return (value{
                    final valueCompare = valueEC?.text ?? '';
                    if value == null || (value ! null && value != valueCompare)){
                        return message;
                    }
                })
            }
         }
         ```
        - Para invocar validação em um botão usar a chave global do formulario ```formKey.currentState.validate() ?? false```
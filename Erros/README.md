# Erros e Correções
>Cache
- Para limpeza de cache usar o ```flutter clean``` e depois ```flutter pub get```
>Failed assertion: line x pos x: 'children.isNotEmpty': is not true
- Informa que um ou mais itens num arquivo não pode ser vazio
>The method '...' can't be unconditionally invoked because the receiver can be 'null'. Try making the call conditional (using '?.') or adding a null check to the target ('!').
- Informa que o metodo usado pode ser nulo, deve-se usar ! par garantir que o valor nao sera nulo ou ? para informar que realmente pode ser nulo e se caso nao for continua.
>A value of type 'TipoDoValor?' can't be returned from the method '...' because it has a return type of 'Future< TipoDoValor >'
- Informa que o valor retornado pode ser nulo, deve-se garantir que o valor de retorno nao é nulo passando uma !, ideal fazer um if de verificação antes do retorno, pois se der essa garantia "!" e o valor do retorno chegar nulo ira quebrar a aplicação.
>MissingPluginException (MissingPluginException(No Implementation found for method getApplicationSupportDirectory on channel '...'))
- Informa que esta usando algo que ainda nao esta implementado, acontece quando adicionamos novas configurações ao app, deve-se parar totalmente o emulador e iniciar novamente.

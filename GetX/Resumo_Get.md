# GetX

- Documentação em Pt-BR: [Clique Aqui](https://github.com/jonataslaw/getx/blob/master/README.pt-br.md)

## Principais interações
- Instalação:
> No terminal
```dart
flutter pub add get
```
> Ou diretamente no pubspec.yaml
```yaml
dependencies:
  get: ^4.6.5
```
- Disponibilizar o Get para a aplicação
  - Substitua `MaterialApp()` por `GetMaterialApp()`

### Gerenciamento de rotas
- Get [to](./Rotas/To.md)
- Get [back](./Rotas/Back.md)
- Get [off](./Rotas/Off.md)
- Get [offAll](./Rotas/OffAll.md)
- Get com [parâmetros](./Rotas/Enviando_Paramentros.md)
- Get com [rotas nomeadas](./Rotas/Rotas_Nomeadas.md)
- Get com [navigation 2.0](./Rotas/Navigation20.md) (BottomNavigationBar)

### Gerenciamento de dependências
- Get [put and find](./GerenciamentoDeDependencias/basico_put_find.md) (básico)
- Get [lazyPut, fenix](./GerenciamentoDeDependencias/lazyput_fenix.md)
- Get [bindings](./GerenciamentoDeDependencias/Bindings/Descricao.md)

### Gerenciamento de estado
- Get [state manager](./GerenciamentoDeEstado/basico_state_manager.md) (básico)
- Get [tipos primitivos e variáveis](./GerenciamentoDeEstado/tipos_primitivos_variaveis.md)
- Get[X controller](./GerenciamentoDeEstado/getx_controller.md)
- Get[X widget](./GerenciamentoDeEstado/getx_widget.md)
- Get [local state widgets](./GerenciamentoDeEstado/local_state.md)
- Get [workers](./GerenciamentoDeEstado/workers.md)
- Get[Builder](./GerenciamentoDeEstado/getbuilder.md)
- Get [state mixin](./GerenciamentoDeEstado/state_mixin.md)

### Utilitários do Get
- Get [context extension](./GetUtils/context_extension.md)
- Get [margin/padding extension](./GetUtils/margin_padding_extension.md)
- Get[View](./GetUtils/get_view.md)
- Get [responsive view](./GetUtils/responsive_view.md)
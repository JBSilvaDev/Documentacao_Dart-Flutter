# Flutter Orientations

Este documento fornece uma visão geral dos tópicos relacionados ao desenvolvimento em Flutter.

## Widgets

- [MaterialApp](./Principais//MaterialApp.md):
  - Widget raiz para um aplicativo Flutter que implementa o Material Design.
- [HomePage](./Principais/HomePage.md):
  - Widget que representa a página inicial do aplicativo.
- [Scaffold](./Principais/Scaffold.md):
  - Widget que fornece a estrutura básica de uma tela/material, incluindo AppBar, corpo e outras funcionalidades.
- [AppBar](./Principais/AppBar.md):
  - Widget que exibe uma barra de aplicativo no topo da tela.
- [Drawers](./Widgets/Drawers.md):
  - Widgets que fornecem menus deslizantes laterais em um aplicativo.
- [Formulários & Inputs](./Widgets/Forms.md):
  - Widgets para criar e trabalhar com formulários e campos de entrada de dados.
- [Widgets](./Widgets/WidgetGeral.md):
  - Uma visão geral dos principais widgets disponíveis no Flutter.
- [Widgets Composição](./Widgets/WidgetsTree.md):
  - Como compor widgets em hierarquias para criar interfaces complexas.
- [Caixas de diálogo (popup)](./Widgets/Dialogs.md):
  - Uso de caixas de diálogo para exibir informações ou solicitar ações do usuário.
- [Navegação](./Principais/Navegacao.md):
  - Como navegar entre telas/páginas em um aplicativo Flutter.
- [Navegação com animação](./Principais/Nav_Animation.md):
  - Adicionando animações durante a navegação entre telas/páginas.
- [Parâmetros de Navegação](./Principais/Parametros_Navegacao.md):
  - Passagem de dados entre telas/páginas durante a navegação.
- [Gerenciamento de estado - setState](./Principais/Gerenciamento_estado_setState.md):
  - Utilização do método setState para atualizar o estado dos widgets.
- [Gerenciamento de estado - ValueNotifier](./Principais/Gerenciamento_estado_ValueNotifier.md):
  - Utilização do ValueNotifier para gerenciar e reagir a alterações de estado.
- [Gerenciamento de estado - ChangeNotifier](./Principais/Gerenciamento_estado_ChangeNotifier.md):
  - Utilização do ChangeNotifier para gerenciar o estado de um aplicativo.
- [Gerenciamento de estado - Bloc Pattern](./Principais/Gerenciamento_estado_BlockPatternPage.md):
  - Uso do Bloc Pattern para gerenciar o estado em aplicativos Flutter.
- [Gerenciamento de estado - MobX](./Principais/MobX_Modelo.md):
  - Utilização do MobX para gerenciar o estado de um aplicativo.
- [Gerenciamento de estado - MobX Codegen](./Principais/MobX_Modelo_Codegen.md):
  - Geração de código automatizada para MobX usando mobx_codegen.
- [Provider](./Principais/Provider_Modelo.md):
  - Utilização do Provider para compartilhar objetos/modelos entre widgets.
- [Inherited widget - Adicionar classe personalizada na árvore de componentes](./Principais/Inherited_widget.md):
  - Utilização do InheritedWidget para compartilhar dados na árvore de widgets.
- [Scroll - List](./Widgets/Scroll_List.md):
  - Rolagem de tela e exibição de listas longas.
- [Media Query](./Principais/MediaQuery.md):
  - Acesso a informações sobre a mídia (dimensões da tela, orientação, etc.).
- [Layout Builder](./Principais/Layout_Builder.md):
  - Criação de layouts responsivos com base nas restrições de layout fornecidas.
- [BuilderContext](./Principais/BuildContext.md):
  - Transferência de informações entre arquivos através do contexto.

## Modelos de Widgets de Classe

- [Tema Personalizado](./Widgets/Theme.md):
  - Criação de um tema personalizado para o aplicativo.
- [Formulário Personalizado](./Widgets/ListField.md):
  - Criação de um formulário personalizado com campos de entrada.
- [Alert Dialog](./Widgets/AlertDialog.md):
  - Criação de uma caixa de diálogo de alerta personalizada.

## Conexão com Banco de Dados (Interação com o Usuário)

- [Conexões BD Dart](../Dependencias/Dependencias.md#conexão-com-bd):
  - Utilização de bibliotecas para realizar conexões com bancos de dados em Dart.
- [Transformando JSON em ListView](./Principais/JsonToList.md):
  - Conversão de dados JSON em uma lista exibida por um ListView.
  - Para leitura de JSON local, utilize a mesma estrutura apresentada, substituindo os comandos HTTP (get, put, post) por `rootBundle.loadString('Caminho JSON')`.
  - É necessário configurar o arquivo `.yaml` para permitir o acesso à pasta assets.
- [Flutter SQLite](../Dependencias/Rest-RestFull/SQLite/SQLite.md):
  - Utilização do SQLite para armazenar dados localmente em um aplicativo Flutter.
- [FirebaseAuth](../Dependencias/Rest-RestFull/FireBase/Autenticacao/FireBase.md):
  - Autenticação de usuários usando o Firebase Auth no Flutter.
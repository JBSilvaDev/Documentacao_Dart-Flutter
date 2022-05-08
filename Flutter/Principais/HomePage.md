# HomePage
- É uma classe normalmente do tipo [StatelessWidget](../Fundamentos.md#tipos-basicos-widgets), mas dependendo da aplicação pode ser [StatefulWidget](../Fundamentos.md#tipos-basicos-widgets)
- Pode receber variaveis em seu < State > em caso de [StatefulWidget](../Fundamentos.md#tipos-basicos-widgets)
- Seu return por padrão é um [Scaffold](./Scaffold.md) pois o mesmo ja tras o layout basico padrao do flutter

- Exemplo de HomePage [StatelessWidget](../Fundamentos.md#tipos-basicos-widgets)
    ```dart
    class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold()
    ```

- Exemplo de HomePage [StatefulWidget](../Fundamentos.md#tipos-basicos-widgets)
    ```dart
    class StatickHomepage extends StatefulWidget {
    const StatickHomepage({Key? key}) : super(key: key);

    @override
    State<StatickHomepage> createState() => _StatickHomepageState();
    }

    class _StatickHomepageState extends State<StatickHomepage> {
    final String variavel = 'Variavel se declara aqui';

    @override
    Widget build(BuildContext context) {
        return Scaffold()
    ```
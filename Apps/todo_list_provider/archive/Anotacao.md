- Dismissible (Arrasta para alguma ação)
- Usado para executar alguma ação ao arrastar um item de uma lista, é composto por:
  - background: Recebe um widget que é exibido ao arastar um item da lista
  - direction: Recebe ```DismissDirection.ALGO``` que determina a direção do arrastar
  - confirmDismiss: Recebe funcao que retorna algo para confirmar a ação
  - key: Recebe uma ```final _formKey = GlobalKey<FormState>();```
  - child: Recebe view em lista dos items que a ação do dismiss tera efeito

```dart
Dismissible(
        background: Container(color: Colors.red),
        direction: DismissDirection.endToStart,
        confirmDismiss: (DismissDirection direction) {
          return showDialog(
              context: context,
              builder: (_) {
                final int id = model.id;
                return RemoveTask(context, model.description, id);
              });
        },
        key: _formKey,
        child: IntrinsicHeight(
          child: ListTile(),
        ),
      ),``

```
- Modelo 2
```dart
Dismissible(
        background: Container(
          color: Colors.red,
          child: Row(
            children: [
              Text('Você vai deletar isto! ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(
                width: 20,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (DismissDirection direction) {
          return showDialog(
              context: context,
              builder: (_) {
                final int id = model.id;
                return RemoveTask(context, model.description, id);
              });
        },
        // onResize: null,
        key: _formKey,
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: EdgeInsets.all(8),
            leading: Checkbox(
              onChanged: (value) =>
                  context.read<HomeController>().checkOrUncheckTask(model),
              value: model.finished,
            ),
            title: Text(
              model.description,
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              dateFormat.format(model.dateTime),
              style: TextStyle(
                  decoration:
                      model.finished ? TextDecoration.lineThrough : null),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(width: 1)),
          ),
        ),
      ),
  ```

- Pop Up personalizado

```dart
class RemoveTask extends AlertDialog {
  RemoveTask(BuildContext context, String task, int id)
      : super(
          title: const Text('Deletar Task?'),
          content: Text('$task'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeController>().removeTask(id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Removida a anotação: $task'),
                    ));
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Sim'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
            // SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Não'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ],
        );
}
```

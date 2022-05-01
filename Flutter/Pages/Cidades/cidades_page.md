```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/cidade.dart';
import 'package:http/http.dart';

class CidadesPage extends StatefulWidget {
  const CidadesPage({Key? key}) : super(key: key);

  @override
  _CidadesPageState createState() => _CidadesPageState();
}

class _CidadesPageState extends State<CidadesPage> {
  var cidades = <Cidade>[];

  @override
  void initState() {
    super.initState();
    _loadCities();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Habilite o Dartion para interagir com json',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 5),
          width: 330,
          padding: EdgeInsets.all(30),
          behavior: SnackBarBehavior.floating));
    });
  }

  Future<void> _loadCities() async {
    final cidadesJson = await get(Uri.parse('http://10.0.2.2:8000/cidades'));
    setState(() {
      var cidadesList = jsonDecode(cidadesJson.body);
      cidades =
          cidadesList.map<Cidade>((city) => Cidade.fromMap(city)).toList();
    });
  }

  Future<void> _newCities(Cidade cidade) async {
    await post(Uri.parse('http://10.0.2.2:8000/cidades/'),
        body: cidade.toJson(), headers: {'content-type': 'application/json'});

    setState(() {
      _loadCities();
    });
  }

  Future<void> _updateCities(
      {required Cidade cidade, required String id}) async {
    await put(Uri.parse('http://10.0.2.2:8000/cidades/$id'),
        body: cidade.toJson(), headers: {'content-type': 'application/json'});

    setState(() {
      _loadCities();
    });
  }

  Future<void> _removeCities(String id) async {
    await delete(Uri.parse('http://10.0.2.2:8000/cidades/$id'));

    setState(() {
      _loadCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _loadCities();
                });
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                setState(() {
                  _newCities(
                      Cidade(cidade: "Posto da mata", estado: "BA", id: "8"));
                });
              },
              icon: const Icon(Icons.new_label_sharp)),
          IconButton(
              onPressed: () {
                setState(() {
                  _updateCities(
                      id: "5", cidade: Cidade(cidade: 'Itabatã', estado: 'BA'));
                });
              },
              icon: const Icon(Icons.update))
        ],
        title: const Text('Cidades'),
      ),
      body: ListView.builder(
        itemCount: cidades.length,
        itemBuilder: (context, index) {
          var cidade = cidades[index];
          return ListTile(
              trailing: IconButton(
                  onPressed: () {
                    _removeCities('${cidade.id}');
                  },
                  icon: Icon(Icons.delete)),
              title: Text(cidade.cidade),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cidade.estado),
                  Text('ID: ${cidade.id}'),
                ],
              ));
        },
      ),
    );
  }
}
```
import 'package:app_rascunhos/api_dio/controller/home_controller.dart';
import 'package:app_rascunhos/api_dio/models/post_model.dart';
import 'package:app_rascunhos/api_dio/repositories/home_repository_imp.dart';
import 'package:app_rascunhos/api_dio/services/prefs_services.dart';
import 'package:flutter/material.dart';

class HomePageLoginApi extends StatefulWidget {
  const HomePageLoginApi({Key? key}) : super(key: key);

  @override
  State<HomePageLoginApi> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLoginApi> {
  final HomeController _controller =
      HomeController(homeRepositoryImp: HomeRepositoryImp());
  @override
  void initState() {
    _controller.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Login'),
        actions: [
          IconButton(
              onPressed: () {
                PrefsServices.logout();
                Navigator.pushReplacementNamed(context, '/splashapi');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: ((_, lista, __) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: lista.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Text('${lista[index].id}'),
                  trailing: const Icon(Icons.arrow_right),
                  title: Text(
                    lista[index].title,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/homedetalhes',
                        arguments: lista[index]);
                  },
                )),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.fetch();
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}

import 'package:app_rascunhos/login/controller/home_controller.dart';
import 'package:app_rascunhos/login/models/post_model.dart';
import 'package:app_rascunhos/login/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePageLogin extends StatefulWidget {
  const HomePageLogin({Key? key}) : super(key: key);

  @override
  State<HomePageLogin> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  final HomeController _controller =
      HomeController(homeRepositoryImpl: HomeRepositoryImpl());
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
        ),
        body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: ((_, lista, __) {
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(
                      lista[index].title,
                    ),
                  )),
            );
          }),
        ));
  }
}

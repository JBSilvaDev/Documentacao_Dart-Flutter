import 'package:api_filmes/controllers/movie_controller.dart';
import 'package:api_filmes/models/movies_model.dart';
import 'package:api_filmes/repositories/movies_repository_impl.dart';
import 'package:api_filmes/service/dio_service_impl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesRepositoryImpl(DioServiceImpl()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: ValueListenableBuilder<Movies?>(
          valueListenable: _controller.movies,
          builder: (context, value, child) {
            return value != null
                ? ListView.builder(
                    itemCount: value.name.length,
                    itemBuilder: ((context, index) =>
                        Text(value.name)),
                  )
                : Container();
          },
        ));
  }
}

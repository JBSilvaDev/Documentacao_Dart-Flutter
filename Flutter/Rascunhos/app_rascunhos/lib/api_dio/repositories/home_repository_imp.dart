import 'package:app_rascunhos/api_dio/repositories/home_repository_abs.dart';

import 'package:dio/dio.dart';

import '../models/post_model.dart';

class HomeRepositoryImp implements HomeRepositoryAbs {
  @override
  Future<List<PostModel>> getList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List).map((e) => PostModel.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}

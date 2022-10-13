import 'dart:convert';

import 'package:app_rascunhos/login/models/post_model.dart';
import 'package:app_rascunhos/login/repositories/home_repository_abs.dart';
import 'package:flutter/services.dart';

class HomeRepositoryImpl implements HomeRepositoryAbs {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
  
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromMap(e)).toList();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_rascunhos/api_dio/login_api/models/post_model.dart';
import 'package:app_rascunhos/api_dio/repositories/home_repository_imp.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeRepositoryImp _homeRepositoryImp;
  HomeController({
    required HomeRepositoryImp homeRepositoryImp,
  }) : _homeRepositoryImp = homeRepositoryImp;

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepositoryImp.getList();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_rascunhos/login/models/post_model.dart';
import 'package:app_rascunhos/login/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeRepositoryImpl _homeRepositoryImpl;
  HomeController({
    required HomeRepositoryImpl homeRepositoryImpl,
  }) : _homeRepositoryImpl = homeRepositoryImpl;

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepositoryImpl.getList();
  }
}

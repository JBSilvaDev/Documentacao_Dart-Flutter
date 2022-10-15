

import '../models/post_model.dart';

abstract class HomeRepositoryAbs {
  Future<List<PostModel>> getList();
}
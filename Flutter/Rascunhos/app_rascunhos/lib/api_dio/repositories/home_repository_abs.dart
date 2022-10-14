

import '../login_api/models/post_model.dart';

abstract class HomeRepositoryAbs {
  Future<List<PostModel>> getList();
}
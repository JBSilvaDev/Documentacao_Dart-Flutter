import 'package:app_rascunhos/login/models/post_model.dart';

abstract class HomeRepositoryAbs {
  Future<List<PostModel>> getList();
}

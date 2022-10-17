import 'package:api_filmes/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}

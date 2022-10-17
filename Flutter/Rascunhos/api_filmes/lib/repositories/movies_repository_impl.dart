// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_filmes/models/movies_model.dart';
import 'package:api_filmes/repositories/movies_repository.dart';
import 'package:api_filmes/service/dio_service.dart';
import 'package:api_filmes/utils/apis.utils.dart';
import 'package:dio/dio.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImpl(
    this._dioService,
  );
  @override
  Future<Movies> getMovies() async {
    Response result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}

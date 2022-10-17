// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:api_filmes/models/movies_model.dart';
import 'package:api_filmes/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

 ValueNotifier<Movies?> movies= ValueNotifier<Movies?>(null);
  MovieController(
    this._moviesRepository,
  ) {
    fetch();
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}

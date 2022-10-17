import 'package:api_filmes/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3', 
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2M4Y2Q2Mzk2MzE5MzczZTA4MTcxY2Q4ZDBkYzAyYyIsInN1YiI6IjYzNGQ3OWMzZTI2M2JiMDA3YzI5MjgyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OF9XZRUCJv7nTu2IMPxpQ4pe29iVvpu4LVpyO6w7RDI',
        'Content-Type': 'application/json;charset=utf-8'
      }),
    );
  }
}

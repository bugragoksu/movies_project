import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkService {
  final Dio dio;

  NetworkService(this.dio);
}

@module
abstract class DioModule {
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3/',
          queryParameters: {
            'api_key': '35ef0461fc4557cf1d256d3335ed7545',
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
}

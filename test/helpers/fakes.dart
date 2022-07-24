import 'package:mocktail/mocktail.dart';
import 'package:movie_challenge_project/infrastructure/movie/data-source/movie_data_source.dart';
import 'package:movie_challenge_project/infrastructure/movie/service/movie_service.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

class MockMovieService extends Mock implements MovieService {}

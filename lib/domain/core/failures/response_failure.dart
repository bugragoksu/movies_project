import 'package:movie_challenge_project/domain/core/failures/failure.dart';

class ResponseFailure extends Failure {
  const ResponseFailure({
    required super.message,
    required this.statusCode,
  });

  final int statusCode;
}

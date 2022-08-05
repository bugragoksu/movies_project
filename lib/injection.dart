import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String? environment = Environment.dev}) async => $initGetIt(
      getIt,
      environment: environment,
    );

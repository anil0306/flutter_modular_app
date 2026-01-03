import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:login/data/di/injection.config.dart';

@InjectableInit()
Future<void> configureLoginFeatureDependencies(
    GetIt getIt, String? environment) async {
  getIt.init(environment: environment);
}

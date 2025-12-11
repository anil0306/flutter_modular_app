import 'package:get_it/get_it.dart';
import 'package:flutter_modular_app/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String? environment) =>
    getIt.init(environment: environment);

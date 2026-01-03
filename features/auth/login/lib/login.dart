import 'package:dio/dio.dart';
import 'package:flutter_modular_app/di/injection.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Dio dio = Dio();
}

void doLogin() async {
  final loginUseCase = getIt<LoginUseCase>();
  final loginRequest =
      LoginRequest(email: "mina@gmail.com", password: "123456");

  final result = await loginUseCase.execute(loginRequest);
  result.fold((failure) {
    print("Login Failed: ${failure.message}");
  }, (loginModel) {
    print("Login Success: ${loginModel.name}");
  });
}

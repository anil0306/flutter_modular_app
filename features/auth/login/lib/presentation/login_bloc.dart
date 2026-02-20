import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // LoginBloc(super.initialState);

  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<UsernameChanged>((event, emit) {
      // Handle username change if needed
      final usernameError = validateUsername(event.username);
      emit(LoginInvalid(
          usernameError: usernameError,
          passwordError: (state is LoginInvalid) ? state.passwordError : null));
    });

    on<PasswordChanged>((event, emit) {
      // Handle password change if needed
      final passwordError = validateUsername(event.password);
      emit(LoginInvalid(
          passwordError: passwordError,
          usernameError: (state is LoginInvalid) ? state.usernameError : null));
    });

    on<LoginButtonPressed>((event, emit) async {
      // do the logic here
      final usernameError = validateUsername(event.username);
      final passwordError = validateUsername(event.password);
      if (usernameError == null && passwordError == null) {
        // its safe to call login API
        emit(LoginLoading());
        final loginRequest = LoginRequest("mina@gmail.com", "123456");
        final result = await loginUseCase.execute(loginRequest);
        result.fold((failure) {
          // emit error
          emit(LoginError(errorMessage: failure.message));
        }, (loginModel) {
          // emit success
          print("Login Success: ${loginModel.name}");
          emit(LoginSuccess());
        });
      } else {
        // show invalid state
        emit(LoginInvalid(
            passwordError: passwordError, usernameError: usernameError));
      }
    });
  }
}

String? validateUsername(String username) {
  if (username.isEmpty) {
    return "Username cannot be empty";
  } else if (username.length < 3) {
    return "Username must be at least 3 chars";
  }

  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return "password cannot be empty";
  } else if (password.length < 6) {
    return "password must be at least 6 chars";
  }

  return null;
}

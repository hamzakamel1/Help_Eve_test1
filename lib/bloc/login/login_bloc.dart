import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:hatilaqi/utils/validation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(Initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      if (!isValidPassword(event.phone) || !isValidPassword(event.password)) {
        yield LoginStateFailure(code: 40, message: "data error");
      } else {
        yield* _mapLoginWithCredentialsPressedToState(
          phone: event.phone,
          password: event.password,
        );
      }
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String phone,
    String password,
  }) async* {
    yield LoginStateLoading();
  }
}

part of 'login_bloc.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}
class Initial extends LoginState {}

class LoginStateFailure extends LoginState {
  final int code;
  final String message;

  LoginStateFailure({this.code, this.message});

  @override
  List<Object> get props => null;
}
class LoginStateSuccess extends LoginState {
  LoginStateSuccess();

  @override
  List<Object> get props => null;
}
class LoginStateLoading extends LoginState {
  LoginStateLoading();

  @override
  List<Object> get props => null;
}




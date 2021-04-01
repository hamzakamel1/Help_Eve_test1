part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => null;
}
class Initial extends SignUpState {}

class SignUpFailure extends SignUpState {
  final int code;
  final String message;

  SignUpFailure({this.code, this.message});
  List<Object> get props => null;

}


class SignUpSuccess extends SignUpState {
  SignUpSuccess();
}



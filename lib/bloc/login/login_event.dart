part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => null;
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged({@required this.email});
  @override
  List<Object> get props => null;
  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => null;

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  const Submitted({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}
class LoginWithGooglePressed extends LoginEvent {}

class LoginWithCredentialsPressed extends LoginEvent {
  final String phone;
  final String password;
  final int branchId;
  const LoginWithCredentialsPressed({
    @required this.phone,
    @required this.password,
     this.branchId,
  });

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $phone, password: $password }';
  }
}

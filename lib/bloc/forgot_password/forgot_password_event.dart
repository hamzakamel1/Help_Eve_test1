part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendCodeToPhone extends ForgotPasswordEvent {
  final String phone;
  SendCodeToPhone({this.phone});
}

class ValidateCode extends ForgotPasswordEvent {
  final String code;
  ValidateCode({this.code});
}
class ForgotChangePassword extends ForgotPasswordEvent {
  final String password;
  ForgotChangePassword({this.password});
}

part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpUser extends SignUpEvent {

  final User user;

  SignUpUser({this.user});

}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {
  AppStarted();

  @override
  String toString() => 'AppStarted';

  @override
  
  List<Object> get props => [];
}

class UnauthenticatedEvent extends AuthenticationEvent {
  UnauthenticatedEvent();

  @override
 
  List<Object> get props => [];
}
class LoggedIn extends AuthenticationEvent {
  LoggedIn() : super();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoggedOut extends AuthenticationEvent {
  LoggedOut();

  @override
  List<Object> get props => [];

}

class GetVersionApp extends AuthenticationEvent {
  @override
  List<Object> get props => [];

}
class SendTokenFirebase extends AuthenticationEvent {
  final String token ;

  SendTokenFirebase({this.token});

  @override
  List<Object> get props => [];

}

class UpdateLanguage extends AuthenticationEvent {
  final String language;

  UpdateLanguage({this.language});

  @override
  List<Object> get props => [];
}

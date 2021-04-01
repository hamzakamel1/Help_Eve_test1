import 'package:hatilaqi/modle/users.dart';

abstract class AuthenticationState  {
  AuthenticationState([List props = const []]) : super();
}


class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}
class FirstOpenApp extends AuthenticationState {
  @override
  String toString() => 'FirstOpenApp';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

class Authenticated extends AuthenticationState {
  final User userInfo;

  Authenticated({this.userInfo}) : super([userInfo.id,userInfo.token]);

//  // TODO: implement props
  List<Object> get props => [userInfo.id,userInfo.token];
}

class Unauthenticated extends AuthenticationState {
  Unauthenticated();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}


class MostUpdateApp extends AuthenticationState {
    MostUpdateApp();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

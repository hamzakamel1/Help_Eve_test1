import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hatilaqi/modle/users.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isOpen = prefs.getBool('firstOpen') ?? false;
      if (!isOpen) {
        await prefs.setBool('firstOpen', true);
        yield FirstOpenApp();
      } else if (event is GetVersionApp && state is Authenticated) {}
    }
  }
}

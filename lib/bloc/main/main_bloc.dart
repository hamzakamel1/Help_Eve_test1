import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hatilaqi/bloc/main/main_event.dart';
import 'package:hatilaqi/bloc/main/main_state.dart';
import 'package:hatilaqi/modle/users.dart';
import 'package:hatilaqi/utils/custom_exception.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(Initial());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    try {
      if (event is LoadMain) {
        yield MainLoading();
        // var data = await Repository.instance.registration(event.user);
        //
        // final User user = User.fromJson(data);
        //
        // if (user != null) {
        //   await Repository.instance.loginOfLine(user: user);
        //   yield SignUpSuccess();
        // } else {
        //   yield SignUpFailure(code: 40);
        // }
        print("done");
        yield LoadMainSuccess();
      }
    } on MyException catch (e) {
      yield LoadMainFailure(code: e.error, message: e.message);
    } catch (e) {
      yield LoadMainFailure(code: -111, message: e.toString());
    }
  }
}

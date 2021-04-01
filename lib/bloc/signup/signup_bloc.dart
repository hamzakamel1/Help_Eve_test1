import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hatilaqi/modle/users.dart';
import 'package:hatilaqi/utils/custom_exception.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(Initial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    try {
      if (event is SignUpUser) {
        yield Initial();
      }
    } on MyException catch (e) {
      yield SignUpFailure(code: e.error, message: e.message);
    } catch (e) {
      yield SignUpFailure(code: -111, message: e.toString());
    }
  }
}

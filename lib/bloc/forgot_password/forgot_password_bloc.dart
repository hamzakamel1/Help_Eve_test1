import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:hatilaqi/utils/custom_exception.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    this.token,
    this.lang,
  }) : super(Initial());
  final String token;
  final String lang;

//  @override
//  Stream<Transition<TripsEvent, TripsState>> transformEvents(
//    Stream<TripsEvent> events,
//    TransitionFunction<TripsEvent, TripsState> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 500)),
//      transitionFn,
//    );
//  }

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    try {
      if (event is SendCodeToPhone) {
        yield Initial();
      }
      if (event is ValidateCode) {}
      if (event is ForgotChangePassword) {
        var phone = (state as ValidateCodeSuccess).phone;
        var code = (state as ValidateCodeSuccess).code;

        yield ChangePasswordSuccess();
      }
    } on MyException catch (e) {
      yield state.copyWith(error: e.message);
    } catch (e) {
      yield state.copyWith(error: e.message);
    }
  }
}

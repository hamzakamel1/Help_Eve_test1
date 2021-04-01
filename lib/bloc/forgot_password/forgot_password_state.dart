part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];

  ForgotPasswordState copyWith({String error});

}



class Initial extends ForgotPasswordState {
  final String error;
  const Initial({this.error});

  @override
  Initial copyWith({String error}) {
    return Initial(
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [error];

}

// class ProfileFailure extends ForgotPasswordState {
//   final int code;
//   final String message;
//   final String error;
//
//   ProfileFailure({this.error,this.code, this.message});
//
//
//   Initial copyWith({String error}) {
//     return Initial(
//       error: error ?? this.error,
//       code: code ?? this.code,
//       message: message ?? this.message,
//     );
//   }
// }

class SendCodeSuccess extends ForgotPasswordState {
  final String phone;
  final String error;
  const SendCodeSuccess({this.error, this.phone});



  @override
  SendCodeSuccess copyWith({String error}) {
    return SendCodeSuccess(
      error: error ?? this.error,
      phone: this.phone,
    );
  }



  @override
  List<Object> get props => [error,phone];
}
class ValidateCodeSuccess extends ForgotPasswordState {
  final String code;
  final String phone;
  final String error;
  const ValidateCodeSuccess({this.error, this.code, this.phone});




  ValidateCodeSuccess copyWith({String error}) {
    return ValidateCodeSuccess(
      error: error ?? this.error,
      phone: this.phone,
      code: this.code,
    );
  }



  @override
  List<Object> get props => [error,code,phone];
}


class ChangePasswordSuccess extends ForgotPasswordState {
  @override
  ForgotPasswordState copyWith({String error}) {
    // TODO: implement copyWith
    throw ChangePasswordSuccess();
  }
}


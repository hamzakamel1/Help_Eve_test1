import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => null;
}
class Initial extends MainState {}

class LoadMainFailure extends MainState {
  final int code;
  final String message;

  LoadMainFailure({this.code, this.message});
}


class LoadMainSuccess extends MainState {
  LoadMainSuccess();
}

class ItemClicked extends MainState {
  ItemClicked();
}

class MainLoading extends MainState {
  MainLoading();
}



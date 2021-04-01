import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMain extends MainEvent {

}

class OnClickOnItem extends MainEvent {

}

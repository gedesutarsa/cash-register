
import 'package:equatable/equatable.dart';

sealed class PersonEditorEvent extends Equatable{
  const PersonEditorEvent();
  @override
  List<Object?> get props => [];
}



final class PersonEditorNameChange extends  PersonEditorEvent {
  // update value for name
  final String name;
  const PersonEditorNameChange({ required this.name}) ;
  @override
  List<Object?> get props => [name];
}

// event for case remark was change
final class PersonEditorRemarkChange extends PersonEditorEvent {
  // update for remark
  final String remark;

  const PersonEditorRemarkChange({ required this.remark});
  @override
  List<Object?> get props => [remark];
}

final class PersonEditorSaveRequested extends PersonEditorEvent {
  const PersonEditorSaveRequested();
  @override
  List<Object?> get props => [];
}

final class PersonEditorSaveCompleted extends PersonEditorEvent {
  const PersonEditorSaveCompleted();
  @override
  List<Object?> get props => [];
}
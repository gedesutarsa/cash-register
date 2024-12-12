
import 'dart:ffi';

import 'package:cashregister/person_editor/bloc/person_editor_state.dart';
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


typedef UpdateStringValueStateMethod = PersonEditorState Function( String? value,  PersonEditorState currentState );
typedef UpdateStateValueMethod<V> = PersonEditorState Function( V value,  PersonEditorState currentState );

final class PersonFieldValueChange<V> extends PersonEditorEvent {
  final V value;
  final UpdateStateValueMethod<V> updateValue;
  const PersonFieldValueChange(this.value,   this.updateValue);

}

typedef UpdateStateValueNoParamMethod = PersonEditorState Function( PersonEditorState );

final class PersonValueChangeEvent extends PersonEditorEvent{
  final UpdateStateValueNoParamMethod updater;
  final bool programmaticChange  ;
  const PersonValueChangeEvent(this.updater, {this.programmaticChange =  false });

}
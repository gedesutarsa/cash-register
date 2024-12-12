import 'package:cashregister/base_editor_bloc.dart';
import 'package:cashregister/base_editor_state.dart';
import 'package:cashregister/person_editor/bloc/person_editor_event.dart';
import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'person_editor_state.g.dart';

@CopyWith()
final class PersonEditorState extends BaseEditorState implements {


  // name of person
  final String name;
  // remark of person
  final String? remark;
  final String markerKey ;

  const PersonEditorState(
      {required this.name, this.remark , super.status = EditorSaveStatus.none ,  this.markerKey = "person_state"} );


  // clone data
  /*
  PersonEditorState copyWith(
      {String? name, String? remark, EditorSaveStatus? status , String? markerKey}) {
    return PersonEditorState(
        name: name ?? this.name,
        remark: remark ?? this.remark,
        status: status ?? this.status,
      markerKey: markerKey ?? this.markerKey
    );
  }*/

  @override
  List<Object?> get props => [name, remark, status];


  static UpdateStateValueMethod<String> updateStateRemark = ( String remark,PersonEditorState currentState ) {
    return currentState.copyWith(remark: remark);
  };

  static PersonEditorState updateRemark( String remark,PersonEditorState currentState ) {
    return currentState.copyWith(remark: remark);
  }




}

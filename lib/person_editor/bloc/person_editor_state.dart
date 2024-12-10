import 'package:equatable/equatable.dart';


// saving editor status
enum EditorSaveStatus {
  none,
  saving,
  saved,
  error
}


final class PersonEditorState extends Equatable {
  final EditorSaveStatus status ;
  // name of person
  final String name;
  // remark of person
  final String? remark ;

  const PersonEditorState({ required this.name , this.remark, this.status = EditorSaveStatus.none});

  // clone data
  PersonEditorState copyWith( { String? name, String? remark,EditorSaveStatus? status }) {
    return PersonEditorState(
        name: name ?? this.name ,
        remark: remark ?? this.remark,
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [name , remark , status];
}
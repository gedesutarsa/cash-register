import 'package:bloc/bloc.dart';
import 'package:cashregister/dao/person_dao.dart';
import 'package:cashregister/entity/person.dart';
import 'package:cashregister/person_editor/bloc/person_editor_event.dart';
import 'package:cashregister/person_editor/bloc/person_editor_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
final log = Logger("PersonEditorBloc");
class PersonEditorBloc extends Bloc<PersonEditorEvent , PersonEditorState> {
  // access to person dao
  final PersonDao personDao;
  PersonEditorBloc(this.personDao): super( PersonEditorState(name:  '' , remark: '')) {
    on<PersonEditorNameChange>(_nameChange );
    on<PersonEditorRemarkChange>(_remarkChange);
    on<PersonEditorSaveRequested>(_savePerson);

  }

  void _nameChange ( PersonEditorNameChange event , Emitter<PersonEditorState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _remarkChange( PersonEditorRemarkChange event, Emitter<PersonEditorState> emit) {
    emit( state.copyWith(remark: event.remark));
  }

  Future<void>  _savePerson( PersonEditorSaveRequested event , Emitter<PersonEditorState> emit) async {
    //state.
    emit(state.copyWith(status: EditorSaveStatus.saving));
    final lastPerson = await personDao.findLastPerson();
    final id = (lastPerson?.id ?? 0) + 1;
    final theState = state ;
    final newPerson = Person(id: id, name: theState.name , remark: theState.remark);
    await personDao.insertPerson(newPerson);


    //emit(state.c)
    log.info("save person data: ${state.name}, id: ${id}" );

    emit(state.copyWith(status: EditorSaveStatus.saved));


  }






  void invokeSave() {
    add(PersonEditorSaveRequested());
  }



}
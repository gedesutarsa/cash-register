import 'package:bloc/bloc.dart';
import 'package:cashregister/base_editor_state.dart';
import 'package:cashregister/dao/person_dao.dart';
import 'package:cashregister/entity/person.dart';
import 'package:cashregister/person_editor/bloc/person_editor_event.dart';
import 'package:cashregister/person_editor/bloc/person_editor_state.dart';
import 'package:logging/logging.dart';
import 'dart:math';
final log = Logger("PersonEditorBloc");


String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
}

class PersonEditorBloc extends Bloc<PersonEditorEvent, PersonEditorState> {
  // access to person dao
  final PersonDao personDao;
  PersonEditorBloc(this.personDao)
      : super(PersonEditorState(name: '', remark: '')) {
    on<PersonEditorNameChange>(_nameChange);
    on<PersonEditorRemarkChange>(_remarkChange);
    on<PersonEditorSaveRequested>(_savePerson);
    on<PersonFieldValueChange>(_valueStringChange);
    on<PersonValueChangeEvent>(_genericValueChange);
  }

  void _nameChange(
      PersonEditorNameChange event, Emitter<PersonEditorState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _remarkChange(
      PersonEditorRemarkChange event, Emitter<PersonEditorState> emit) {
    emit(state.copyWith(remark: event.remark));
  }

  Future<void> _savePerson(
      PersonEditorSaveRequested event, Emitter<PersonEditorState> emit) async {
    //state.
    emit(state.copyWith(status: EditorSaveStatus.saving));
    final lastPerson = await personDao.findLastPerson();
    final id = (lastPerson?.id ?? 0) + 1;
    final theState = state;
    final newPerson =
        Person(id: id, name: theState.name, remark: theState.remark);
    await personDao.insertPerson(newPerson);

    //emit(state.c)
    log.info("save person data: ${state.name}, id: ${id}");

    emit(state.copyWith(status: EditorSaveStatus.saved));
  }
  void _genericValueChange( PersonValueChangeEvent event, Emitter<PersonEditorState> emit) {
    final updatedValue = event.updater(state);
    if ( event.programmaticChange) {
      final String randomString = generateRandomString(5);
      emit(updatedValue.copyWith(markerKey: updatedValue.markerKey + randomString ));
    } else {
      emit(updatedValue);
    }

  }
  void _valueStringChange( PersonFieldValueChange event, Emitter<PersonEditorState> emit) {
    final updatedValue = event.updateValue(event.value , state);
    emit( updatedValue);
  }


  void invokeSave() {
    add(PersonEditorSaveRequested());
  }


  void updateStateValue<V>(V value , UpdateStateValueMethod<V> updater) {
    add(PersonFieldValueChange<V>(value, updater));
  }
  void updateValueString( String value, UpdateStateValueMethod<String> updater) {
    add(PersonFieldValueChange<String>(value, updater));
  }

  void updateValue( UpdateStateValueNoParamMethod updater) {
    add(PersonValueChangeEvent(updater));
  }


  void updateValueProgrammatically( UpdateStateValueNoParamMethod updater) {
    add(PersonValueChangeEvent(updater , programmaticChange: true));
  }
}

import 'package:cashregister/base_editor_state.dart';
import 'package:cashregister/database.dart';
import 'package:cashregister/person_editor/bloc/person_editor_bloc.dart';
import 'package:cashregister/person_editor/bloc/person_editor_event.dart';
import 'package:cashregister/person_editor/bloc/person_editor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

final log = Logger("PersonEditorPage");

class PersonEditorPage extends StatelessWidget {
  const PersonEditorPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) =>
            PersonEditorBloc(context.read<AppDatabase>().personDao),
        child: const PersonEditorPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonEditorBloc, PersonEditorState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == EditorSaveStatus.saved,
      listener: (context, state) => Navigator.of(context).pop(),
      child: const PersonEditorView(),
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PersonEditorBloc>();
    final state = bloc.state;
    return TextFormField(
      onChanged: (value) => context
          .read<PersonEditorBloc>()
          .add(PersonEditorNameChange(name: value)),
      //onChanged: ( value )=> bloc.updateValue( (currentState)  => currentState.copyWith(name: value)),
      initialValue: state.name,
      decoration: InputDecoration(labelText: "Name"),
      key: const Key("txt_name"),
    );
  }
}

class _RemarkTextField extends StatelessWidget {

  const _RemarkTextField( {super.key }) ;

  @override
  Widget build(BuildContext context) {

    final bloc = context.watch<PersonEditorBloc>();
    final state = context.watch<PersonEditorBloc>().state;
    log.info("remark value is : ${state.remark}");
    return TextFormField(

      onChanged: (value) => bloc
          .updateValue((currentState) => currentState.copyWith(remark: value)),
      //context.read<PersonEditorBloc>().add(PersonEditorRemarkChange(remark: value)),
      initialValue: state.remark,
      key: key,
      decoration: InputDecoration(labelText: "Remark"),
    );

  }
}

class _RemarkViewer extends StatelessWidget {
  const _RemarkViewer();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PersonEditorBloc>();
    return Text(bloc.state.remark ?? "");
  }
}

class PersonEditorView extends StatelessWidget {
  const PersonEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PersonEditorBloc>();
    final state = bloc.state.remark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test add person"),
      ),
      body: Column(
        children: [
          const _NameTextField(  ),
          _RemarkTextField(key: Key("${bloc.state.markerKey}_text_remark"),),
          const _RemarkViewer(),
          TextFormField(
            key: Key("txt_remark_2"),
            onChanged: (value) => context.read<PersonEditorBloc>().updateValue(
                (currentState) => currentState.copyWith.remark(  value)),

            initialValue: state,
            //context.read<PersonEditorBloc>().state.remark,
            decoration: InputDecoration(labelText: "Remark 2"),

          ),
          TextFormField(
            key: Key("txt_name_2"),
            onChanged: (value) => context.read<PersonEditorBloc>().updateValue(
                (currentState) => currentState.copyWith(remark: value)),

            initialValue: bloc.state.name,
            //context.read<PersonEditorBloc>().state.remark,
            decoration: InputDecoration(labelText: "Name 2"),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<PersonEditorBloc>().updateValueProgrammatically((currentState) =>
                    currentState.copyWith(
                        remark: ( "${currentState.remark ?? ''}-edited")));
              },
              child: Text("Update remark")),
          ElevatedButton(
            child: Text("show value"),
            onPressed: () {
              final currentState = context.read<PersonEditorBloc>().state;
              log.info("Current remark: ${currentState.remark}");
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: context.read<PersonEditorBloc>().invokeSave),
    );
  }
}

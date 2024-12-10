

import 'package:cashregister/database.dart';
import 'package:cashregister/person_editor/bloc/person_editor_bloc.dart';
import 'package:cashregister/person_editor/bloc/person_editor_event.dart';
import 'package:cashregister/person_editor/bloc/person_editor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonEditorPage extends StatelessWidget {
  const PersonEditorPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => PersonEditorBloc(context.read<AppDatabase>().personDao),
        child: const PersonEditorPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonEditorBloc, PersonEditorState>(
      listenWhen:(previous, current) => previous.status  != current.status && current.status ==  EditorSaveStatus.saved,
      listener: (context , state ) => Navigator.of(context).pop(),
      child: const PersonEditorView(),
    );

  }

  
}


class _NameTextField extends StatelessWidget {
  const _NameTextField({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PersonEditorBloc>().state;
    return TextFormField(
      onChanged: ( value )=> context.read<PersonEditorBloc>().add(PersonEditorNameChange(name: value)),
      initialValue: state.name,
      decoration: InputDecoration(
        labelText: "Name"
      ),
    );
  }
}

class _RemarkTextField extends StatelessWidget {
  const _RemarkTextField({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PersonEditorBloc>().state;
    return TextFormField(
      onChanged: ( value )=> context.read<PersonEditorBloc>().add(PersonEditorRemarkChange(remark: value)),
      initialValue: state.remark,
      decoration: InputDecoration(
          labelText: "Remark"
      ),
    );
  }
}


class PersonEditorView extends StatelessWidget {
  const PersonEditorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test add person"),),
      body: Column(
        children: [
          const _NameTextField(key: Key("txt_person_name"),),
          const _RemarkTextField(key: Key("txt_person_remark"),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: context.read<PersonEditorBloc>().invokeSave
      ),

    );
  }
}
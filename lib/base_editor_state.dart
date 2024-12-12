// saving editor status
import 'package:equatable/equatable.dart';

enum EditorSaveStatus { none, saving, saved, error }



// base class for editor bloc state data
abstract class BaseEditorState extends Equatable {
  final EditorSaveStatus status;

  const BaseEditorState({  required this.status  });
}

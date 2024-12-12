// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_editor_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonEditorStateCWProxy {
  PersonEditorState name(String name);

  PersonEditorState remark(String? remark);

  PersonEditorState status(EditorSaveStatus status);

  PersonEditorState markerKey(String markerKey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonEditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonEditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonEditorState call({
    String name,
    String? remark,
    EditorSaveStatus status,
    String markerKey,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonEditorState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonEditorState.copyWith.fieldName(...)`
class _$PersonEditorStateCWProxyImpl implements _$PersonEditorStateCWProxy {
  const _$PersonEditorStateCWProxyImpl(this._value);

  final PersonEditorState _value;

  @override
  PersonEditorState name(String name) => this(name: name);

  @override
  PersonEditorState remark(String? remark) => this(remark: remark);

  @override
  PersonEditorState status(EditorSaveStatus status) => this(status: status);

  @override
  PersonEditorState markerKey(String markerKey) => this(markerKey: markerKey);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonEditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonEditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonEditorState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? remark = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? markerKey = const $CopyWithPlaceholder(),
  }) {
    return PersonEditorState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      remark: remark == const $CopyWithPlaceholder()
          ? _value.remark
          // ignore: cast_nullable_to_non_nullable
          : remark as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as EditorSaveStatus,
      markerKey: markerKey == const $CopyWithPlaceholder()
          ? _value.markerKey
          // ignore: cast_nullable_to_non_nullable
          : markerKey as String,
    );
  }
}

extension $PersonEditorStateCopyWith on PersonEditorState {
  /// Returns a callable class that can be used as follows: `instanceOfPersonEditorState.copyWith(...)` or like so:`instanceOfPersonEditorState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonEditorStateCWProxy get copyWith =>
      _$PersonEditorStateCWProxyImpl(this);
}

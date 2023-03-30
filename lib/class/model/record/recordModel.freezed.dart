// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recordModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return _RecordModel.fromJson(json);
}

/// @nodoc
mixin _$RecordModel {
  Map<String, int> get result => throw _privateConstructorUsedError;
  bool get isWOD => throw _privateConstructorUsedError;
  List<Workout> get workouts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordModelCopyWith<RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordModelCopyWith<$Res> {
  factory $RecordModelCopyWith(
          RecordModel value, $Res Function(RecordModel) then) =
      _$RecordModelCopyWithImpl<$Res, RecordModel>;
  @useResult
  $Res call({Map<String, int> result, bool isWOD, List<Workout> workouts});
}

/// @nodoc
class _$RecordModelCopyWithImpl<$Res, $Val extends RecordModel>
    implements $RecordModelCopyWith<$Res> {
  _$RecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? isWOD = null,
    Object? workouts = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isWOD: null == isWOD
          ? _value.isWOD
          : isWOD // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecordModelCopyWith<$Res>
    implements $RecordModelCopyWith<$Res> {
  factory _$$_RecordModelCopyWith(
          _$_RecordModel value, $Res Function(_$_RecordModel) then) =
      __$$_RecordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, int> result, bool isWOD, List<Workout> workouts});
}

/// @nodoc
class __$$_RecordModelCopyWithImpl<$Res>
    extends _$RecordModelCopyWithImpl<$Res, _$_RecordModel>
    implements _$$_RecordModelCopyWith<$Res> {
  __$$_RecordModelCopyWithImpl(
      _$_RecordModel _value, $Res Function(_$_RecordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? isWOD = null,
    Object? workouts = null,
  }) {
    return _then(_$_RecordModel(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isWOD: null == isWOD
          ? _value.isWOD
          : isWOD // ignore: cast_nullable_to_non_nullable
              as bool,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordModel implements _RecordModel {
  const _$_RecordModel(
      {required final Map<String, int> result,
      required this.isWOD,
      required final List<Workout> workouts})
      : _result = result,
        _workouts = workouts;

  factory _$_RecordModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecordModelFromJson(json);

  final Map<String, int> _result;
  @override
  Map<String, int> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_result);
  }

  @override
  final bool isWOD;
  final List<Workout> _workouts;
  @override
  List<Workout> get workouts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'RecordModel(result: $result, isWOD: $isWOD, workouts: $workouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordModel &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.isWOD, isWOD) || other.isWOD == isWOD) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_result),
      isWOD,
      const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordModelCopyWith<_$_RecordModel> get copyWith =>
      __$$_RecordModelCopyWithImpl<_$_RecordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordModelToJson(
      this,
    );
  }
}

abstract class _RecordModel implements RecordModel {
  const factory _RecordModel(
      {required final Map<String, int> result,
      required final bool isWOD,
      required final List<Workout> workouts}) = _$_RecordModel;

  factory _RecordModel.fromJson(Map<String, dynamic> json) =
      _$_RecordModel.fromJson;

  @override
  Map<String, int> get result;
  @override
  bool get isWOD;
  @override
  List<Workout> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$_RecordModelCopyWith<_$_RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

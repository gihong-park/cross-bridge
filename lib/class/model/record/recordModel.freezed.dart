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
  WorkoutOftheDay? get wod => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<Movement> get movements => throw _privateConstructorUsedError;

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
  $Res call(
      {WorkoutOftheDay? wod,
      String note,
      DateTime date,
      List<Movement> movements});

  $WorkoutOftheDayCopyWith<$Res>? get wod;
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
    Object? wod = freezed,
    Object? note = null,
    Object? date = null,
    Object? movements = null,
  }) {
    return _then(_value.copyWith(
      wod: freezed == wod
          ? _value.wod
          : wod // ignore: cast_nullable_to_non_nullable
              as WorkoutOftheDay?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      movements: null == movements
          ? _value.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<Movement>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutOftheDayCopyWith<$Res>? get wod {
    if (_value.wod == null) {
      return null;
    }

    return $WorkoutOftheDayCopyWith<$Res>(_value.wod!, (value) {
      return _then(_value.copyWith(wod: value) as $Val);
    });
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
  $Res call(
      {WorkoutOftheDay? wod,
      String note,
      DateTime date,
      List<Movement> movements});

  @override
  $WorkoutOftheDayCopyWith<$Res>? get wod;
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
    Object? wod = freezed,
    Object? note = null,
    Object? date = null,
    Object? movements = null,
  }) {
    return _then(_$_RecordModel(
      wod: freezed == wod
          ? _value.wod
          : wod // ignore: cast_nullable_to_non_nullable
              as WorkoutOftheDay?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      movements: null == movements
          ? _value._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<Movement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordModel implements _RecordModel {
  const _$_RecordModel(
      {required this.wod,
      required this.note,
      required this.date,
      required final List<Movement> movements})
      : _movements = movements;

  factory _$_RecordModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecordModelFromJson(json);

  @override
  final WorkoutOftheDay? wod;
  @override
  final String note;
  @override
  final DateTime date;
  final List<Movement> _movements;
  @override
  List<Movement> get movements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  @override
  String toString() {
    return 'RecordModel(wod: $wod, note: $note, date: $date, movements: $movements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordModel &&
            (identical(other.wod, wod) || other.wod == wod) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wod, note, date,
      const DeepCollectionEquality().hash(_movements));

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
      {required final WorkoutOftheDay? wod,
      required final String note,
      required final DateTime date,
      required final List<Movement> movements}) = _$_RecordModel;

  factory _RecordModel.fromJson(Map<String, dynamic> json) =
      _$_RecordModel.fromJson;

  @override
  WorkoutOftheDay? get wod;
  @override
  String get note;
  @override
  DateTime get date;
  @override
  List<Movement> get movements;
  @override
  @JsonKey(ignore: true)
  _$$_RecordModelCopyWith<_$_RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

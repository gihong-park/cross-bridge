// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workoutOftheDay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutOftheDay _$WorkoutOftheDayFromJson(Map<String, dynamic> json) {
  return _WorkoutOftheDay.fromJson(json);
}

/// @nodoc
mixin _$WorkoutOftheDay {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Movement> get movements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutOftheDayCopyWith<WorkoutOftheDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutOftheDayCopyWith<$Res> {
  factory $WorkoutOftheDayCopyWith(
          WorkoutOftheDay value, $Res Function(WorkoutOftheDay) then) =
      _$WorkoutOftheDayCopyWithImpl<$Res, WorkoutOftheDay>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String description,
      List<Movement> movements});
}

/// @nodoc
class _$WorkoutOftheDayCopyWithImpl<$Res, $Val extends WorkoutOftheDay>
    implements $WorkoutOftheDayCopyWith<$Res> {
  _$WorkoutOftheDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? movements = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      movements: null == movements
          ? _value.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<Movement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutOftheDayCopyWith<$Res>
    implements $WorkoutOftheDayCopyWith<$Res> {
  factory _$$_WorkoutOftheDayCopyWith(
          _$_WorkoutOftheDay value, $Res Function(_$_WorkoutOftheDay) then) =
      __$$_WorkoutOftheDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String description,
      List<Movement> movements});
}

/// @nodoc
class __$$_WorkoutOftheDayCopyWithImpl<$Res>
    extends _$WorkoutOftheDayCopyWithImpl<$Res, _$_WorkoutOftheDay>
    implements _$$_WorkoutOftheDayCopyWith<$Res> {
  __$$_WorkoutOftheDayCopyWithImpl(
      _$_WorkoutOftheDay _value, $Res Function(_$_WorkoutOftheDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? movements = null,
  }) {
    return _then(_$_WorkoutOftheDay(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      movements: null == movements
          ? _value._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<Movement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutOftheDay implements _WorkoutOftheDay {
  const _$_WorkoutOftheDay(
      {required this.id,
      required this.name,
      required this.type,
      required this.description,
      required final List<Movement> movements})
      : _movements = movements;

  factory _$_WorkoutOftheDay.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutOftheDayFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String description;
  final List<Movement> _movements;
  @override
  List<Movement> get movements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  @override
  String toString() {
    return 'WorkoutOftheDay(id: $id, name: $name, type: $type, description: $description, movements: $movements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutOftheDay &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, description,
      const DeepCollectionEquality().hash(_movements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutOftheDayCopyWith<_$_WorkoutOftheDay> get copyWith =>
      __$$_WorkoutOftheDayCopyWithImpl<_$_WorkoutOftheDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutOftheDayToJson(
      this,
    );
  }
}

abstract class _WorkoutOftheDay implements WorkoutOftheDay {
  const factory _WorkoutOftheDay(
      {required final String id,
      required final String name,
      required final String type,
      required final String description,
      required final List<Movement> movements}) = _$_WorkoutOftheDay;

  factory _WorkoutOftheDay.fromJson(Map<String, dynamic> json) =
      _$_WorkoutOftheDay.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get description;
  @override
  List<Movement> get movements;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutOftheDayCopyWith<_$_WorkoutOftheDay> get copyWith =>
      throw _privateConstructorUsedError;
}

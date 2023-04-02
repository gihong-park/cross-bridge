// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movement _$MovementFromJson(Map<String, dynamic> json) {
  return _Movement.fromJson(json);
}

/// @nodoc
mixin _$Movement {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int get cal => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovementCopyWith<Movement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementCopyWith<$Res> {
  factory $MovementCopyWith(Movement value, $Res Function(Movement) then) =
      _$MovementCopyWithImpl<$Res, Movement>;
  @useResult
  $Res call(
      {String id, String name, double weight, int cal, int distance, int reps});
}

/// @nodoc
class _$MovementCopyWithImpl<$Res, $Val extends Movement>
    implements $MovementCopyWith<$Res> {
  _$MovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? weight = null,
    Object? cal = null,
    Object? distance = null,
    Object? reps = null,
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
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      cal: null == cal
          ? _value.cal
          : cal // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovementCopyWith<$Res> implements $MovementCopyWith<$Res> {
  factory _$$_MovementCopyWith(
          _$_Movement value, $Res Function(_$_Movement) then) =
      __$$_MovementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, double weight, int cal, int distance, int reps});
}

/// @nodoc
class __$$_MovementCopyWithImpl<$Res>
    extends _$MovementCopyWithImpl<$Res, _$_Movement>
    implements _$$_MovementCopyWith<$Res> {
  __$$_MovementCopyWithImpl(
      _$_Movement _value, $Res Function(_$_Movement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? weight = null,
    Object? cal = null,
    Object? distance = null,
    Object? reps = null,
  }) {
    return _then(_$_Movement(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      cal: null == cal
          ? _value.cal
          : cal // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movement implements _Movement {
  const _$_Movement(
      {required this.id,
      required this.name,
      required this.weight,
      required this.cal,
      required this.distance,
      required this.reps});

  factory _$_Movement.fromJson(Map<String, dynamic> json) =>
      _$$_MovementFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double weight;
  @override
  final int cal;
  @override
  final int distance;
  @override
  final int reps;

  @override
  String toString() {
    return 'Movement(id: $id, name: $name, weight: $weight, cal: $cal, distance: $distance, reps: $reps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.cal, cal) || other.cal == cal) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.reps, reps) || other.reps == reps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, weight, cal, distance, reps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovementCopyWith<_$_Movement> get copyWith =>
      __$$_MovementCopyWithImpl<_$_Movement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovementToJson(
      this,
    );
  }
}

abstract class _Movement implements Movement {
  const factory _Movement(
      {required final String id,
      required final String name,
      required final double weight,
      required final int cal,
      required final int distance,
      required final int reps}) = _$_Movement;

  factory _Movement.fromJson(Map<String, dynamic> json) = _$_Movement.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get weight;
  @override
  int get cal;
  @override
  int get distance;
  @override
  int get reps;
  @override
  @JsonKey(ignore: true)
  _$$_MovementCopyWith<_$_Movement> get copyWith =>
      throw _privateConstructorUsedError;
}

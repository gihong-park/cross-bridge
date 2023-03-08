// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WODItem _$WODItemFromJson(Map<String, dynamic> json) {
  return _WODItem.fromJson(json);
}

/// @nodoc
mixin _$WODItem {
  String get id => throw _privateConstructorUsedError;
  Level get level => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int get cal => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WODItemCopyWith<WODItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WODItemCopyWith<$Res> {
  factory $WODItemCopyWith(WODItem value, $Res Function(WODItem) then) =
      _$WODItemCopyWithImpl<$Res, WODItem>;
  @useResult
  $Res call(
      {String id,
      Level level,
      String name,
      double weight,
      int cal,
      int distance,
      int reps});
}

/// @nodoc
class _$WODItemCopyWithImpl<$Res, $Val extends WODItem>
    implements $WODItemCopyWith<$Res> {
  _$WODItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
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
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
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
abstract class _$$_WODItemCopyWith<$Res> implements $WODItemCopyWith<$Res> {
  factory _$$_WODItemCopyWith(
          _$_WODItem value, $Res Function(_$_WODItem) then) =
      __$$_WODItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Level level,
      String name,
      double weight,
      int cal,
      int distance,
      int reps});
}

/// @nodoc
class __$$_WODItemCopyWithImpl<$Res>
    extends _$WODItemCopyWithImpl<$Res, _$_WODItem>
    implements _$$_WODItemCopyWith<$Res> {
  __$$_WODItemCopyWithImpl(_$_WODItem _value, $Res Function(_$_WODItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
    Object? name = null,
    Object? weight = null,
    Object? cal = null,
    Object? distance = null,
    Object? reps = null,
  }) {
    return _then(_$_WODItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
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
class _$_WODItem implements _WODItem {
  const _$_WODItem(
      {required this.id,
      required this.level,
      required this.name,
      required this.weight,
      required this.cal,
      required this.distance,
      required this.reps});

  factory _$_WODItem.fromJson(Map<String, dynamic> json) =>
      _$$_WODItemFromJson(json);

  @override
  final String id;
  @override
  final Level level;
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
    return 'WODItem(id: $id, level: $level, name: $name, weight: $weight, cal: $cal, distance: $distance, reps: $reps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WODItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
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
      Object.hash(runtimeType, id, level, name, weight, cal, distance, reps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WODItemCopyWith<_$_WODItem> get copyWith =>
      __$$_WODItemCopyWithImpl<_$_WODItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WODItemToJson(
      this,
    );
  }
}

abstract class _WODItem implements WODItem {
  const factory _WODItem(
      {required final String id,
      required final Level level,
      required final String name,
      required final double weight,
      required final int cal,
      required final int distance,
      required final int reps}) = _$_WODItem;

  factory _WODItem.fromJson(Map<String, dynamic> json) = _$_WODItem.fromJson;

  @override
  String get id;
  @override
  Level get level;
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
  _$$_WODItemCopyWith<_$_WODItem> get copyWith =>
      throw _privateConstructorUsedError;
}

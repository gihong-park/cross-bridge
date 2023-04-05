// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workoutOftheDay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutOftheDay _$$_WorkoutOftheDayFromJson(Map<String, dynamic> json) =>
    _$_WorkoutOftheDay(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      movements: (json['movements'] as List<dynamic>)
          .map((e) => Movement.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_WorkoutOftheDayToJson(_$_WorkoutOftheDay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'movements': instance.movements,
      'date': instance.date.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordModel _$$_RecordModelFromJson(Map<String, dynamic> json) =>
    _$_RecordModel(
      result: Map<String, int>.from(json['result'] as Map),
      isWOD: json['isWOD'] as bool,
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => Workout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordModelToJson(_$_RecordModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'isWOD': instance.isWOD,
      'workouts': instance.workouts,
    };

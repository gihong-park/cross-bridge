// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordModel _$$_RecordModelFromJson(Map<String, dynamic> json) =>
    _$_RecordModel(
      wod: json['wod'] == null
          ? null
          : WorkoutOftheDay.fromJson(json['wod'] as Map<String, dynamic>),
      note: json['note'] as String,
      date: DateTime.parse(json['date'] as String),
      movements: (json['movements'] as List<dynamic>)
          .map((e) => Movement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordModelToJson(_$_RecordModel instance) =>
    <String, dynamic>{
      'wod': instance.wod,
      'note': instance.note,
      'date': instance.date.toIso8601String(),
      'movements': instance.movements,
    };

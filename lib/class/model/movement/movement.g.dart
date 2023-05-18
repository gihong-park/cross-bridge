// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movement _$$_MovementFromJson(Map<String, dynamic> json) => _$_Movement(
      id: json['id'] as String,
      name: json['name'] as String,
      weight: (json['weight'] as num).toDouble(),
      cal: json['cal'] as int,
      distance: json['distance'] as int,
      height: (json['height'] as num).toDouble(),
      reps: json['reps'] as int,
    );

Map<String, dynamic> _$$_MovementToJson(_$_Movement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'cal': instance.cal,
      'distance': instance.distance,
      'height': instance.height,
      'reps': instance.reps,
    };

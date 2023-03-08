// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WODItem _$$_WODItemFromJson(Map<String, dynamic> json) => _$_WODItem(
      id: json['id'] as String,
      level: $enumDecode(_$LevelEnumMap, json['level']),
      name: json['name'] as String,
      weight: (json['weight'] as num).toDouble(),
      cal: json['cal'] as int,
      distance: json['distance'] as int,
      reps: json['reps'] as int,
    );

Map<String, dynamic> _$$_WODItemToJson(_$_WODItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': _$LevelEnumMap[instance.level]!,
      'name': instance.name,
      'weight': instance.weight,
      'cal': instance.cal,
      'distance': instance.distance,
      'reps': instance.reps,
    };

const _$LevelEnumMap = {
  Level.lv1: 'lv1',
  Level.lv2: 'lv2',
  Level.lv3: 'lv3',
};

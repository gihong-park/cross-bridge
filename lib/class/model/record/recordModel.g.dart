// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordModel _$$_RecordModelFromJson(Map<String, dynamic> json) =>
    _$_RecordModel(
      result: Map<String, int>.from(json['result'] as Map),
      wodItems: (json['wodItems'] as List<dynamic>)
          .map((e) => WODItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordModelToJson(_$_RecordModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'wodItems': instance.wodItems,
    };

import 'package:_04_health_check/class/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wod.freezed.dart';
part 'wod.g.dart';

@freezed
class WODItem with _$WODItem {
  const factory WODItem(
      {required String id,
      required Level level,
      required String name,
      required double weight,
      required int cal,
      required int distance,
      required int reps}) = _WODItem;

  factory WODItem.fromJson(Map<String, Object?> json) =>
      _$WODItemFromJson(json);
}

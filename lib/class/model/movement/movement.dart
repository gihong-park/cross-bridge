import 'package:_04_health_check/class/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement.freezed.dart';
part 'movement.g.dart';

@freezed
class Movement with _$Movement {
  const factory Movement(
      {required String id,
      required String name,
      required double weight,
      required int cal,
      required int distance,
      required double height,
      required int reps}) = _Movement;

  factory Movement.fromJson(Map<String, Object?> json) =>
      _$MovementFromJson(json);
}

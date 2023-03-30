import 'package:_04_health_check/class/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout(
      {required String id,
      required Level level,
      required String name,
      required double weight,
      required int cal,
      required int distance,
      required int reps}) = _Workout;

  factory Workout.fromJson(Map<String, Object?> json) =>
      _$WorkoutFromJson(json);
}

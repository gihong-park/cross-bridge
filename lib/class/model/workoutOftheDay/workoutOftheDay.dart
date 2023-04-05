import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workoutOftheDay.freezed.dart';
part 'workoutOftheDay.g.dart';

@freezed
class WorkoutOftheDay with _$WorkoutOftheDay {
  const factory WorkoutOftheDay({
    required String id,
    required String name,
    required String type,
    required String description,
    required List<Movement> movements,
    required DateTime date,
  }) = _WorkoutOftheDay;

  factory WorkoutOftheDay.fromJson(Map<String, Object?> json) =>
      _$WorkoutOftheDayFromJson(json);
}

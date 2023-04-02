import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/model/workoutOftheDay/workoutOftheDay.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recordModel.freezed.dart';
part 'recordModel.g.dart';

@freezed
class RecordModel with _$RecordModel {
  const factory RecordModel(
      {required WorkoutOftheDay? wod,
      required String note,
      required DateTime date,
      required List<Movement> movements}) = _RecordModel;
  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);
}

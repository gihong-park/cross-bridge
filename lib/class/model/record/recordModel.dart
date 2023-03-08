import 'package:_04_health_check/class/model/wod/wod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recordModel.freezed.dart';
part 'recordModel.g.dart';

@freezed
class RecordModel with _$RecordModel {
  const factory RecordModel(
      {required Map<String, int> result,
      required List<WODItem> wodItems}) = _RecordModel;
  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);
}

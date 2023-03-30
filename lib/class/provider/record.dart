import 'package:_04_health_check/class/model/workout/workout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/record/recordModel.dart';
part 'record.g.dart';

@riverpod
class Record extends _$Record {
  @override
  RecordModel build() {
    return const RecordModel(result: {}, workouts: [], isWOD: false);
  }

  void toggleWOD(bool isWOD) {
    state = state.copyWith(isWOD: isWOD);
  }

  void addWodItem(Workout wodItem) {
    state = state.copyWith(workouts: [...state.workouts, wodItem]);
  }

  void setWodItem(Workout editedItem) {
    state = state.copyWith(workouts: [
      for (final item in state.workouts)
        if (item.id == editedItem.id)
          item.copyWith(
              level: editedItem.level,
              name: editedItem.name,
              reps: editedItem.reps,
              cal: editedItem.cal,
              distance: editedItem.distance,
              weight: editedItem.weight)
        else
          item
    ]);
  }

  void removeWodItem(Workout wodItem) {
    state = state.copyWith(
      workouts: [
        ...state.workouts.where((element) => element.id != wodItem.id)
      ],
    );
  }

  void clear() {
    state = const RecordModel(result: {}, workouts: [], isWOD: false);
  }

  void addResult(String key, int value) {
    state = state.copyWith(result: {...state.result, key: value});
  }
}

import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/model/workoutOftheDay/workoutOftheDay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/record/recordModel.dart';
part 'record.g.dart';

@riverpod
class Record extends _$Record {
  @override
  RecordModel build() {
    return RecordModel(
        wod: null, note: "", movements: [], date: DateTime.now());
  }

  void setRecord(RecordModel record) {
    state = record;
  }

  void setWOD(WorkoutOftheDay? wod) {
    state = state.copyWith(wod: wod);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void addMovement(Movement movement) {
    state = state.copyWith(movements: [...state.movements, movement]);
  }

  void setMovement(Movement editedItem) {
    state = state.copyWith(movements: [
      for (final item in state.movements)
        if (item.id == editedItem.id)
          item.copyWith(
              name: editedItem.name,
              reps: editedItem.reps,
              cal: editedItem.cal,
              distance: editedItem.distance,
              weight: editedItem.weight)
        else
          item
    ]);
  }

  void removeMovement(Movement movement) {
    state = state.copyWith(
      movements: [
        ...state.movements.where((element) => element.id != movement.id)
      ],
    );
  }

  void clear() {
    state =
        RecordModel(wod: null, movements: [], note: "", date: DateTime.now());
  }

  // void addResult(String key, int value) {
  //   state = state.copyWith(result: {...state.result, key: value});
  // }
}

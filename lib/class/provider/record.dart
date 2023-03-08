import 'package:_04_health_check/class/model/wod/wod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/record/recordModel.dart';
part 'record.g.dart';

@riverpod
class Record extends _$Record {
  @override
  RecordModel build() {
    return const RecordModel(result: {}, wodItems: []);
  }

  void addWodItem(WODItem wodItem) {
    state = state.copyWith(wodItems: [...state.wodItems, wodItem]);
  }

  void setWodItem(WODItem editedItem) {
    state = state.copyWith(wodItems: [
      for (final item in state.wodItems)
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

  void removeWodItem(WODItem wodItem) {
    state = state.copyWith(
      wodItems: [
        ...state.wodItems.where((element) => element.id != wodItem.id)
      ],
    );
  }

  void clear() {
    state = const RecordModel(result: {}, wodItems: []);
  }

  void addResult(String key, int value) {
    state = state.copyWith(result: {...state.result, key: value});
  }
}

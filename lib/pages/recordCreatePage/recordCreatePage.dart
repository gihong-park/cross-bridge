import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/model/workoutOftheDay/workoutOftheDay.dart';
import 'package:_04_health_check/class/provider/record.dart';
import 'package:_04_health_check/class/provider/uuid.dart';
import 'package:_04_health_check/example/example.dart';
import 'package:_04_health_check/widgets/cbMovementAddButton/cbMovementAddButton.dart';
import 'package:_04_health_check/widgets/movementCard/movementCard.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suggester/suggester.dart';
import 'package:suggester/term_mapping.dart';
import 'package:uuid/uuid.dart';

class RecordCreatePage extends StatefulHookConsumerWidget {
  const RecordCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecordCreatePageState();
}

class _RecordCreatePageState extends ConsumerState<RecordCreatePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final suggesterAlphaOrNumeric = Suggester(AlphaOrNumeric())
      ..addAll(movements);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Record",
          style: TextStyle(
              fontSize: 20,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(18),
            icon: const Icon(Icons.save_as_outlined),
            onPressed: () => debugPrint("pressed"),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          children: [
            DropdownButton<WorkoutOftheDay>(
              isExpanded: true,
              value: ref.watch(recordProvider).wod,
              items: [
                ...wods.map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      "${e.type} / ${e.name}",
                      style: TextStyle(color: colorScheme.onBackground),
                    ),
                  ),
                ),
              ],
              onChanged: (value) =>
                  ref.watch(recordProvider.notifier).setWOD(value),
            ),
            TextField(
              style: TextStyle(color: colorScheme.onBackground),
              minLines: 1,
              maxLines: 100,
              onChanged: ref.watch(recordProvider.notifier).setNote,
              decoration: const InputDecoration(
                  isDense: true,
                  border: UnderlineInputBorder(),
                  label: Text("Note")),
            ),
            const SizedBox(height: 36),
            Text("Movements",
                style:
                    TextStyle(color: colorScheme.onBackground, fontSize: 20)),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ref.read(recordProvider).movements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                return MovementCard(
                    onChanged: ref.read(recordProvider.notifier).setMovement,
                    movement: ref.read(recordProvider).movements[i]);
              },
            ),
            CBMovementAddButton(
              onPressed: () => ref.watch(recordProvider.notifier).addMovement(
                  Movement(
                      id: ref.watch(uuidProvider).v4(),
                      name: "",
                      weight: 0,
                      cal: 0,
                      distance: 0,
                      reps: 0)),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

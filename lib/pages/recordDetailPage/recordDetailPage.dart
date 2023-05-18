import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/provider/record.dart';
import 'package:_04_health_check/class/provider/uuid.dart';
import 'package:_04_health_check/example/example.dart';
import 'package:_04_health_check/widgets/cbMovementAddButton/cbMovementAddButton.dart';
import 'package:_04_health_check/widgets/movementCard/movementCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecordDetailPage extends StatefulHookConsumerWidget {
  const RecordDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecordDetailPageState();
}

class _RecordDetailPageState extends ConsumerState<RecordDetailPage> {
  @override
  Widget build(BuildContext context) {
    final enabled = useState(false);
    final record = ref.watch(recordProvider);
    final recordNotifier = ref.watch(recordProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
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
          enabled.value
              ? IconButton(
                  padding: const EdgeInsets.all(18),
                  icon: Icon(Icons.save_as_outlined),
                  onPressed: () => enabled.value = false,
                )
              : IconButton(
                  padding: const EdgeInsets.all(18),
                  icon: Icon(Icons.edit),
                  onPressed: () => enabled.value = true,
                ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        children: [
          DropdownButton(
            isExpanded: true,
            value: record.wod,
            onChanged: enabled.value
                ? ref.watch(recordProvider.notifier).setWOD
                : null,
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
          ),
          TextFormField(
            enabled: enabled.value,
            style: TextStyle(color: colorScheme.onBackground, fontSize: 20),
            initialValue: record.note,
            onChanged: recordNotifier.setNote,
            minLines: 1,
            maxLines: 100,
            decoration: const InputDecoration(
                isDense: true,
                border: UnderlineInputBorder(),
                label: Text("Note")),
          ),
          const SizedBox(height: 36),
          Text("Movements",
              style: TextStyle(color: colorScheme.onBackground, fontSize: 20)),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: record.movements.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, i) {
              return MovementCard(
                movement: record.movements[i],
                enabled: enabled.value,
              );
            },
          ),
          CBMovementAddButton(
            enabled: enabled.value,
            onPressed: () => ref.watch(recordProvider.notifier).addMovement(
                Movement(
                    id: ref.watch(uuidProvider).v4(),
                    name: "",
                    weight: 0,
                    cal: 0,
                    distance: 0,
                    height: 0,
                    reps: 0)),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}

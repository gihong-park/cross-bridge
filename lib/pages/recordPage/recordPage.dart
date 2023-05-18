import 'package:_04_health_check/class/extension.dart';
import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/model/record/recordModel.dart';
import 'package:_04_health_check/class/provider/record.dart';
import 'package:_04_health_check/class/provider/uuid.dart';
import 'package:_04_health_check/example/example.dart';
import 'package:_04_health_check/pages/recordCreatePage/recordCreatePage.dart';
import 'package:_04_health_check/pages/recordDetailPage/recordDetailPage.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RecordPage extends StatefulHookConsumerWidget {
  const RecordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecordPageState();
}

class _RecordPageState extends ConsumerState<RecordPage> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weekCount = List<int>.filled(56, 0);
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Record",
          style: TextStyle(
              fontSize: 20,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: colorScheme.surface,
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => {
                    ref.watch(recordProvider.notifier).clear(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecordCreatePage()),
                    ),
                  }),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            width: size.width,
            height: 42,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: colorScheme.surface,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: size.width - 48 - 24 - 12 - 24 - 24 - 24,
                        child: AutoSizeTextField(
                          style: TextStyle(color: colorScheme.onSurface),
                          controller: _textEditController,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: colorScheme.secondaryContainer),
                              hintText: "search movement",
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () => debugPrint("presseddd"),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: records.length,
            padding: EdgeInsets.symmetric(horizontal: 24),
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 18,
              );
            },
            itemBuilder: (context, i) {
              final curWeek = records[i].date.weekNumber();
              weekCount[curWeek]++;
              final dateFormat = DateFormat("yyyy.MM.dd");
              final itemFormat = DateFormat("MM.dd");
              final firstDayOfWeek = records[i].date.getDayOfWeek().first;
              final lastDayOfWeek = records[i].date.getDayOfWeek().last;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (weekCount[curWeek] == 1)
                    Text(
                        "Week " +
                            curWeek.toString() +
                            " " +
                            itemFormat.format(firstDayOfWeek) +
                            " ~ " +
                            itemFormat.format(lastDayOfWeek),
                        style: TextStyle(
                            color: colorScheme.primary, fontSize: 16)),
                  if (weekCount[curWeek] == 1) SizedBox(height: 18),
                  Ink(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorScheme.surface,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        ref.watch(recordProvider.notifier).setRecord(
                              RecordModel(
                                wod: wods[0],
                                note: "note is important",
                                date: DateTime.now(),
                                movements: [
                                  Movement(
                                    cal: 0,
                                    distance: 0,
                                    id: ref.watch(uuidProvider).v4(),
                                    name: "Burpees",
                                    height: 0,
                                    weight: 0,
                                    reps: 20,
                                  ),
                                  Movement(
                                    cal: 20,
                                    distance: 0,
                                    id: ref.watch(uuidProvider).v4(),
                                    name: "Rowing",
                                    height: 0,
                                    weight: 0,
                                    reps: 0,
                                  ),
                                  Movement(
                                    cal: 0,
                                    distance: 0,
                                    id: ref.watch(uuidProvider).v4(),
                                    name: "Power Cleans",
                                    height: 0,
                                    weight: 135,
                                    reps: 8,
                                  ),
                                ],
                              ),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecordDetailPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateFormat.format(records[i].date),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              records[i].type + "/" + records[i].name,
                              style: TextStyle(
                                  fontSize: 16, color: colorScheme.onSurface),
                            ),
                            Text(
                              records[i].hashtags.fold(
                                  "",
                                  (value, element) =>
                                      value += "#" + element + " "),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: colorScheme.secondaryContainer),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

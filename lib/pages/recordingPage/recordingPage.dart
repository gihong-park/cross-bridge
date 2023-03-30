import 'package:_04_health_check/class/enum.dart';
import 'package:_04_health_check/class/extension.dart';
import 'package:_04_health_check/class/model/workout/workout.dart';
import 'package:_04_health_check/class/provider/record.dart';
import 'package:_04_health_check/util/util.dart';
import 'package:_04_health_check/widgets/cbAppBar/cbAppBar.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../class/const.dart';
import '../../widgets/dragDropCard/dragDropCard.dart';

class RecordingPage extends StatefulHookConsumerWidget {
  const RecordingPage({super.key});

  @override
  ConsumerState<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends ConsumerState<RecordingPage> {
  final _formKey = GlobalKey<FormState>();
  var _listKey = GlobalKey<AnimatedListState>();
  final _textEditController = TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy.MM.dd");
  DateTime selectedDate = DateTime.now();
  Set<String> results = {};

  void _insert() {
    final wodItem = Workout(
        id: uuid.v4(),
        level: Level.lv1,
        name: "",
        weight: 0,
        reps: 0,
        cal: 0,
        distance: 0);
    final record = ref.watch(recordProvider);
    ref.watch(recordProvider.notifier).addWodItem(wodItem);
    _listKey.currentState!.insertItem(record.workouts.length);
  }

  @override
  Widget build(BuildContext context) {
    final recordNotifier = ref.watch(recordProvider.notifier);
    final record = ref.watch(recordProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CBAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: 12),
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 120),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width -
                        horizontalPadding * 2,
                    maxHeight: double.infinity,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Date",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700)),
                                    InkWell(
                                      onTap: () {
                                        showDatePickerPop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                            dateFormat.format(selectedDate),
                                            style: theme.textTheme.bodyMedium),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "WOD",
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 26,
                                      child: Checkbox(
                                          side: MaterialStateBorderSide
                                              .resolveWith(
                                            (states) => BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          value: record.isWOD,
                                          onChanged: (value) => recordNotifier
                                              .toggleWOD(value ?? false)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Result",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width -
                                    horizontalPadding * 5),
                            child: Wrap(
                              runSpacing: 6,
                              spacing: 8,
                              children: [
                                ...results
                                    .map(
                                      (rst) => ActionChip(
                                        avatar: const Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.black,
                                        ),
                                        label: Text(
                                          rst,
                                          style: theme.textTheme.labelSmall,
                                        ),
                                        padding: EdgeInsets.zero,
                                        labelPadding: const EdgeInsets.only(
                                            left: 0,
                                            right: 8,
                                            top: -3,
                                            bottom: -3),
                                        onPressed: () => setState(() {
                                          results.remove(rst);
                                        }),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    )
                                    .toList(),
                                SizedBox(
                                  width: 82,
                                  height: 34,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: AutoSizeTextField(
                                          maxFontSize: 14,
                                          controller: _textEditController,
                                          minWidth: 60,
                                          fullwidth: false,
                                          style: theme.textTheme.labelLarge,
                                          decoration: InputDecoration.collapsed(
                                            border:
                                                const UnderlineInputBorder(),
                                            hintStyle: theme
                                                .textTheme.labelMedium
                                                ?.copyWith(color: Colors.grey),
                                            hintText: "무게/lb",
                                          ),
                                          onSubmitted: (value) {
                                            setState(() {
                                              results.add(value.capitalized());
                                            });
                                            _textEditController.clear();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 14,
                  child: IconButton(
                    icon: const Icon(Icons.add_circle_outline_rounded),
                    onPressed: () => _insert(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Form(
            key: _formKey,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: 132,
                    minWidth: MediaQuery.of(context).size.width -
                        horizontalPadding * 2,
                    maxWidth: MediaQuery.of(context).size.width -
                        horizontalPadding * 2,
                  ),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Result",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Wrap(
                            spacing: 12,
                            runSpacing: 6,
                            children: [
                              ...results.map(
                                (rst) => SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '입력필요';
                                      }
                                      return null;
                                    },
                                    style: theme.textTheme.bodySmall,
                                    decoration: InputDecoration(
                                      labelText: rst.split('/')[0],
                                      labelStyle: theme.textTheme.bodyMedium,
                                      floatingLabelStyle:
                                          theme.textTheme.bodySmall,
                                      suffixText: rst.split('/').length == 2
                                          ? rst.split('/')[1]
                                          : "",
                                    ),
                                    onSaved: (newValue) {
                                      ref
                                          .watch(recordProvider.notifier)
                                          .addResult(rst.split('/')[0],
                                              int.parse(newValue ?? "0"));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedList(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  key: _listKey,
                  initialItemCount: record.workouts.length,
                  itemBuilder: (context, index, anim) {
                    return SizeTransition(
                      sizeFactor: anim,
                      child: DragDropCard(
                        aniListKey: _listKey,
                        index: index,
                        deleteFunc: setAniList(index),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              child: const Text("Submit"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();

                  setState(() {
                    _listKey = GlobalKey();
                    recordNotifier.clear();
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showDatePickerPop(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );
    setState(() {
      selectedDate = picked ?? selectedDate;
    });
  }

  void Function(Workout) setAniList(int index) {
    return (Workout wodItem) {
      ref.watch(recordProvider.notifier).removeWodItem(wodItem);
      setState(() {
        _listKey.currentState!.removeItem(
          index,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: DragDropCard(
              index: index,
              aniListKey: _listKey,
              deleteFunc: setAniList(index),
            ),
          ),
        );
      });
    };
  }
}

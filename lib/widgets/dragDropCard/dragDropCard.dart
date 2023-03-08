import 'package:_04_health_check/class/extension.dart';
import 'package:_04_health_check/class/model/record/recordModel.dart';
import 'package:_04_health_check/class/provider/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../class/const.dart';
import '../../class/enum.dart';
import '../../class/model/wod/wod.dart';

class DragDropCard extends HookConsumerWidget {
  const DragDropCard(
      {super.key,
      required this.index,
      required this.aniListKey,
      required this.deleteFunc});
  final int index;
  final GlobalKey<AnimatedListState> aniListKey;
  final void Function(WODItem) deleteFunc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final record = ref.watch(recordProvider);
    final recordNotifier = ref.watch(recordProvider.notifier);
    final wodItem = record.wodItems[index];
    return Container(
      constraints: BoxConstraints(
        minHeight: 132,
        minWidth: MediaQuery.of(context).size.width - horizontalPadding * 2,
        maxWidth: MediaQuery.of(context).size.width - horizontalPadding * 2,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 132,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    DropdownButton<Level>(
                      value: wodItem.level,
                      style: Theme.of(context).textTheme.labelMedium,
                      items: lvList.map<DropdownMenuItem<Level>>((Level value) {
                        return DropdownMenuItem<Level>(
                          value: value,
                          child: Text(value.name.capitalized()),
                        );
                      }).toList(),
                      onChanged: (Level? value) {
                        recordNotifier.setWodItem(
                            wodItem.copyWith(level: value ?? Level.lv1));
                      },
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 64,
                        height: 36,
                        padding: const EdgeInsets.only(top: 6),
                        child: TextFormField(
                          initialValue: wodItem.name,
                          style: textTheme.bodySmall,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                            isDense: true,
                            hintText: "ex) Double Under",
                          ),
                          onChanged: (v) {
                            recordNotifier
                                .setWodItem(wodItem.copyWith(name: v));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {
                        deleteFunc(wodItem);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: TextFormField(
                        style: textTheme.bodySmall,
                        decoration: InputDecoration(
                            labelText: "무게",
                            labelStyle: textTheme.bodyMedium,
                            floatingLabelStyle: textTheme.bodySmall,
                            suffixText: "lb",
                            suffixStyle: textTheme.bodySmall),
                        onChanged: (v) {
                          if (v.isNotEmpty) {}
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: TextFormField(
                        style: textTheme.bodySmall,
                        decoration: InputDecoration(
                            labelText: "횟수",
                            labelStyle: textTheme.bodyMedium,
                            floatingLabelStyle: textTheme.bodySmall,
                            suffixText: "회",
                            suffixStyle: textTheme.bodySmall),
                        onChanged: (v) {
                          if (v.isNotEmpty) {}
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: TextFormField(
                        style: textTheme.bodySmall,
                        decoration: InputDecoration(
                            labelText: "칼로리",
                            labelStyle: textTheme.bodyMedium,
                            floatingLabelStyle: textTheme.bodySmall,
                            suffixText: "cal",
                            suffixStyle: textTheme.bodySmall),
                        onChanged: (v) {
                          if (v.isNotEmpty) {}
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: TextFormField(
                        style: textTheme.bodySmall,
                        decoration: InputDecoration(
                            labelText: "거리",
                            labelStyle: textTheme.bodyMedium,
                            floatingLabelStyle: textTheme.bodySmall,
                            suffixText: "m",
                            suffixStyle: textTheme.bodySmall),
                        onChanged: (v) {
                          if (v.isNotEmpty) {}
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

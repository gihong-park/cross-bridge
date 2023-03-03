import 'package:_04_health_check/widgets/healthAppBar/healthAppBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

enum Level { lv1, lv2, lv3 }

extension Capitalized on String {
  String capitalized() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}

const List<Level> list = <Level>[
  Level.lv1,
  Level.lv2,
  Level.lv3,
];

class WODItem {
  WODItem(
      {required this.key,
      required this.level,
      required this.name,
      required this.weight,
      required this.times});
  Key key;
  Level level;
  String name;
  double weight;
  int times;
}

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  List<WODItem> wodItems = [
    WODItem(
        key: UniqueKey(), level: Level.lv1, name: "PC", weight: 65, times: 20),
    WODItem(
        key: UniqueKey(), level: Level.lv2, name: "STO", weight: 65, times: 15),
    WODItem(
        key: UniqueKey(), level: Level.lv3, name: "HPC", weight: 65, times: 20),
  ];
  final _formKey = GlobalKey<FormState>();
  final _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HealthAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: AnimatedList(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                key: _listKey,
                initialItemCount: wodItems.length,
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (context, index, _) {
                  return LongPressDraggable<WODItem>(
                    key: UniqueKey(),
                    feedback: TestWidget(
                      wodItem: wodItems[index],
                    ),
                    data: wodItems[index],
                    child: CustomDragTarget<WODItem>(
                        onAccept: (data, targetData) {
                          if (targetData.key == data.key) return;
                          setState(() {
                            int oldIndex = wodItems.indexWhere(
                                (element) => element.key == data.key);
                            wodItems[index] = WODItem(
                                key: UniqueKey(),
                                level: data.level,
                                name: data.name,
                                weight: data.weight,
                                times: data.times);
                            _listKey.currentState!.removeItem(
                                oldIndex,
                                (context, animation) => SizeTransition(
                                    sizeFactor: animation,
                                    child: TestWidget(wodItem: data)));
                            wodItems.removeWhere(
                                (element) => element.key == data.key);
                          });
                        },
                        data: wodItems[index],
                        builder: (context, a, b) {
                          return TestWidget(wodItem: wodItems[index]);
                        }),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                child: Text("Submit"),
                onPressed: () => _formKey.currentState?.save(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({super.key, required this.wodItem});
  WODItem wodItem;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  Level dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
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
              DropdownButton<Level>(
                value: widget.wodItem.level,
                style: Theme.of(context).textTheme.labelMedium,
                items: list.map<DropdownMenuItem<Level>>((Level value) {
                  return DropdownMenuItem<Level>(
                    value: value,
                    child: Text(value.name.capitalized()),
                  );
                }).toList(),
                onChanged: (Level? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    if (value != null) {
                      dropdownValue = value;
                    }
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 64,
                    child: TextFormField(
                      initialValue: widget.wodItem.name,
                      style: textTheme.bodySmall,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: TextFormField(
                      initialValue: widget.wodItem.weight.toString(),
                      style: textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelText: "무게",
                          labelStyle: textTheme.bodyMedium,
                          floatingLabelStyle: textTheme.bodySmall,
                          suffixText: "lb",
                          suffixStyle: textTheme.bodySmall),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: TextFormField(
                      initialValue: widget.wodItem.times.toString(),
                      style: textTheme.bodySmall,
                      decoration: InputDecoration(
                          labelText: "횟수",
                          labelStyle: textTheme.bodyMedium,
                          floatingLabelStyle: textTheme.bodySmall,
                          suffixText: "회",
                          suffixStyle: textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDragTarget<T extends Object> extends StatefulWidget {
  const CustomDragTarget({
    super.key,
    required this.builder,
    this.onWillAccept,
    this.onAccept,
    this.onAcceptWithDetails,
    this.onLeave,
    this.onMove,
    this.hitTestBehavior = HitTestBehavior.translucent,
    required this.data,
  });

  final DragTargetBuilder<T> builder;
  final DragTargetWillAccept<T>? onWillAccept;
  final void Function(T data, T targetData)? onAccept;
  final DragTargetAcceptWithDetails<T>? onAcceptWithDetails;
  final DragTargetLeave<T>? onLeave;
  final DragTargetMove<T>? onMove;
  final HitTestBehavior hitTestBehavior;
  final T data;

  @override
  State<CustomDragTarget<T>> createState() => _CustomDragTargetState<T>();
}

class _CustomDragTargetState<T extends Object>
    extends State<CustomDragTarget<T>> {
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: widget.builder,
      onAccept: (data) {
        widget.onAccept?.call(data! as T, widget.data);
      },
    );
  }
}

import 'package:_04_health_check/class/model/movement/movement.dart';
import 'package:_04_health_check/class/provider/suggester.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovementCard extends StatefulHookConsumerWidget {
  const MovementCard({
    super.key,
    this.enabled = true,
    this.onChanged,
    this.onDelete,
    required this.movement,
  });
  final bool enabled;
  final Movement movement;
  final void Function(Movement)? onChanged;
  final void Function(Movement)? onDelete;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovementCardState();
}

class _MovementCardState extends ConsumerState<MovementCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.surface,
      ),
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 14, left: 14, right: 42, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Autocomplete<String>(
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      enabled: widget.enabled,
                      initialValue: widget.movement.name,
                      style: TextStyle(color: colorScheme.onBackground),
                      focusNode: focusNode,
                    );
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return _AutocompleteOptions(
                        displayStringForOption: (option) => option,
                        onSelected: onSelected,
                        options: options,
                        maxOptionsHeight: 200);
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    var suggestions = ref
                        .read(suggesterProvider)
                        .suggest(textEditingValue.text.toLowerCase())
                        .map((e) => e.entry.value);

                    if (suggestions.isEmpty) {
                      suggestions = [""];
                    }
                    return suggestions.isEmpty
                        ? Iterable<String>.generate(1)
                        : suggestions;
                  },
                  onSelected: (String selection) {
                    debugPrint('You just selected $selection');
                  },
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 12,
                  children: [
                    ValueWidget(
                      enabled: widget.enabled,
                      unit: "cal",
                      value: widget.movement.cal.toString(),
                      onChanged: (v) => widget.onChanged?.call(widget.movement
                          .copyWith(cal: v.isEmpty ? 0 : int.parse(v))),
                    ),
                    ValueWidget(
                      enabled: widget.enabled,
                      unit: "distance",
                      value: widget.movement.distance.toString(),
                      onChanged: (v) => widget.onChanged?.call(widget.movement
                          .copyWith(distance: v.isEmpty ? 0 : int.parse(v))),
                    ),
                    ValueWidget(
                      enabled: widget.enabled,
                      unit: "reps",
                      value: widget.movement.reps.toString(),
                      onChanged: (v) => widget.onChanged?.call(widget.movement
                          .copyWith(reps: v.isEmpty ? 0 : int.parse(v))),
                    ),
                    ValueWidget(
                      enabled: widget.enabled,
                      unit: "weight",
                      value: widget.movement.weight.toString(),
                      onChanged: (v) => widget.onChanged?.call(widget.movement
                          .copyWith(weight: v.isEmpty ? 0 : double.parse(v))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.do_disturb_on_outlined,
                  color: colorScheme.error, size: 32),
              onPressed: widget.enabled
                  ? () => widget.onDelete?.call(widget.movement)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class ValueWidget extends StatefulHookConsumerWidget {
  const ValueWidget(
      {super.key,
      required this.unit,
      required this.value,
      this.onChanged,
      this.enabled = true});
  final String unit;
  final String value;
  final bool enabled;
  final void Function(String)? onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ValueWidgetState();
}

class _ValueWidgetState extends ConsumerState<ValueWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        TextFormField(
          enabled: widget.enabled,
          initialValue: widget.value,
          onChanged: widget.onChanged,
          decoration:
              const InputDecoration(constraints: BoxConstraints(maxWidth: 42)),
          style: TextStyle(color: colorScheme.onSurface),
        ),
        Text(
          widget.unit,
          style: TextStyle(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}

// The default Material-style Autocomplete options.
class _AutocompleteOptions extends StatelessWidget {
  const _AutocompleteOptions({
    super.key,
    required this.displayStringForOption,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
  });

  final AutocompleteOptionToString<String> displayStringForOption;

  final AutocompleteOnSelected<String> onSelected;

  final Iterable<String> options;
  final double maxOptionsHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxOptionsHeight),
          child: options.first == ""
              ? InkWell(
                  onTap: () => onSelected(""),
                  child: Container(
                      color: Theme.of(context).focusColor,
                      padding: const EdgeInsets.all(14),
                      child: Text("직접 입력",
                          style: TextStyle(color: colorScheme.primary))),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return InkWell(
                      onTap: () {
                        onSelected(option);
                      },
                      child: Builder(builder: (BuildContext context) {
                        final bool highlight =
                            AutocompleteHighlightedOption.of(context) == index;
                        if (highlight) {
                          SchedulerBinding.instance
                              .addPostFrameCallback((Duration timeStamp) {
                            Scrollable.ensureVisible(context, alignment: 0.5);
                          });
                        }
                        return Container(
                          color:
                              highlight ? Theme.of(context).focusColor : null,
                          padding: const EdgeInsets.all(14.0),
                          child: Text(displayStringForOption(option),
                              style:
                                  TextStyle(color: colorScheme.onBackground)),
                        );
                      }),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

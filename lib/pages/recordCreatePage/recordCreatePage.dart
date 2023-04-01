import 'package:_04_health_check/example/example.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:suggester/suggester.dart';
import 'package:suggester/term_mapping.dart';

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
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        children: [
          DropdownButton(
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                child: Text("asdf",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
            onChanged: (value) => debugPrint(value.toString()),
          ),
          TextField(
            style: TextStyle(color: colorScheme.onBackground),
            minLines: 1,
            maxLines: 100,
            decoration: const InputDecoration(
                isDense: true,
                border: UnderlineInputBorder(),
                label: Text("Description")),
          ),
          const SizedBox(height: 36),
          Text("Movements",
              style: TextStyle(color: colorScheme.onBackground, fontSize: 20)),
          ListView.separated(
              shrinkWrap: true,
              itemCount: 1,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, i) {
                final _textEditController = TextEditingController();
                return Container(
                  constraints: BoxConstraints(minHeight: 96),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme.surface,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 14, left: 14, right: 42, bottom: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Autocomplete<String>(
                              fieldViewBuilder: (context, textEditingController,
                                  focusNode, onFieldSubmitted) {
                                return TextField(
                                  style: TextStyle(
                                      color: colorScheme.onBackground),
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                );
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return _AutocompleteOptions(
                                    displayStringForOption: (option) => option,
                                    onSelected: onSelected,
                                    options: options,
                                    maxOptionsHeight: 200);
                              },
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                var suggestions = suggesterAlphaOrNumeric
                                    .suggest(
                                        textEditingValue.text.toLowerCase())
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
                            Row(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    AutoSizeTextField(
                                      minWidth: 32,
                                      style: TextStyle(
                                          color: colorScheme.onSurface),
                                      controller: _textEditController,
                                      fullwidth: false,
                                    ),
                                    Text("Cal",
                                        style: TextStyle(
                                            color: colorScheme.onSurface)),
                                  ],
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
                          icon: Icon(Icons.disabled_by_default_outlined,
                              color: colorScheme.error),
                          onPressed: () => debugPrint("pressed"),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
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

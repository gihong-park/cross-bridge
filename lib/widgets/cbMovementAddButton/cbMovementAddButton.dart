import 'package:_04_health_check/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CBMovementAddButton extends StatefulHookConsumerWidget {
  const CBMovementAddButton({super.key, this.onPressed, this.enabled = true});
  final void Function()? onPressed;
  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CBMovementAddButtonState();
}

class _CBMovementAddButtonState extends ConsumerState<CBMovementAddButton> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        height: 40,
        width: 172,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colorScheme.surface)),
          onPressed: widget.enabled ? widget.onPressed : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Movement",
                  style: TextStyle(
                      color: enableColor(widget.enabled, colorScheme.primary,
                          colorScheme.tertiary),
                      fontSize: 16)),
              Icon(
                Icons.add_circle_outline,
                color: enableColor(
                    widget.enabled, colorScheme.primary, colorScheme.tertiary),
                size: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

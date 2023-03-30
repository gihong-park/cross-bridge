import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CBButton extends StatefulHookConsumerWidget {
  const CBButton({super.key, required this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CBButtonState();
}

class _CBButtonState extends ConsumerState<CBButton> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: widget.onPressed,
      child: widget.child,
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(42),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        side: BorderSide(width: 1.0, color: colorScheme.primary),
      ),
    );
  }
}

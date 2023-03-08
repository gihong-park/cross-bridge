import 'package:flutter/material.dart';

class CBDragTarget<T extends Object> extends StatefulWidget {
  const CBDragTarget({
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
  State<CBDragTarget<T>> createState() => _CBDragTargetState<T>();
}

class _CBDragTargetState<T extends Object> extends State<CBDragTarget<T>> {
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

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

Color enableColor(bool enabled, Color enabledColor, Color disabledColor) {
  return enabled ? enabledColor : disabledColor;
}

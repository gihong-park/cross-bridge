import 'package:_04_health_check/example/example.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suggester/suggester.dart';
import 'package:suggester/term_mapping.dart';

final suggesterProvider = Provider.autoDispose<Suggester>((ref) {
  return Suggester(AlphaOrNumeric())..addAll(movements);
});

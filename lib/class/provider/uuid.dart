import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suggester/suggester.dart';
import 'package:suggester/term_mapping.dart';
import 'package:uuid/uuid.dart';

final uuidProvider = Provider.autoDispose<Uuid>((ref) {
  return const Uuid();
});

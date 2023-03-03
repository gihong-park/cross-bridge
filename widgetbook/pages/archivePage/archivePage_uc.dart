import 'package:_04_health_check/pages/archivePage/archivePage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent archivePage = WidgetbookComponent(
  name: '$ArchivePage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => const ArchivePage(),
    ),
  ],
  isExpanded: true,
);

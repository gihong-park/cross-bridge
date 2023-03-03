import 'package:_04_health_check/pages/recordingPage/recordingPage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent recordingPage = WidgetbookComponent(
  name: '$RecordingPage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => const RecordingPage(),
    ),
  ],
  isExpanded: true,
);

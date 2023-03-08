import 'package:_04_health_check/pages/generatePage/generatePage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent generatePage = WidgetbookComponent(
  name: '$GeneratePage',
  useCases: [
    WidgetbookUseCase(name: 'default', builder: (context) => GeneratePage()),
  ],
  isExpanded: true,
);

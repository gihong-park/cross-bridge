import 'package:widgetbook/widgetbook.dart';
import 'package:_04_health_check/pages/homePage/homePage.dart';

WidgetbookComponent homePage = WidgetbookComponent(
  name: '$HomePage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => HomePage(),
    ),
  ],
  isExpanded: true,
);

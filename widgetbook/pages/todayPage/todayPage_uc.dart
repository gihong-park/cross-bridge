import 'package:_04_health_check/pages/todayPage/todayPage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent todayPage = WidgetbookComponent(
  name: '$TodayPage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => const TodayPage(),
    ),
  ],
  isExpanded: true,
);

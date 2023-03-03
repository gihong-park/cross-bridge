import 'package:_04_health_check/pages/loginPage/loginPage.dart';
import 'package:_04_health_check/pages/reservePage/reservePage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent reservePage = WidgetbookComponent(
  name: '$ReservePage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => const ReservePage(),
    ),
  ],
  isExpanded: true,
);

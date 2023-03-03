import 'package:_04_health_check/pages/loginPage/loginPage.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent loginPage = WidgetbookComponent(
  name: '$LoginPage',
  useCases: [
    WidgetbookUseCase(
      name: 'default',
      builder: (context) => const LoginPage(),
    ),
  ],
  isExpanded: true,
);

import 'package:_04_health_check/styles.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'pages/pages.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
        categories: [
          pages,
        ],
        appInfo: AppInfo(name: 'cross_bridge'),
        themes: [
          WidgetbookTheme(
            name: 'Light',
            data: themeData,
          ),
        ],
        devices: [
          Apple.iPhone13ProMax,
          Apple.iPhone12,
          Apple.iPhoneSE2020,
        ],
        supportedLocales: [
          Locale.fromSubtags(languageCode: 'kr'),
        ]);
  }
}

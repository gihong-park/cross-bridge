import 'package:widgetbook/widgetbook.dart';

import 'archivePage/archivePage_uc.dart';
import 'homePage/homePage_uc.dart';
import 'loginPage/loginPage_uc.dart';
import 'recordingPage/recordingPage_uc.dart';
import 'reservePage/reservePage_uc.dart';
import 'todayPage/todayPage_uc.dart';

WidgetbookCategory pages = WidgetbookCategory(
  name: 'Pages',
  widgets: [
    homePage,
    loginPage,
    recordingPage,
    todayPage,
    archivePage,
    reservePage
  ],
);

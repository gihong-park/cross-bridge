import 'package:intl/intl.dart';

extension Capitalized on String {
  String capitalized() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}

extension Weeknum on DateTime {
  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks() {
    DateTime dec28 = DateTime(year - 1, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int weekNumber() {
    int dayOfYear = int.parse(DateFormat("D").format(this));
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks();
    } else if (woy > numOfWeeks()) {
      woy = 1;
    }
    return woy;
  }

  List<DateTime> getDayOfWeek() {
    List<DateTime> dayOfWeek = [];
    DateTime firstday = subtract(Duration(days: weekday - 1));
    for (int i = 0; i < 7; i++) {
      dayOfWeek.add(firstday.add(Duration(days: i)));
    }
    return dayOfWeek;
  }
}

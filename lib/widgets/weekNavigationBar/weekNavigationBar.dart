import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WeekNavigationBar extends StatefulWidget {
  const WeekNavigationBar({super.key});

  @override
  State<WeekNavigationBar> createState() => _WeekNavigationBarState();
}

class _WeekNavigationBarState extends State<WeekNavigationBar> {
  GlobalKey<CurvedNavigationBarState> _navigationKey = GlobalKey();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.black,
      key: _navigationKey,
      letIndexChange: (index) => true,
      index: page,
      backgroundColor: Theme.of(context).colorScheme.background,
      items: <Widget>[
        Text('월',
            style: TextStyle(
                fontWeight: selectedDay(page, 0), color: Colors.white)),
        Text('화',
            style: TextStyle(
                fontWeight: selectedDay(page, 1), color: Colors.white)),
        Text('수',
            style: TextStyle(
                fontWeight: selectedDay(page, 2), color: Colors.white)),
        Text('목',
            style: TextStyle(
                fontWeight: selectedDay(page, 3), color: Colors.white)),
        Text('금',
            style: TextStyle(
                fontWeight: selectedDay(page, 4), color: Colors.white)),
      ],
      onTap: (index) {
        setState(() {
          page = index;
        });
      },
    );
  }
}

FontWeight selectedDay(int page, int index) {
  return page == index ? FontWeight.w700 : FontWeight.w100;
}

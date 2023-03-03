import 'package:_04_health_check/widgets/healthAppBar/healthAppBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  GlobalKey<CurvedNavigationBarState> _navigationKey = GlobalKey();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const HealthAppBar(),
      bottomNavigationBar: CurvedNavigationBar(
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                180 -
                MediaQuery.of(context).viewPadding.bottom,
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              children: [
                const Title(
                  title: "Warm Ups",
                ),
                const SizedBox(height: 12),
                const SubTitle(subTitle: "3 Rounds 45 ON: 15 OFF"),
                const SizedBox(height: 12),
                Text(
                  "- Jumping jack / Couch Stretches L R",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "- Foam Rolls (Row back & Hip",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "- Wall Facing Handstand Hold or Plank",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 50),
                const Title(
                  title: "Skills",
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text("-"),
                ),
                const SizedBox(height: 50),
                const Title(
                  title: "Conditionings",
                ),
                const SizedBox(height: 12),
                const SubTitle(subTitle: "Na'vi"),
                const SizedBox(height: 12),
                Text(
                  "AMRAP 14 mins",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  "14 Burpee Bar Touches, 6in",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "14 Single Dumbbell Box Step-ups, 50/35lbs, 24/20 in",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "14 Single Arm Dumbbell Hang Clean & Jerks 50/35 lbs",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 50),
                Text("Level 3: Prescribed", style: textTheme.bodyMedium),
                Text("Level 2: 35/25 lbs", style: textTheme.bodyMedium),
                Text("Level 1: - / - lbs", style: textTheme.bodyMedium),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.subTitle});
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

FontWeight selectedDay(int page, int index) {
  return page == index ? FontWeight.w700 : FontWeight.w100;
}

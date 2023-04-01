import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

enum State {
  enable,
  activate,
  disable,
}

class DashboardPage extends StatefulHookConsumerWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout Of the Day",
          style: TextStyle(
              fontSize: 20,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...getDayOfWeek(DateTime.now())
                    .map((i) => Weekday(date: i, state: getState(i))),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: Card(
              surfaceTintColor: colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("""
#Warm Ups
3 Rounds 45 ON : 15 OFF
• Jumping Jacks
• Front Rack Mob. L R / Front SO
• Hollow Arch Rolls 5

#Skills
 
#Conditionings
5 rounds for time of:
9 Hang Power Cleans, 155/105 lbs
21 Toes-to-bars
Rest 1 min
Time cap: 16 mins (including rest)
Goal: 9-10 mins (not including rest)
Level 3: Prescribed
Level 2: 135/95 Ibs, 15 T2B
Level 1: 95/65 Ibs or 1RM Power Clean 55%
15 Knee Raise or Midlines
""", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            width: size.width,
            height: 42,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: colorScheme.surface,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: size.width - 48 - 24 - 12 - 24 - 24 - 24,
                        child: AutoSizeTextField(
                          style: TextStyle(color: colorScheme.onSurface),
                          controller: _textEditController,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: colorScheme.secondaryContainer),
                              hintText: "search movement",
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () => debugPrint("presseddd"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello! User!",
                    style: TextStyle(color: colorScheme.onBackground)),
                Text("How do you want to start today?",
                    style: TextStyle(color: colorScheme.onBackground)),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Ink(
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorScheme.surface,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => debugPrint("pressed"),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TIMER / RECODER",
                        style: TextStyle(
                            fontSize: 24, color: colorScheme.onSurface),
                      ),
                      Text(
                        "Record Your Workout",
                        style: TextStyle(
                            fontSize: 16, color: colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Ink(
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorScheme.surface,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => debugPrint("pressed"),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LEADERBOARD",
                        style: TextStyle(
                            fontSize: 24, color: colorScheme.onSurface),
                      ),
                      Text(
                        "Come and See Others WOD Record",
                        style: TextStyle(
                            fontSize: 16, color: colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  State getState(DateTime date) {
    if (date.day == DateTime.now().day) {
      return State.activate;
    } else if (DateTime.now().compareTo(date) == 1) {
      return State.enable;
    } else {
      return State.disable;
    }
  }

  List<DateTime> getDayOfWeek(DateTime today) {
    List<DateTime> dayOfWeek = [];
    DateTime firstday = today.subtract(Duration(days: today.weekday - 1));
    for (int i = 0; i < 7; i++) {
      dayOfWeek.add(firstday.add(Duration(days: i)));
    }
    return dayOfWeek;
  }
}

class Weekday extends StatelessWidget {
  const Weekday({
    super.key,
    required this.date,
    required this.state,
  });
  final DateTime date;
  final State state;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final week = DateFormat('EEE').format(date);
    final day = DateFormat('dd').format(date);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: state == State.activate
              ? colorScheme.surface
              : colorScheme.background),
      child: Column(
        children: [
          Text(week, style: TextStyle(color: setColor(state), fontSize: 16)),
          Text(day, style: TextStyle(color: setColor(state), fontSize: 16)),
        ],
      ),
    );
  }

  Color setColor(State state) {
    if (state == State.activate) {
      return const Color(0xFFF3AF20);
    } else if (state == State.enable) {
      return const Color(0xFF8F8F8F);
    } else {
      return const Color(0xFF5F5F66);
    }
  }
}

import 'dart:developer';

import 'package:_04_health_check/pages/todayPage/todayPage.dart';
import 'package:_04_health_check/widgets/healthAppBar/healthAppBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  int page = 0;
  GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HealthAppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        key: navigationKey,
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
                Text("※: 한 수업 예약가능 최대인원 14명 입니다.",
                    style: GoogleFonts.notoSans(fontSize: 16)),
                Text("※: 예약취소는 수업전 최소 1시간전에 부탁드립니다.",
                    style: GoogleFonts.notoSans(fontSize: 16)),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => TodayPage()))),
                  child: Text(
                    "> 오늘의 운동 보러가기",
                    style:
                        GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50),
                ReserveCard(time: "11:00 ~ 12:00"),
                SizedBox(height: 12),
                ReserveCard(time: "19:30 ~ 20:30"),
                SizedBox(height: 12),
                ReserveCard(time: "20:40 ~ 21:40"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReserveCard extends StatelessWidget {
  const ReserveCard({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Text(time,
                style: GoogleFonts.notoSans(
                    fontSize: 20, fontWeight: FontWeight.w700)),
            Spacer(),
            Text("14 / 1"),
            SizedBox(width: 12),
            TextButton(
              onPressed: () => log("log"),
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              child: Text("예약",
                  style:
                      GoogleFonts.notoSans(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

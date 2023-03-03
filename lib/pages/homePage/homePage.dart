import 'dart:developer';

import 'package:_04_health_check/pages/archivePage/archivePage.dart';
import 'package:_04_health_check/pages/recordingPage/recordingPage.dart';
import 'package:_04_health_check/pages/reservePage/reservePage.dart';
import 'package:_04_health_check/pages/testPage/testPage.dart';
import 'package:_04_health_check/pages/todayPage/todayPage.dart';
import 'package:_04_health_check/widgets/footer/footer.dart';
import 'package:_04_health_check/widgets/healthAppBar/healthAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HealthAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            MenuButton(text: "오늘의 운동"),
            MenuButton(text: "예약하기", navigatePage: ReservePage()),
            MenuButton(
              text: "기록하기",
              navigatePage: RecordingPage(),
            ),
            MenuButton(
              text: "기록보기",
              navigatePage: ArchivePage(),
            ),
            Spacer(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton(
      {super.key, required this.text, this.navigatePage = const TodayPage()});
  final String text;
  final Widget navigatePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigatePage,
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.notoSans(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

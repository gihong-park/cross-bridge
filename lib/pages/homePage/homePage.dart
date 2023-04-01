import 'dart:developer';

import 'package:_04_health_check/class/const.dart';
import 'package:_04_health_check/pages/dashboardPage/dashboardPage.dart';
import 'package:_04_health_check/pages/recordPage/recordPage.dart';
import 'package:_04_health_check/pages/testPage/testPage.dart';
import 'package:_04_health_check/widgets/footer/footer.dart';
import 'package:_04_health_check/widgets/cbAppBar/cbAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashboardPage(),
      RecordPage(),
      DashboardPage(),
    ];
    final _selectedIdx = useState(0);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: pages[_selectedIdx.value],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        currentIndex: _selectedIdx.value,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondaryContainer,
        onTap: (idx) => _selectedIdx.value = idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

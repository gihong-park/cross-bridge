import 'dart:developer';

import 'package:_04_health_check/pages/dashboardPage/dashboardPage.dart';
import 'package:_04_health_check/pages/introPage/introPage.dart';
import 'package:_04_health_check/pages/profilePage/profilePage.dart';
import 'package:_04_health_check/pages/recordPage/recordPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      ProfilePage(),
    ];
    final colorScheme = Theme.of(context).colorScheme;
    final page = ref.watch(pageProvider);
    final pageNotifier = ref.watch(pageProvider.notifier);
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        currentIndex: page,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondaryContainer,
        onTap: (idx) => pageNotifier.state = idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

import 'package:_04_health_check/pages/homePage/homePage.dart';
import 'package:_04_health_check/pages/loginPage/loginPage.dart';
import 'package:_04_health_check/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

void main() {
  KakaoSdk.init(
    javaScriptAppKey: 'd5d993c13d5e357024200d4afc9f6f3e',
  );
  runApp(const HealthCheckApp());
}

class HealthCheckApp extends StatelessWidget {
  const HealthCheckApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training Bridge',
      theme: themeData,
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage()
      },
    );
  }
}

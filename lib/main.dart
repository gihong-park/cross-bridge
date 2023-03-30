import 'package:_04_health_check/class/const.dart';
import 'package:_04_health_check/pages/homePage/homePage.dart';
import 'package:_04_health_check/pages/introPage/introPage.dart';
import 'package:_04_health_check/pages/loginPage/loginPage.dart';
import 'package:_04_health_check/styles.dart';
import 'package:_04_health_check/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    javaScriptAppKey: 'd5d993c13d5e357024200d4afc9f6f3e',
  );
  PWAInstall().setup(installCallback: () {
    debugPrint('APP INSTALLED!');
  });
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(
    ProviderScope(observers: [Logger()], child: HealthCheckApp()),
  );
}

class HealthCheckApp extends StatelessWidget {
  const HealthCheckApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) => MaterialApp(
        title: 'cross buddy',
        theme: darkTheme,
        initialRoute: '/intro',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/intro': (context) => const IntroPage(),
        },
      ),
      maximumSize: maxSize,
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}

import 'package:_04_health_check/class/const.dart';
import 'package:_04_health_check/pages/loginPage/loginPage.dart';
import 'package:_04_health_check/pages/signinPage/signinPage.dart';
import 'package:_04_health_check/pages/signupPage/signupPage.dart';
import 'package:_04_health_check/widgets/cbButton/cbButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

final pageProvider = StateProvider((ref) => 0);

class IntroPage extends StatefulHookConsumerWidget {
  const IntroPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroPageState();
}

class _IntroPageState extends ConsumerState<IntroPage> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final selectedPage = ref.watch(pageProvider);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) =>
                ref.watch(pageProvider.notifier).state = value,
            children: const [
              PageWidget(
                alignment: Alignment(-0.2, 3),
                assetName: "images/workout3.jpeg",
                text: "Get Strong",
              ),
              PageWidget(
                alignment: Alignment.center,
                assetName: "images/workout2.jpeg",
                text: "Build Your Body",
              ),
              PageWidget(
                alignment: Alignment(-0.2, 3),
                assetName: "images/workout1.jpeg",
                text: "Get Your Buddy",
                top: 0,
                bottom: 0,
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: size.height * 2 / 3 + 16,
            child: PageViewDotIndicator(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              count: 3,
              currentItem: selectedPage,
              //selectedColor: const Color.fromARGB(255, 243, 176, 32),
              selectedColor: colorScheme.primary,
              unselectedColor: colorScheme.secondaryContainer,
            ),
          ),
          Positioned(
            left: horizontalPadding,
            right: horizontalPadding,
            bottom: size.height / 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: OutlinedButton(
                        child: Text(
                          "sign in",
                          style: TextStyle(color: colorScheme.primary),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninPage(),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          side: BorderSide(
                              width: 1.0, color: colorScheme.primary),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      fit: FlexFit.tight,
                      child: OutlinedButton(
                        child: Text(
                          "sign up",
                          style: TextStyle(color: colorScheme.primary),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          side: BorderSide(
                              width: 1.0, color: colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageWidget extends StatefulHookConsumerWidget {
  const PageWidget(
      {super.key,
      required this.text,
      required this.assetName,
      required this.alignment,
      this.bottom = 110,
      this.top = -110});
  final String assetName;
  final double bottom;
  final double top;
  final Alignment alignment;
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends ConsumerState<PageWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Positioned(
          bottom: widget.bottom,
          left: 0,
          right: 0,
          top: widget.top,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.assetName),
                alignment: widget.alignment,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height / 3,
          bottom: 0,
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.background,
                  Colors.black.withAlpha(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.5, 1],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: size.height / 4,
                  left: 32,
                  child: Text(
                    widget.text,
                    style: GoogleFonts.aBeeZee(
                      color: colorScheme.onBackground,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

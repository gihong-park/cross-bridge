import 'package:_04_health_check/pages/dashboardPage/dashboardPage.dart';
import 'package:_04_health_check/widgets/cbButton/cbButton.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmPage extends StatefulHookConsumerWidget {
  const ConfirmPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends ConsumerState<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: size.height / 20 + 12,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'CROSS BUDDY',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height / 10,
              left: 26,
              right: 26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please, tell more about yourself.',
                    style: TextStyle(color: colorScheme.primary, fontSize: 24),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: TextStyle(color: colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: "Gender",
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(color: colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: "BirthDay",
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(color: colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: "Weight",
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(color: colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: "Height",
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(color: colorScheme.onBackground),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Level",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CBButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false),
                    child: Text(
                      "Let's Started",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

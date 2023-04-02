import 'package:_04_health_check/pages/confirmPage/confirmPage.dart';
import 'package:_04_health_check/widgets/cbButton/cbButton.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends StatefulHookConsumerWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
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
                    'Sign Up',
                    style: TextStyle(color: colorScheme.primary, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Confirm Password",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CBButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmPage(),
                      ),
                    ),
                    child:
                        const Text("Sign Up", style: TextStyle(fontSize: 20)),
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

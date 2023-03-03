import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TRAINING",
                    style: GoogleFonts.roboto(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5
                        ..color = Colors.black,
                    ),
                  ),
                  Text(
                    "BRIDGE",
                    style: GoogleFonts.notoSans(
                        fontSize: 48,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                LoginTextField(
                  labelText: "아이디",
                ),
                LoginTextField(
                  labelText: "비밀번호",
                  isObsecure: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Center(
                        child: Text(
                          "로그인 하기",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16),
                  child: TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Center(
                        child: Text(
                          "카카오톡 로그인하기",
                          style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final String labelText;

  const LoginTextField(
      {super.key, this.isObsecure = false, required this.labelText});
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: TextField(
        obscureText: isObsecure,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}

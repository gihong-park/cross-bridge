import 'package:_04_health_check/class/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:pwa_install/pwa_install.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (PWAInstall().installPromptEnabled) {
      try {
        PWAInstall().promptInstall_();
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CROSS",
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
              flex: 5,
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
                        horizontal: horizontalPadding, vertical: 12),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Text(
                            "로그인 하기",
                            style: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 8),
                    child: TextButton(
                      onPressed: () => kakaoLogin(context),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Text(
                            "카카오톡 로그인하기",
                            style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 16,
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
      ),
    );
  }

  Future<void> kakaoLogin(BuildContext context) async {
    var isInstalled = await isKakaoTalkInstalled();
    print(isInstalled);
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance
            .loginWithKakaoTalk(redirectUri: Uri.base.toString());
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
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
      padding: const EdgeInsets.symmetric(
          vertical: 8, horizontal: horizontalPadding),
      child: TextField(
        obscureText: isObsecure,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}

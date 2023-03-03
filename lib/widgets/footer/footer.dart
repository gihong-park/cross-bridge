import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: data.padding.bottom),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  "Created By: kihong-park",
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

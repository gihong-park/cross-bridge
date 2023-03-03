import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HealthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: Colors.black,
          height: 4.0,
        ),
      ),
      backgroundColor: Colors.grey[50],
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "TRAINING ",
            style: GoogleFonts.roboto(
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
                color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

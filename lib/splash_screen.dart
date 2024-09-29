import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cores/constants/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void redirect(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, '/main');
      },
    );
  }

  @override
  void initState() {
    redirect(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'payuung',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                color: clrWhite,
              ),
            ),
            Text(
              'pribadi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.comfortaa().fontFamily,
                color: clrWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

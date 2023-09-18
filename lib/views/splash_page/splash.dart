import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HERE YOUR SPLASH SCREEN",style: GoogleFonts.prociono(
          color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24
        ),),
      ),
    );
  }
}

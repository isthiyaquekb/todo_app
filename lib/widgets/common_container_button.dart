import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonContainerButton extends StatelessWidget {
  final VoidCallback tap;
  const CommonContainerButton({
    super.key,
    required this.tap
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: tap,
        child: Container(height: 40,width: MediaQuery.of(context).size.width*0.6,decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(30)
        ),child: Center(
          child: Text("CREATE TASK",style: GoogleFonts.sofiaSans(
              color: Theme.of(context).colorScheme.onPrimaryContainer,fontSize: 16,fontWeight: FontWeight.w600
          ),),
        ),),
      ),
    );
  }
}

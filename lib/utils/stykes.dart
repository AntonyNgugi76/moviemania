
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles extends StatelessWidget {
  const Styles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("",
        style: GoogleFonts.raleway(
          textStyle: TextStyle(
            fontSize: 18,
          )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/color_app.dart';

class ThemeApp {
  static ThemeData myTheme(BuildContext context) {
    return ThemeData(
      primaryColor: ColorsApp.primerColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleMedium: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
        titleSmall: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black),
        bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
        bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 22, color: ColorsApp.fontColor),
        bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: ColorsApp.fontColor),
      ),
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
        shadowColor: Colors.black,
        color: ColorsApp.primerColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.transparent,
    );
  }
}

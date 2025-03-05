import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_app.dart';

class ThemeApp {
  static ThemeData myTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      primaryColor: ColorsApp.primerColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleMedium: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
        titleSmall: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black),
        labelMedium: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
        bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
        bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: ColorsApp.fontColor),
        labelLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 13, color: ColorsApp.fontColor),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        shadowColor: Colors.black,
        color: ColorsApp.primerColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.transparent,
    );
  }
}

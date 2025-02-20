import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constan/constan_app.dart';

class ThemeApp
{
    static ThemeData myTheme = ThemeData(

        primaryColor: ColorsApp.primerColor,
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                )
            ),
            color: ColorsApp.primerColor,centerTitle: true,iconTheme: IconThemeData(color: Colors.white)
        ),
        textTheme: TextTheme(
            titleMedium: GoogleFonts.exo(fontWeight: FontWeight.w400,fontSize: 22.sp,color: Colors.white),
            bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Colors.black),
            bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 22.sp,color: ColorsApp.fontColor)
        ),
        scaffoldBackgroundColor: Colors.transparent

    );
}

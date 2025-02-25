import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constant/color_app.dart';

class SettingScreen extends StatelessWidget
{
    static const String route = "/setting";

    const SettingScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Center
            (
                child: Column(

                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(height: 5.h),

                        const Text("Language"),

                            InkWell(

                             onTap: () {

                             },
                              child: Container
                              (
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white, border: Border.all(color: ColorsApp.primerColor, width: 3)
                                  ), padding: const EdgeInsets.all(9),
                                  height: 30.h, width: 150.w
                              ),
                            )
                    ]
                )
            );
    }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import '../constant/color_app.dart';

class DrawerApp extends StatelessWidget {
   const DrawerApp({super.key,required this.onSideMenuItemClick});
 final Function onSideMenuItemClick;
  static const int category = 1 ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: ColorsApp.primerColor,
              child: Center(
                child: Text(
                  "News App",
                  style: ThemeApp.myTheme(context).textTheme.labelMedium,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      onSideMenuItemClick(category);
                    },
                    child: _buildDrawerItem(Icons.category, "Category"),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 30.w),
        SizedBox(width: 10.w),
        Text(title, style: TextStyle(fontSize: 18.sp)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constant/color_app.dart';
import 'package:news_app/features/sources/models/source_respon.dart';

class TabItem extends StatelessWidget {
  const TabItem({required this.source, required this.isSelected, super.key});
  final bool isSelected ;
  final Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: isSelected ? ColorsApp.primerColor : Colors.transparent,
        border: Border.all(color: ColorsApp.primerColor, width: 2.w),
      ),

      //  width: 2.w,
      margin: const EdgeInsets.all(9),
      padding: const EdgeInsets.all(4),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: isSelected ? Colors.white : ColorsApp.primerColor,
          fontSize: 18,
        ),
      ),
    );
  }
}

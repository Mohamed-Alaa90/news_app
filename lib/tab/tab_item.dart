import 'package:flutter/material.dart';
import 'package:news_app/core/constant/color_app.dart';
import 'package:news_app/model/source_model.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.source, required this.isSelected});

  final bool isSelected;
  final Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? ColorsApp.primerColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: ColorsApp.primerColor),
      ),

      child: Text(
        source.id ?? "",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: isSelected ? Colors.white : ColorsApp.primerColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/tab/tab_item.dart';

import '../news/new_widget.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.sourceList});

  final List<Source> sourceList;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourceList.isEmpty) {
      return const Center(child: Text("No sources available"));
    }

    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            padding: const EdgeInsets.all(5),
            // physics: AlwaysScrollableScrollPhysics(),
            onTap: (value) {
              setState(() {
                selectIndex = value;
              });
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs:
                widget.sourceList
                    .map(
                      (source) => TabItem(source: source, isSelected: selectIndex == widget.sourceList.indexOf(source)),
                    )
                    .toList(),
          ),
          Expanded(child: NewWidget(source: widget.sourceList[selectIndex])),
        ],
      ),
    );
  }
}

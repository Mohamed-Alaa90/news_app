import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/news_screen.dart';
import 'package:news_app/features/sources/models/source_respon.dart';
import 'package:news_app/features/sources/widget/tab_item.dart';

class TabWidget extends StatefulWidget
{
  final  List<Source> sourceList;

    const TabWidget({super.key, required this.sourceList});

    @override
    State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
{
    int selectedIndex = 0;
    @override
    Widget build(BuildContext context)
    {
        return DefaultTabController(
            length: widget.sourceList.length,
            child: Column(
                children: [
                    TabBar(
                        onTap: (value)
                        {
                            setState(()
                                {
                                    selectedIndex = value;
                                }
                            );
                        },
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        tabs:
                        widget.sourceList
                            // ignore: avoid_types_as_parameter_names
                            .map(
                                (Source) => TabItem(
                                    source: Source,
                                    isSelected:
                                    selectedIndex == widget.sourceList.indexOf(Source)
                                )
                            )
                            .toList()
                    ),
                    Expanded(child: NewsScreen(source: widget.sourceList[selectedIndex]
                    )
                    )
                ]
            )
        );
    }
}

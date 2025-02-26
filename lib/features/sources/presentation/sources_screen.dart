import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/constant/color_app.dart';
import 'package:news_app/core/network_helper/api_manager.dart';
import 'package:news_app/features/sources/models/source_respon.dart';
import 'package:news_app/features/sources/widget/tab_widget.dart';

class SourcesScreen extends StatefulWidget
{
    static const String route = "/SourcesScreen";

    const SourcesScreen({super.key});

    @override
    State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen>
{
    late Future<SourceRespon?> futureSources;

    @override
    void initState()
    {
        super.initState();
        futureSources = ApiManager.getSources();
    }

    void _retryFetchingData()
    {
        setState(()
            {
                futureSources = ApiManager.getSources();
            }
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return  FutureBuilder<SourceRespon?>(
                future: futureSources,
                builder: (context, snapshot)
                {
                    if (snapshot.connectionState == ConnectionState.waiting)
                    {
                        return Center(child: LoadingAnimationWidget.halfTriangleDot(color: ColorsApp.primerColor, size: 50));
                    }
                    else if (snapshot.hasError)
                    {
                        return Center(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    const Text("Something Went Wrong"),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                        onPressed: _retryFetchingData,
                                        child: const Text("Try Again")
                                    )
                                ]
                            )
                        );
                    }
                    else if (snapshot.data?.status != "ok")
                    {
                        return Center(
                            child: Column(
                                children: [
                                    Text(snapshot.data!.message!),
                                    ElevatedButton(
                                        onPressed: _retryFetchingData,
                                        child: const Text("try Again")
                                    )
                                ]
                            )
                        );
                    }
                    var sorsesList = snapshot.data?.sources ?? [];
                    return TabWidget(sourceList: sorsesList);
                }
            );

    }
}

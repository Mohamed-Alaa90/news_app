import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:news_app/core/constant/api_constant.dart';
import 'package:news_app/features/news/model/news_model.dart';
import 'package:news_app/features/sources/models/source_respon.dart';

class ApiManager
{
    static Future<SourceRespon?> getSources() async
    {
        Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiSources,
            {
                'apiKey': '623910c14da8411a942668f3b7ec4b48'
            }
        );
        try
        {
            var response = await https.get(url);
            var responseBody = response.body;
            var json = jsonDecode(responseBody);
            return SourceRespon.fromJson(json);
        }
        catch (e)
        {
            throw e;
        }
    }

    //GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=623910c14da8411a942668f3b7ec4b48

    static Future<NewsModel?> getNewsById(String sourceId) async
    {
        Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiNews
            , 
            {
                'apiKey': '623910c14da8411a942668f3b7ec4b48',
                'sources': sourceId
            }
        );
        try
        {
            var response = await https.get(url);
            var responseBody = response.body;
            var json = jsonDecode(responseBody);
            return NewsModel.fromJson(json);
        }
        catch (e)
        {
            throw e;
        }
    }
}

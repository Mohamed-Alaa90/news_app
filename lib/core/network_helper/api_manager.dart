import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import 'package:news_app/core/constant/api_constant.dart';
import 'package:news_app/model/news_model.dart';

import '../../model/source_model.dart';

class ApiManager {
  static const String _apiKey = '623910c14da8411a942668f3b7ec4b48';

  static Future<SourceRespon?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiSources, {'apiKey': _apiKey, 'category': categoryId});

    try {
      var response = await https.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceRespon.fromJson(json);
      } else {
        if (kDebugMode) {
          print("❌ خطأ في API: ${response.statusCode} - ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ خطأ في جلب البيانات: $e");
      }
      return null;
    }
  }

  static Future<NewsModel?> getNewsById(String categoryId, String page) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiNews, {
      'apiKey': _apiKey,
      'sources': categoryId,
      'pageSize': '10',
      'page': page,
    });

    try {
      var response = await https.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return NewsModel.fromJson(json);
      } else {
        if (kDebugMode) {
          print("❌ خطأ في API: ${response.statusCode} - ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ خطأ في جلب البيانات: $e");
      }
      return null;
    }
  }

  static Future<NewsModel?> getSearch(String query) async {
    if (query.isEmpty) return null;
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.apiNews, {'apiKey': _apiKey, 'q': query});

    try {
      var response = await https.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return NewsModel.fromJson(json);
      } else {
        if (kDebugMode) {
          print("❌ خطأ في API: ${response.statusCode} - ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ خطأ في جلب البيانات: $e");
      }
      return null;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  static const String apiKey = '77279673b7864c47ada57b5b34c3cba3';
  static const String baseUrl = 'https://newsapi.org/v2/everything';
  static const String trendingNewsUrl = 'https://newsapi.org/v2/everything';

  // Enhanced method with pagination support
  Future<News?> getCustomNews({
    required String query,
    String? language = 'en',
    String? sortBy = 'publishedAt',
    int pageSize = 20,
    int page = 1,
    String? from,
    String? to,
    String? sources,
    String? domains,
  }) async {
    try {
      print('🔁 API call: query="$query", page=$page, pageSize=$pageSize');

      var queryParams = <String, String>{
        'q': query,
        'apiKey': apiKey,
        'pageSize': pageSize.toString(),
        'page': page.toString(),
      };

      if (language != null) queryParams['language'] = language;
      if (sortBy != null) queryParams['sortBy'] = sortBy;
      if (from != null) queryParams['from'] = from;
      if (to != null) queryParams['to'] = to;
      if (sources != null) queryParams['sources'] = sources;
      if (domains != null) queryParams['domains'] = domains;

      var uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
      print('📡 URL: $uri');

      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      print('📡 Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var news = newsFromJson(response.body);
        print('✅ API success: ${news.articles.length} articles received');
        return news;
      } else {
        print('❌ API error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('💥 Network error: $e');
      return null;
    }
  }

  // Keep the old method for backward compatibility
  Future<Map<String, dynamic>?> getNewsData(String token) async {
    try {
      var news = await getCustomNews(query: token);
      if (news != null) {
        return news.toJson();
      }
      return null;
    } catch (e) {
      print('💥 Error in getNewsData: $e');
      return null;
    }
  }

// Trending News using 'everything' endpoint with keyword "trending"
  Future<News?> getTrendingNews({
    String query = 'trending',
    int pageSize = 5,
    int page = 1,
  }) async {
    try {
      print('🔁 API call: Trending News | query="$query", page=$page');

      var queryParams = <String, String>{
        'q': query,
        'sortBy': 'publishedAt',
        'apiKey': apiKey,
        'pageSize': pageSize.toString(),
        'page': page.toString(),
        'language': 'en', // optional: filter only English articles
      };

      var uri = Uri.parse('https://newsapi.org/v2/everything')
          .replace(queryParameters: queryParams);
      print('📡 Trending URL: $uri');

      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      print('📡 Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var news = newsFromJson(response.body);
        print('✅ Trending API success: ${news.articles.length} articles received');
        return news;
      } else {
        print('❌ Trending API error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('💥 Network error (trending): $e');
      return null;
    }
  }


  // Method to get news by category
  Future<News?> getNewsByCategory({
    required String category,
    int page = 1,
    int pageSize = 20,
  }) async {
    return await getCustomNews(
      query: category,
      sortBy: 'publishedAt',
      page: page,
      pageSize: pageSize,
    );
  }
}
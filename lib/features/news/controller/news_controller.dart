import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var token = 'general';

  // Main news data
  var news = Rxn<News>();
  var articles = <Article>[].obs; // Observable list for articles
  var trendingarticles = <Article>[].obs; // Observable list for articles

  // Loading states
  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var isRefreshing = false.obs;
  var error = ''.obs;

  // Pagination
  var currentPage = 1.obs;
  var totalResults = 0.obs;
  var hasMoreData = true.obs;
  var pageSize = 20;

  final newsService = NewsService();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    print('🌐 onInit called in NewsController');
    scrollController = ScrollController();
    _addScrollListener();
    loadInitialData();
    loadTrendingNews();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Add scroll listener for infinite scroll
  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        // Load more when 80% scrolled
        loadMoreData();
      }
    });
  }

  // Load initial data (first page)
  Future<void> loadInitialData() async {
    try {
      print('📦 loadInitialData called');
      isLoading.value = true;
      error.value = '';
      currentPage.value = 1;

      var result = await newsService.getCustomNews(
        query: token,
        page: 1,
        pageSize: pageSize,
      );

      if (result != null) {
        news.value = result;
        articles.value = result.articles; // Replace all articles
        totalResults.value = result.totalResults;
        hasMoreData.value = result.articles.length >= pageSize;

        print('🎯 Initial data loaded: ${articles.length} articles');
        print('📊 Total available: ${totalResults.value}');
      } else {
        error.value = 'Failed to load news data';
        print('❌ No data received from NewsService');
      }
    } catch (e) {
      error.value = 'Error: $e';
      print('💥 Error in loadInitialData: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadTrendingNews() async {
    final trendingNews = await newsService.getTrendingNews(
      query: 'technology', // or 'general', 'sports', etc.
      pageSize: 5,
    );

    if (trendingNews != null) {
      trendingarticles.assignAll(trendingNews.articles);
    }
  }


  // Load more data (pagination)
  Future<void> loadMoreData() async {
    // Prevent multiple simultaneous requests
    if (isLoadingMore.value || !hasMoreData.value) return;

    try {
      print('📦 loadMoreData called for page ${currentPage.value + 1}');
      isLoadingMore.value = true;

      var result = await newsService.getCustomNews(
        query: token,
        page: currentPage.value + 1,
        pageSize: pageSize,
      );

      if (result != null && result.articles.isNotEmpty) {
        // Add new articles to existing list
        articles.addAll(result.articles);
        currentPage.value++;

        // Check if there's more data
        hasMoreData.value = result.articles.length >= pageSize;

        print('🎯 More data loaded: ${result.articles.length} new articles');
        print('📊 Total articles now: ${articles.length}');
      } else {
        hasMoreData.value = false;
        print('🏁 No more data available');
      }
    } catch (e) {
      print('💥 Error in loadMoreData: $e');
      // Don't show error for load more failures
    } finally {
      isLoadingMore.value = false;
    }
  }

  // Pull to refresh
  Future<void> refreshData() async {
    try {
      print('🔄 refreshData called');
      isRefreshing.value = true;
      error.value = '';
      currentPage.value = 1;
      hasMoreData.value = true;

      var result = await newsService.getCustomNews(
        query: token,
        page: 1,
        pageSize: pageSize,
      );
      loadTrendingNews();
      if (result != null) {
        news.value = result;
        articles.value = result.articles; // Replace all articles
        totalResults.value = result.totalResults;
        hasMoreData.value = result.articles.length >= pageSize;

        print('🎯 Data refreshed: ${articles.length} articles');
      } else {
        error.value = 'Failed to refresh news data';
      }
    } catch (e) {
      error.value = 'Refresh error: $e';
      print('💥 Error in refreshData: $e');
    } finally {
      isRefreshing.value = false;
    }
  }

  // Search with pagination reset
  Future<void> searchNews(String query) async {
    try {
      isLoading.value = true;
      error.value = '';
      token = query;
      currentPage.value = 1;
      hasMoreData.value = true;

      var result = await newsService.getCustomNews(
        query: query,
        page: 1,
        pageSize: pageSize,
      );

      if (result != null) {
        news.value = result;
        articles.value = result.articles; // Replace all articles
        totalResults.value = result.totalResults;
        hasMoreData.value = result.articles.length >= pageSize;

        print('🔍 Search results: ${articles.length} articles for "$query"');
      } else {
        error.value = 'No results found for "$query"';
        articles.clear();
      }
    } catch (e) {
      error.value = 'Search error: $e';
      articles.clear();
    } finally {
      isLoading.value = false;
    }
  }

  // Getter methods
  bool get hasNews => articles.isNotEmpty;
  bool get isInitialLoading => isLoading.value && articles.isEmpty;
}
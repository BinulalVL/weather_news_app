import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_news_app/features/news/widgets/homepage_gif.dart';
import 'package:weather_news_app/features/news/widgets/homepage_trending_news_slider.dart';
import 'package:weather_news_app/features/news/widgets/homepage_weather_details.dart';
import 'package:weather_news_app/features/news/widgets/news_searching_page_ovelbuttons.dart';

import '../controller/news_controller.dart';
import '../models/news_model.dart';
import '../widgets/homepage_article_card.dart';
import '../widgets/homepage_searchbar.dart';

class NewsSearchingPage extends StatelessWidget {
  const NewsSearchingPage ({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find<NewsController>();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (newsController.isInitialLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading news...'),
              ],
            ),
          );
        }

        if (newsController.error.value.isNotEmpty && !newsController.hasNews) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  newsController.error.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => newsController.loadInitialData(),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (newsController.hasNews) {
          return RefreshIndicator(
            onRefresh: () => newsController.refreshData(),
            child: CustomScrollView(
              controller: newsController.scrollController,
              slivers: [
                SliverAppBar(
                  // title:
                  //     CircleAvatar(backgroundColor: Colors.grey.shade200,child: Icon(CupertinoIcons.back,color: Colors.black,),),

                  surfaceTintColor: Colors.transparent,
                  floating: false,
                  pinned: true,
                  expandedHeight: height / 4.2,
                  backgroundColor: Colors.white,
                  snap: false,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(
                      height/4.2,
                    ), // Adjust to match your container's height
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Discover',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                          child: Text('News from all around the worlds',style: TextStyle(fontSize: 13,color: Colors.grey),),
                        ),

                    HomepageSearchbar(),
                    SizedBox(height: height/50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: height/25,
                        child: ListView(scrollDirection: Axis.horizontal,children: [

                         NewsSearchingPageOvelbuttons(label: 'All', color: Colors.blue,fontcolor: Colors.white,),
                         NewsSearchingPageOvelbuttons(label: 'Sports', color: Colors.grey.shade200,fontcolor: Colors.grey.shade800,),
                         NewsSearchingPageOvelbuttons(label: 'Weather', color: Colors.grey.shade200,fontcolor: Colors.grey.shade800,),
                         NewsSearchingPageOvelbuttons(label: 'Politics', color: Colors.grey.shade200,fontcolor: Colors.grey.shade800,),

                        ],),
                      ),
                    ),
                      SizedBox(height: 15,),

                    ]),
                  ),

                  flexibleSpace: FlexibleSpaceBar(

                   // background: ,
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      // Show article card
                      if (index < newsController.articles.length) {
                        Article article = newsController.articles[index];
                        return HomepageArticleCard(article: article,index: index,);
                      }

                      // Show loading indicator at the end if loading more
                      if (newsController.isLoadingMore.value) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                              SizedBox(width: 12),
                              Text('Loading more...'),
                            ],
                          ),
                        );
                      }

                      // Show "No more data" message
                      if (!newsController.hasMoreData.value) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(height: 8),
                              Text(
                                'You\'ve reached the end!',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        );
                      }

                      return SizedBox.shrink();
                    },
                    childCount: newsController.articles.length + 1,
                  ),
                ),
              ],
            ),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.newspaper, size: 48, color: Colors.grey),
              SizedBox(height: 16),
              Text('No news available'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => newsController.loadInitialData(),
                child: Text('Refresh'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

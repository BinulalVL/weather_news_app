import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_news_app/core/theme/app_theme.dart';
import 'package:weather_news_app/features/news/widgets/homepage_gif.dart';
import 'package:weather_news_app/features/news/widgets/homepage_news_bar.dart';
import 'package:weather_news_app/features/news/widgets/homepage_searchbar.dart';
import 'package:weather_news_app/features/news/widgets/homepage_trending_news_slider.dart';
import 'package:weather_news_app/features/news/widgets/homepage_weather_details.dart';

import '../controller/home_controller.dart';
import '../widgets/homepage_news_category_toggle_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'ATMOS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            floating: false,
            pinned: true,
            expandedHeight: height / 3.3,
            backgroundColor: Colors.white,
            snap: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                48,
              ), // Adjust to match your container's height
              child: HomepageSearchbar(),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  HomepageGif(gif: 'lib/core/gifs/rainy.gif'),
                  HomepageWeatherDetails(
                    weather: 'Rainy',
                    temperature: 22,
                    wind: 12,
                    chanceOfRain: 82,
                    humidity: 27,
                  ),
                ],
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Trending News',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: HomepageTrendingNewsSlider(),
              ),
              SizedBox(height: height/20,)
            ],
          ),
        ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Latest News',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child:HomepageNewsBar()
              );
            }, childCount: 5),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}

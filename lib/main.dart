import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_news_app/features/news/views/home_page.dart';
import 'package:weather_news_app/features/news/views/saved_news_page.dart';

import 'features/news/bindings/news_bindings.dart';
import 'features/news/views/bottom_navigationbar.dart';
import 'features/news/views/news_detail_page.dart';
import 'features/news/widgets/saved_news_box.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: BottomNavigationbar(),
      );
  }
}

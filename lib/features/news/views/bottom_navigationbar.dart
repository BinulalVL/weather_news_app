import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_news_app/features/news/views/claud_ai_home.dart';
import 'package:weather_news_app/features/news/views/saved_news_page.dart';
import 'package:weather_news_app/features/news/views/testpage.dart';

import '../../../core/theme/app_theme.dart';
import '../../weather/views/weather_page.dart';
import 'home_page.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {

  final List<Widget> _pages = [WeatherScreen(), HomePage(),SavedNewsPage()];
  var _selectedIndex = 1;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change the index to the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: height / 12,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppTheme.lightOutlineColor!)
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppTheme.primaryLight,
          type: BottomNavigationBarType.fixed,

          showSelectedLabels: false,
          showUnselectedLabels: false,

          // unselectedLabelStyle: TextStyle(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cloud, size: 28),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 28),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border, size: 28),
              label: 'Saved',
            ),
          ],

          currentIndex: _selectedIndex,
          unselectedItemColor:
          Colors.grey[1000], // Set default icon color to grey
          // showUnselectedLabels: true,
          selectedItemColor:
          AppTheme.primaryBlue, // Set pressed icon color to violet
          // unselectedLabelStyle: TextStyle(color: Colors.grey), // Set default label color to grey
          // selectedLabelStyle: TextStyle(color: Colors.purple),
          // Set selected label color to violet
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

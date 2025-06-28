import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E3A59),
              Color(0xFF1E2837),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Panavally',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                // Current temperature
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '26',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            '°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Overcast',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jun 28 Sat   28°C / 24°C',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Hourly forecast
                Flexible(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildHourlyItem('7PM', Icons.cloud, '26°'),
                        _buildHourlyItem('8PM', Icons.cloud, '26°'),
                        _buildHourlyItem('9PM', Icons.thunderstorm, '25°'),
                        _buildHourlyItem('10PM', Icons.thunderstorm, '25°'),
                        _buildHourlyItem('11PM', Icons.thunderstorm, '25°'),
                      ],
                    ),
                  ),
                ),

                // Daily forecast
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      _buildDailyItem('Today', Icons.cloud, 'Overcast', '28/24°'),
                      _buildDailyItem('Tomorrow', Icons.thunderstorm, 'Thunderstorm', '29/25°'),
                      _buildDailyItem('Mon', Icons.grain, 'Scattered', '30/25°'),
                      _buildDailyItem('Tue', Icons.grain, 'Showers', '29/24°'),
                      _buildDailyItem('Wed', Icons.thunderstorm, 'Thunderstorm', '29/24°'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHourlyItem(String time, IconData icon, String temp) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 11,
            ),
          ),
          SizedBox(height: 6),
          Icon(
            icon,
            color: Colors.white70,
            size: 20,
          ),
          SizedBox(height: 6),
          Text(
            temp,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyItem(String day, IconData icon, String condition, String temp) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Text(
                day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              icon,
              color: Colors.white70,
              size: 16,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                condition,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              temp,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
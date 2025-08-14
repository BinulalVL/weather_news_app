import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomepageWeatherDetails extends StatelessWidget {
  const HomepageWeatherDetails({
    super.key,
    required this.weather,
    required this.temperature,
    required this.wind,
    required this.chanceOfRain,
    required this.humidity,


  });
  final String weather;
  final int chanceOfRain;
  final int wind;
  final int humidity;
  final int temperature;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 12),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '$weather',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${temperature}°',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(CupertinoIcons.wind),
                Text('${wind} km/h', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Wind', style: TextStyle(color: Colors.black)),
              ],
            ),
            Column(
              children: [
                Icon(CupertinoIcons.cloud_rain),
                Text('${chanceOfRain} km/h', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Chance of rain', style: TextStyle(color: Colors.black)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.water_drop_outlined),
                Text('${humidity} km/h', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Humidity', style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_news_app/core/theme/app_theme.dart';

class HomepageNewsCategoryToggleSwitch extends StatefulWidget {
  const HomepageNewsCategoryToggleSwitch({super.key});

  @override
  State<HomepageNewsCategoryToggleSwitch> createState() =>
      _UserConductorTogglerSwitchState();
}

var isWeatherCategory = 0;
var isNewsCategory = 1;
var isSportsCategory = 0;
var isTechCategory = 0;

class _UserConductorTogglerSwitchState
    extends State<HomepageNewsCategoryToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isSportsCategory = 0;
                isWeatherCategory = 0;
                isTechCategory = 0;
                isNewsCategory = 1;
              });
            },
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(right: 10, left: 10),
                    child: Text(
                      'News',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isNewsCategory == 1
                            ? AppTheme.primaryBlue
                            : Colors.grey[400],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      height: 2,
                      color: isNewsCategory == 1 ?AppTheme.primaryBlue: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),InkWell(
          onTap: () {
            setState(() {
              isSportsCategory = 0;
              isWeatherCategory =1;
              isTechCategory = 0;
              isNewsCategory = 0;
            });
          },
          child: IntrinsicWidth(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                  child: Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isWeatherCategory == 1 ? AppTheme.primaryBlue:Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 2,
                    color: isWeatherCategory == 1 ? AppTheme.primaryBlue : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSportsCategory = 1;
              isWeatherCategory = 0;
              isTechCategory = 0;
              isNewsCategory = 0;
            });
          },
          child: IntrinsicWidth(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                  child: Text(
                    'Sports',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSportsCategory == 0 ? Colors.grey[400] : AppTheme.primaryBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 2,
                    color: isSportsCategory == 1 ? AppTheme.primaryBlue: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),InkWell(
          onTap: () {
            setState(() {
              isSportsCategory = 0;
              isWeatherCategory = 0;
              isTechCategory = 1;
              isNewsCategory = 0;
            });
          },
          child: IntrinsicWidth(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                  child: Text(
                    'Tech',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isTechCategory == 0 ? Colors.grey[400] :AppTheme.primaryBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 2,
                    color: isTechCategory == 1 ? AppTheme.primaryBlue : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

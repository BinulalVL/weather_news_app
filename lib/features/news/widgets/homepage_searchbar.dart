import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomepageSearchbar extends StatelessWidget {
  const HomepageSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
      child: Container(
        height: height/17,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Icon(CupertinoIcons.search, color: Colors.grey.shade800),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade800,fontSize: 15),
                  border: InputBorder.none,
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(CupertinoIcons.slider_horizontal_3, color: Colors.grey.shade800),
              onSelected: (value) {
                // handle selected filter
                print("Selected Filter: $value");
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Weather',
                  child: Text('Weather'),
                ),
                const PopupMenuItem<String>(
                  value: 'Sports',
                  child: Text('Sports'),
                ),
                const PopupMenuItem<String>(
                  value: 'Tech',
                  child: Text('Tech'),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}

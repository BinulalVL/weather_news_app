import 'package:flutter/material.dart';

class HomepageSearchbar extends StatelessWidget {
  const HomepageSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
      child: Container(
        height: height/16,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_list, color: Colors.grey[700]),
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

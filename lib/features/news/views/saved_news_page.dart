import 'package:flutter/material.dart';
import 'package:weather_news_app/features/news/widgets/saved_news_box.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Saved',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Icon(Icons.bookmark_border)
        ],
      ),),

      body:
      GridView.builder(
        itemCount: 8,
        padding:  const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: height/3.8,

          //childAspectRatio: 0.8, // Makes items square
        ),
        itemBuilder: (context, index) {
          return  SavedNewsBox();
        },
      )




      ,
    );
  }
}

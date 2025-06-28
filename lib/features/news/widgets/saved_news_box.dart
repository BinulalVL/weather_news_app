import 'package:flutter/material.dart';
import 'package:weather_news_app/features/news/views/news_detail_page.dart';

class SavedNewsBox extends StatelessWidget {
  const SavedNewsBox({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailPage(),));
      },
      child: Container(height: height/3.8,width: width/2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child:
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(20)),
              child: Container(
                height:height/8 ,
                decoration:  BoxDecoration(color: Colors.grey,
                    image: DecorationImage(image: AssetImage('lib/features/news/assets/space.jpeg',),fit: BoxFit.cover)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
              child: Text('SpaceX sends first regular Crew Dragon mission to ISS',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end
                  ,children: [ Icon(Icons.bookmark,color: Colors.black,size: 25,)]),
            )
          ],
        ),),
    );
  }
}

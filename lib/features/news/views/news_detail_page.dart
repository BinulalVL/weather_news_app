import 'package:flutter/material.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_backbutton.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_detailbox.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_image.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_savebutton.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
         NewsDetailpageImage(imgUrl: 'lib/features/news/assets/space.jpeg'),
          Positioned(
            top: height/21,
            left:  20,
            child:NewsDetailpageBackbutton() ,
          ),
          Positioned( top: height/2.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('SpaceX sends first regular Crew \nDragon mission to ISS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
              )),
          Positioned( top: height/1.9,right: width/20,
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child:NewsDetailpageSavebutton()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(20)),
                child: Container(
                  color:Colors.white ,
                  height: height-(height/1.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: width/20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NewsDetailpageDetailbox(label: 'Author', icon: Icons.person_outline, data: 'Binulal'),
                            NewsDetailpageDetailbox(label: 'Published', icon: Icons.watch_later_outlined, data: '11/06/2025')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10,bottom: 10,top: 20),
                        child: Text('SpaceX sends first regular Crew Dragon mission to ISS',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding:  const EdgeInsets.only(left: 20.0,right: 10,bottom: 10,top: 10),
                        child: Text('Crew Dragon\'s second manned hgfgt jygfyhg jhhghj  flight hvh gjuhkjcs khhcs khcsnm jhj csh hcs mh mjcshjh ...'),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        TextButton(onPressed: () {

                        }, child: Text('link',style: TextStyle(color: Colors.blue),))
                      ],)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_news_app/features/news/models/news_model.dart';

import 'format_date.dart';

class HomepageTrendingNewsSlider extends StatelessWidget {
  const HomepageTrendingNewsSlider({super.key,required this.list});
  final List <Article>list;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.8,
            height: height / 4.5,
            autoPlayInterval: Duration(seconds: 5),
            autoPlay: false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _currentIndex = index;
            },
          ),
          items: list.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: (){
                    Article article=i;
                    Get.toNamed('/detailPage',arguments: i);
                    },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.expand(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 1.0),
                                    Colors.black.withValues(alpha: 0.1),
                                  ],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.network(
                                i.urlToImage ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: 200,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.image_not_supported, size: 50),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    width: double.infinity,
                                    height: 200,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(i.source.name, style: TextStyle(color: Colors.white, fontSize: 12)),
                                    Text(' • ', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    Text(formatDate(i.publishedAt), style: TextStyle(color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                child: Text(
                                  i.title ?? '',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:list.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _currentIndex == entry.key ? 12.0 : 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Colors.blueAccent
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

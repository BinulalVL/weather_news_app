import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomepageTrendingNewsSlider extends StatelessWidget {
  const HomepageTrendingNewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          height: height/2,
          autoPlayInterval: Duration(seconds: 5),
          autoPlay: true,
          enlargeCenterPage: true),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),color: Colors.grey,
              ),
              child:  Stack(
                children: [
                  // Full background image
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: SizedBox.expand(
                      child: Image.asset(
                        'lib/features/news/assets/space.jpeg', // Replace with your asset or network image
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  // Positioned glass container at bottom half
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.black.withValues(alpha: 0.2), // Semi-transparent white
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SpaceX sends first regular\nCrew Dragon mission to ISS',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Crew Dragon\'s second manned hgfgt jygfyhg jhhghj  flight...',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            );
          },
        );
      }).toList(),
    );
  }
}

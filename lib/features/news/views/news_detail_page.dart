import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_backbutton.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_detailbox.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_image.dart';
import 'package:weather_news_app/features/news/widgets/news_detailpage_savebutton.dart';

import '../models/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage({super.key, required});
  final Article article = Get.arguments;

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    // Try external application first
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Fallback: try in-app webview
      if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          NewsDetailpageImage(imgUrl: article.urlToImage!.toString()),
          Positioned(
            top: height / 21,
            left: 20,
            child: NewsDetailpageBackbutton(),
          ),
          Positioned(
            top: height / 3,
            left: 1,
            right: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: height/4.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? "No title",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height / 1.9,
            right: width / 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: NewsDetailpageSavebutton(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  height: height - (height / 1.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NewsDetailpageDetailbox(
                              label: 'Author',
                              icon: Icons.person_outline,
                              data: article.author ?? "No Author",
                            ),
                            NewsDetailpageDetailbox(
                              label: 'Date',
                              icon: Icons.watch_later_outlined,
                              data: article.publishedAt != null
                                  ? formatDate(article.publishedAt!)
                                  : "No Date",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 10,
                                    bottom: 10,
                                    top: 20,
                                  ),
                                  child: Text(
                                    article.title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Text(
                                    article.description!,
                                     maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: TextButton(
                                        onPressed: () {
                                          _launchURL(
                                            article.url ?? "https://google.com",
                                          );
                                        },
                                        child: Text(
                                          'link',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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

import 'package:flutter/material.dart';

class NewsDetailpageBackbutton extends StatelessWidget {
  const NewsDetailpageBackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: width/8,
        width: width/8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black.withValues(alpha: 0.4)),
        child: Center(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
      ),
    );
  }
}

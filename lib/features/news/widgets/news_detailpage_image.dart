import 'package:flutter/material.dart';

class NewsDetailpageImage extends StatelessWidget {
  const NewsDetailpageImage({super.key,required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      color:Colors.black ,
      height: height/1.6,
      child: SizedBox.expand(child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 1.0), // Fully opaque on the left
                Colors.black.withValues(alpha: 0.3), // Fully transparent on the right
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset('$imgUrl',fit:BoxFit.cover,)),),
    );
  }
}

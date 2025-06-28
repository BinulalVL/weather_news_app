import 'package:flutter/material.dart';

class HomepageGif extends StatelessWidget {
  const HomepageGif({super.key,required this.gif});
  final String gif;

  @override
  Widget build(BuildContext context) {
    return  ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn, // Try other modes too
        child: SizedBox.expand(child: Image.asset('$gif',fit: BoxFit.fitWidth,))
    );
  }
}

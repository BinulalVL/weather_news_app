import 'package:flutter/material.dart';

class NewsDetailpageDetailbox extends StatelessWidget {
  const NewsDetailpageDetailbox({super.key,required this.label,required this.icon,required this.data});
  final String label;
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height/20,
      decoration: BoxDecoration(color: Colors.blue.shade50,borderRadius: BorderRadius.circular(10),),
      child: Padding(
        padding: const EdgeInsets.all( 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(icon as IconData?,color: Colors.blue,),
            ),
            Text('${label}: ${data}',style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}

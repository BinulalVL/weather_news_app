import 'package:flutter/material.dart';

class  NewsSearchingPageOvelbuttons extends StatelessWidget {
  const  NewsSearchingPageOvelbuttons({super.key,required this.label,required this.color,required this.fontcolor});
final String label;
final Color color;
final Color fontcolor;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        height: height / 20,
        //color: Colors.grey,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          border: Border.all(color:Colors.grey.shade50),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Text(label,style:TextStyle(color: fontcolor,fontSize: 13),),
          ),
        ),
      ),
    );
  }
}

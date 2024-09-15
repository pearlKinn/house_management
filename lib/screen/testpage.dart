import 'package:flutter/material.dart';

class Testpage extends StatelessWidget {
  Testpage({super.key});

  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.9
  );
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children:[
        Container(
          margin:  EdgeInsets.all(10),
          color: Colors.red,
        ),
        Container(
          margin:  EdgeInsets.all(10),
          color: Colors.yellow,
        ),        
        Container(
          margin:  EdgeInsets.all(10),
          color: Colors.green,
        ),      
      ] 
    );
  }
}
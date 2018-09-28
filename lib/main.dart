import 'package:flutter/material.dart';
import 'package:interactive_story/home_screen/home_screen.dart';

main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Story',
      home: HomeScreen(),
    );
  }
}

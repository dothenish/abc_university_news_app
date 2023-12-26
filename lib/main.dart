import 'package:flutter/material.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMT News App',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: HomePage(), //HomePage UI is retrived from home_page.dart
    );
  }
}

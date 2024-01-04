import 'package:flutter/material.dart';
import 'widgets/home_page.dart';
import 'widgets/on_boarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UMT News App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/homepage':(context) => const HomePage()
      },
      //home: const HomePage(),
      home: const OnBoardingPage(),
    );
  }
}

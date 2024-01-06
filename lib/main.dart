/*=====================================================
* Program: main.dart
* Purpose: Main program to run the UMT News App
* Notes: define routes, call onBoardingPage()
*======================================================
*/
import 'package:flutter/material.dart';
import 'views/screen/home_page.dart';
import 'views/screen/on_boarding_page.dart';

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
      //defining route for the app
      initialRoute: '/onboarding',
      routes: {
        '/onboarding':(context) => const OnBoardingPage(),
        '/homepage':(context) => const HomePage(),
      },
      //The app will first show the onboarding page when the program is being run.
      home: const OnBoardingPage(),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import '../models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String author;
  final DateTime dateAdded;
  final String imageUrl;

  const NewsDetailPage({
    required this.title,
    required this.description,
    required this.category,
    required this.dateAdded,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Format the date to display only the date and time (hour:minute)
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateAdded);
    String formattedTime = DateFormat('HH:mm').format(dateAdded);

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.indigo,
    //     title: const Text(
    //       'Details'
    //   ),
    //     centerTitle: true,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(title, style: const TextStyle(fontSize: 20.0)),
    //         const SizedBox(height: 8.0),
    //         Text('Category: $category'),
    //         const SizedBox(height: 8.0),
    //         Text('Description: $description'),
    //         const SizedBox(height: 8.0),
    //         Text('Date Added: $formattedDate $formattedTime'),
    //       ],
    //     ),
    //   ),
    // );
      return Scaffold(
        appBar:  AppBar(
          title: Text(title),
          backgroundColor: Colors.indigo,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 8.0,),
              Text(formattedDate,
              style: const TextStyle(
                fontStyle: FontStyle.italic
                ),
              ),
              const SizedBox(height: 8.0,),
              Text('Published by $author',
              style: const TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.file(File(imageUrl),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 200,
              ),
            ),
            const SizedBox(height: 30.0,),
            Text(description,
            style: const TextStyle(
              fontSize: 18,
            ),)
          ],
        ),
      )
    );
  }
}

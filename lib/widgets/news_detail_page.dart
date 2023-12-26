import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final DateTime dateAdded;

  NewsDetailPage({
    required this.title,
    required this.description,
    required this.category,
    required this.dateAdded,
  });

  @override
  Widget build(BuildContext context) {
    // Format the date to display only the date and time (hour:minute)
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateAdded);
    String formattedTime = DateFormat('HH:mm').format(dateAdded);

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Text('Category: $category'),
            SizedBox(height: 8.0),
            Text('Description: $description'),
            SizedBox(height: 8.0),
            Text('Date Added: $formattedDate $formattedTime'),
          ],
        ),
      ),
    );
  }
}

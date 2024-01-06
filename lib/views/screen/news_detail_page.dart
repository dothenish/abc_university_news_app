import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage({ //to receive news objects
    super.key, 
    required this.news,
    });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(news.dateAdded);

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              news.title,
              style: GoogleFonts.noticiaText(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8.0,),
            Text(
              formattedDate,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 8.0,),
            Text(
              'Published by ${news.author}',
              style: const TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.file(
                File(news.imageUrl),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),

            const SizedBox(height: 30.0,),
            Text(
              news.description,
              style: GoogleFonts.noticiaText(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

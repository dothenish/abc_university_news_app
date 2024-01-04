import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String author;
  final DateTime dateAdded;
  final String imageUrl;

  const NewsDetailPage({super.key, 
    required this.title,
    required this.description,
    required this.category,
    required this.dateAdded,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateAdded);
    
    return Scaffold(
        appBar:  AppBar(
          title: Text(title),
          backgroundColor: Colors.teal,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
              style: GoogleFonts.noticiaText(
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
              child: Image.file(
                File(imageUrl),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                ),
              ),

            const SizedBox(height: 30.0,),
            Text(description,
            style: GoogleFonts.noticiaText(
              fontSize: 18,
            ),)
          ],
        ),
      )
    );
  }
}

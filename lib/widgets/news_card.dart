import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:umt_news_app/widgets/news_detail_page.dart';
import '../models/news.dart';


class NewsCard extends StatelessWidget {
  final News news;
  final Function onNewsChanged;

  const NewsCard({super.key, required this.news, required this.onNewsChanged});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(news.dateAdded);
    String formattedTime = DateFormat('HH:mm').format(news.dateAdded);

    return Card(
      margin: const EdgeInsets.all(20.0),
      elevation: 2.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Column 1: Image
            SizedBox(height: 130, width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(
                  File(news.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Column 2: News Details
            const SizedBox(width: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.category,
                      style: GoogleFonts.nunito(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      news.title,
                      style: GoogleFonts.noticiaText(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Published by ${news.author}',
                      style: GoogleFonts.nunito(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8.0),
                    Text('$formattedDate $formattedTime'),
                  ],
                ),
              ),
            ),
            
            // Column 3: Bookmark Icon
            IconButton(
              icon: Icon(
                news.isFavorited ? Icons.bookmark : Icons.bookmark_border,
                color: news.isFavorited ? Colors.black : null,
              ),
              onPressed: () {
                // Toggle the isFavorited
                news.isFavorited = !news.isFavorited;
                onNewsChanged(); //callback fctn
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(
                title: news.title,
                author: news.author,
                description: news.description,
                category: news.category,
                dateAdded: news.dateAdded,
                imageUrl: news.imageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
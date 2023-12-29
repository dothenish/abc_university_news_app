import 'dart:io';

import 'package:flutter/material.dart';
import 'package:umt_news_app/widgets/news_detail_page.dart';
import 'package:umt_news_app/widgets/bottom_navigation.dart';
import 'add_news_page.dart';
import 'package:umt_news_app/models/news.dart';
import 'package:intl/intl.dart';
import '../widgets/favourites_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> newsList = [];

  void addNews(News news) {
    setState(() {
      newsList.add(news);
    });
  }

  void onNewsChanged() {
    setState(() {});
  }

  void navigateToAddNews() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewsPage(
          onNewsAdded: addNews,
        ),
      ),
    );
  }

  void navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavouritesPage(newsList),
      ),
    );
  }

  // void navigateToHome() {

  //   print('Navigating to the home page');
  // }
  

  @override
  Widget build(BuildContext context) {
    newsList.sort((a, b) => b.dateAdded.compareTo(a.dateAdded),);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'UMT News App',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewsList(newsList: newsList, onNewsChanged: onNewsChanged),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingAddButton(
              onPressed: navigateToAddNews,
            ),
            bottomNavigationBar: BottomNavigation(
              onAddNews: navigateToAddNews,
              onShowFavorites: navigateToFavorites,
            ),
          );
        }
      }

class NewsList extends StatelessWidget {
  final List<News> newsList;
  final Function onNewsChanged;

  const NewsList({super.key, required this.newsList, required this.onNewsChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index], onNewsChanged: onNewsChanged);
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final News news;
  final Function onNewsChanged;

  const NewsCard({super.key, required this.news, required this.onNewsChanged});

  @override
  Widget build(BuildContext context) {
    // Format the date to display only the date and time (hour:minute)
    String formattedDate = DateFormat('yyyy-MM-dd').format(news.dateAdded);
    String formattedTime = DateFormat('HH:mm').format(news.dateAdded);

 return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 2.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: SizedBox(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(news.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.category, // Existing line
              style: const TextStyle(
                fontSize: 16.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Text(news.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 8.0),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Published by ${news.author}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8.0), 
            Text('$formattedDate $formattedTime'),
            //const SizedBox(height: 20.0),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            news.isFavorited ? Icons.bookmark : Icons.bookmark_border,
            color: news.isFavorited ? Colors.black : null,
          ),
          onPressed: () {
            // Toggle the isFavorited property
            news.isFavorited = !news.isFavorited;
            onNewsChanged(); // Trigger the callback
          },
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


import 'package:flutter/material.dart';
import 'package:umt_news_app/widgets/news_detail_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UMT News'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent News',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: NewsList(newsList: newsList, onNewsChanged: onNewsChanged),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewsPage(
                    onNewsAdded: addNews,
                  ),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritesPage(newsList),
                ),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> newsList;
  final Function onNewsChanged;

  NewsList({required this.newsList, required this.onNewsChanged});

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

  NewsCard({required this.news, required this.onNewsChanged});

  @override
  Widget build(BuildContext context) {
    // Format the date to display only the date and time (hour:minute)
    String formattedDate = DateFormat('yyyy-MM-dd').format(news.dateAdded);
    String formattedTime = DateFormat('HH:mm').format(news.dateAdded);

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(news.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${news.category}'),
            Text('Description: ${news.description}'),
            Text('Date Added: $formattedDate $formattedTime'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            news.isFavorited ? Icons.favorite : Icons.favorite_border,
            color: news.isFavorited ? Colors.red : null,
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
                description: news.description,
                category: news.category,
                dateAdded: news.dateAdded,
              ),
            ),
          );
        },
      ),
    );
  }
}

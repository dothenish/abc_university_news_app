import 'package:flutter/material.dart';
import 'package:umt_news_app/widgets/news_detail_page.dart';
import 'add_news_page.dart';
import 'package:umt_news_app/models/news.dart';
import 'package:intl/intl.dart';



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
            child: NewsList(newsList),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> newsList;

  NewsList(this.newsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(newsList[index]);
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final News news;

  NewsCard(this.news);

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

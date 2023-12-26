import 'package:flutter/material.dart';
import 'package:umt_news_app/models/news.dart';
import '../widgets/home_page.dart';

class FavouritesPage extends StatelessWidget {
  final List<News> newsList;

  FavouritesPage(this.newsList);

  @override
  Widget build(BuildContext context) {
    List<News> favouritedNewsList = newsList.where((news) => news.isFavorited).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        centerTitle: true,
      ),
      body: NewsList(newsList: favouritedNewsList, onNewsChanged: () {}),
    );
  }
}

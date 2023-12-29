import 'package:flutter/material.dart';
import 'package:umt_news_app/models/news.dart';
import '../widgets/home_page.dart';
import 'bottom_navigation.dart';

class FavouritesPage extends StatelessWidget {
  final List<News> newsList;

  FavouritesPage(this.newsList);

  @override
  Widget build(BuildContext context) {
    List<News> favouritedNewsList = newsList.where((news) => news.isFavorited).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Favourites'),
        centerTitle: true,
      ),
      body: NewsList(newsList: favouritedNewsList, onNewsChanged: () {}),

       bottomNavigationBar: BottomNavigation(
        onAddNews: () {
          // Handle add news action
          // You may want to navigate to the add news page
        },
        onShowFavorites: () {
          // You are already on the favourites page, handle accordingly
        },
      ),
      floatingActionButton: FloatingAddButton(
        onPressed: () {
          // Handle add news action
          // You may want to navigate to the add news page
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}

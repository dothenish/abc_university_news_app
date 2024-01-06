/*=====================================================
* Program: favourites_page.dart
* Purpose: Display the bookmarked/favorited news articles
* Notes:
*======================================================
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umt_news_app/models/news.dart';
import 'package:umt_news_app/views/screen/add_news_page.dart';
import 'home_page.dart';
import '../bottom_navigation.dart';

class FavouritesPage extends StatefulWidget {
  final List<News> newsList;
  

  const FavouritesPage( //constructor
    this.newsList, 
    {super.key}
    );

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
  }
  
  class _FavouritesPageState extends State<FavouritesPage> {
  List<News> newsList = [];
  
    void addNews(News news) {
      setState(() {
        widget.newsList.add(news);
        });
    }

    void navigateToHomePage() {
      Navigator.pushNamed(
        context, 
        '/homepage');
    }

    void navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavouritesPage(newsList),
      ),
    );
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



  @override
  Widget build(BuildContext context) {
    //favorited news list
    List<News> favouritedNewsList = widget.newsList.where((news) 
    => news.isFavorited).toList(); //only favorited/bookmarked news will be included in the list
    
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Favourites',
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: NewsList(newsList: favouritedNewsList, onNewsChanged: () {}),

      //bottom nav bar with FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingAddButton(
        onAddNews: navigateToAddNews
        ),
        bottomNavigationBar: BottomNavigation(
          onShowFavorites: navigateToFavorites,
          toHomePage: navigateToHomePage,
          ),
    );
  }
}

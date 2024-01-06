/*=====================================================
* Program: home_page.dart
* Purpose: Display home screen UI (display news article, nagivation, user interaction)
* Notes:
*======================================================
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umt_news_app/views/bottom_navigation.dart';
import 'add_news_page.dart';
import 'package:umt_news_app/models/news.dart';
import 'favourites_page.dart';
import '../news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //collection of news articles in the 'newsList' list
  List<News> newsList = [];

  //Methods

  void addNews(News news) {
    //Add news article inside the 'newsList'
    setState(() {
      newsList.add(news);
    });
  }

  void onNewsChanged() {
    //state update when changes occur in news list
    setState(() {});
  }

  void navigateToHomePage() {
    //navigate to home page
    Navigator.pushNamed(context, '/homepage');
  }

  void navigateToAddNews() {
    //navigate to add news page
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
    //navigate to favorites page
    //route name is '/favorites'
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavouritesPage(newsList),
        settings: const RouteSettings(name: '/favorites'), //set name property of the RouteSettings obj to '/favorites'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    newsList.sort((a, b) => b.dateAdded.compareTo(a.dateAdded)); //sort newsList base on latest news

    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Column(
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.teal,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ABC Campus News',
                  style: GoogleFonts.nunito(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child:
                  NewsList(newsList: newsList, onNewsChanged: onNewsChanged)
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingAddButton(onAddNews: navigateToAddNews),
            bottomNavigationBar: BottomNavigation(
              onShowFavorites: navigateToFavorites,
              toHomePage: navigateToHomePage,
            ),
          );
        }
      }

class NewsList extends StatelessWidget {
  //display list of news article
  final List<News> newsList;
  final Function onNewsChanged;

  const NewsList({
    super.key, 
    required this.newsList, 
    required this.onNewsChanged
    });

  @override
  Widget build(BuildContext context) {
    //ternary operator
    return newsList.isEmpty //when no news is added yet
    ? const Center(
      child: Text(
        'No recent news added yet',
        style: TextStyle(
          color: Colors.black38,
          fontSize: 18.0,
          fontStyle: FontStyle.italic,
          ),
        ),
      )
      : ListView.builder(
        //render news article
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsCard( // individual article display using card (NewsCard)
          news: newsList[index],
          onNewsChanged: onNewsChanged
          ); 
        },
      );
    }
  }         




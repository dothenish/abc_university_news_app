
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umt_news_app/widgets/bottom_navigation.dart';
import 'add_news_page.dart';
import 'package:umt_news_app/models/news.dart';
import '../widgets/favourites_page.dart';
import 'news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  void navigateToHomePage() {
    Navigator.pushNamed(
      context, 
      '/homepage');
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


  @override
  Widget build(BuildContext context) {
    newsList.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));

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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'UMT News App',
                      style: GoogleFonts.nunito(
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
            child: NewsList(newsList: newsList, onNewsChanged: onNewsChanged)
          ),
        ],
      ),

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

class NewsList extends StatelessWidget {
  final List<News> newsList;
  final Function onNewsChanged;
  
  const NewsList({super.key, required this.newsList, required this.onNewsChanged});

  @override
  Widget build(BuildContext context) {
    return newsList.isEmpty
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
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsCard(news: newsList[index], onNewsChanged: onNewsChanged);
            },
          );
  }
}
         




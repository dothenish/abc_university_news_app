/*=====================================================
* Program: bottom_navigation.dart
* Purpose: navigation options to navigate through pages
* Notes: combination of bottomNavBar and FAB
*======================================================
*/
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  //handle actions when desired icons are pressed
  final Function onShowFavorites; //bookmark icon
  final Function toHomePage; // home icon

  const BottomNavigation({
    super.key, 
    required this.onShowFavorites, 
    required this.toHomePage
    });

  @override
  Widget build(BuildContext context) {
    //define current route name
    //highlight active icon in BNB
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    return BottomAppBar(
      color: Colors.teal[50],
      height: 50,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              currentRoute == '/homepage' ? null : toHomePage();
            },
            icon: Icon(
              Icons.home,
              color: currentRoute == '/homepage' ? Colors.grey : Colors.black,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              currentRoute == '/favorites' ? null : onShowFavorites();
            },
            icon: Icon(
              Icons.bookmark,
              color:
                  currentRoute == '/favorites' ? Colors.grey : Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

//Floating action button to add news
class FloatingAddButton extends StatelessWidget {
  final Function onAddNews;

  const FloatingAddButton({super.key, required this.onAddNews});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent[100],
      onPressed: () {
        onAddNews();
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function onShowFavorites;
  final Function toHomePage;

  const BottomNavigation({super.key, 
    required this.onShowFavorites,
    required this.toHomePage
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal[50],
      height: 50,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              toHomePage();
            },
            icon: const Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              onShowFavorites();
            },
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

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
      child: const Icon(Icons.add,
      color: Colors.black),
    );
  }
}

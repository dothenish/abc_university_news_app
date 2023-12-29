import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function onAddNews;
  final Function onShowFavorites;

  BottomNavigation({
    required this.onAddNews,
    required this.onShowFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
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
  final Function onPressed;

  FloatingAddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: () {
        onPressed();
      },
      child: const Icon(Icons.add),
    );
  }
}

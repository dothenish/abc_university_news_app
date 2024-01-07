/*=====================================================
* Program: news.dart
* Purpose: News object with its attributes
* Notes:
*======================================================
*/
class News {
  final String title;
  final String author;
  final String description;
  final String category;
  final DateTime dateAdded;
  bool isFavorited; // to bookmark a news
  String imageUrl; //to upload image

  News({
    required this.title,
    required this.author,
    required this.description,
    required this.category,
    required this.dateAdded,
    this.isFavorited = false,
    this.imageUrl = "",
  });
}
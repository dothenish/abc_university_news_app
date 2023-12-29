class News {
  final String title;
  final String author;
  final String description;
  final String category;
  final DateTime dateAdded;
  bool isFavorited;
  String imageUrl;

  News({
    required this.title,
    required this.author,
    required this.description,
    required this.category,
    required this.dateAdded,
    this.isFavorited = false,
    this.imageUrl = "",
  });

  //dummy data to test the ui
}
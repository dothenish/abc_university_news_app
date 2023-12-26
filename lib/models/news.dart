class News {
  final String title;
  final String description;
  final String category;
  final DateTime dateAdded;
  bool isFavourited;

  News({
    required this.title,
    required this.description,
    required this.category,
    required this.dateAdded,
    this.isFavourited = false
  });
}
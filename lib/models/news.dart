class News {
  final String title;
  final String description;
  final String category;
  final DateTime dateAdded;
  bool isFavorited;

  News({
    required this.title,
    required this.description,
    required this.category,
    required this.dateAdded,
    this.isFavorited = false
  });
}
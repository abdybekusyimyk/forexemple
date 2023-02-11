class News {
  News(
      {required this.status,
      required this.totalResults,
      required this.title,
      required this.publishedAt});

  final String status;
  final int totalResults;
  final String title;
  final String publishedAt;
}

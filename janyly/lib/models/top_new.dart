import 'package:janyly/models/articles.dart';

class TopNew {
  final String status;
  final int totalResults;

  final List<Article> articles;

  TopNew(
      {required this.status,
      required this.totalResults,
      required this.articles});
}

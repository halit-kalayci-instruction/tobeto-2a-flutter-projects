abstract class ArticleState {}

class ArticlesNotLoaded extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Object> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesLoading extends ArticleState {}

class ArticlesLoadFail extends ArticleState {}

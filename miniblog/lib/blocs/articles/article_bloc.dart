import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/articles/article_event.dart';
import 'package:miniblog/blocs/articles/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  // Initial State => Başlangıç state'i
  ArticleBloc() : super(ArticlesNotLoaded()) {
    on<FetchArticles>(_fetchArticles);
  }

  void _fetchArticles(FetchArticles event, Emitter<ArticleState> emit) {
    emit(ArticlesLoading());
    // .. http kodlarını
    emit(ArticlesLoadFail());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/articles/article_bloc.dart';
import 'package:miniblog/blocs/articles/article_state.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state is ArticlesNotLoaded) {
        return const Center(
          child: Text("Yazıların yükleme işlemi başlamadı.."),
        );
      }

      if (state is ArticlesLoading) {
        return const CircularProgressIndicator();
      }

      return const Text("Bilinmedik durum..");
    });
  }
}

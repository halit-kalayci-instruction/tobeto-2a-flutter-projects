import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/articles/article_bloc.dart';
import 'package:miniblog/blocs/articles/article_event.dart';
import 'package:miniblog/blocs/articles/article_state.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

// 10:30
class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    // BlocListener => State değiştiğinde bir kod bloğu çalıştır. (UI'ı tekrar build etmez.)
    // BlocBuilder => State değiştiğinde UI'i değiştirir.
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state is ArticlesNotLoaded) {
        context.read<ArticleBloc>().add(FetchArticles());
        return const Center(
          child: Text("Yazıların yükleme işlemi başlamadı.."),
        );
      }

      if (state is ArticlesLoading) {
        return const CircularProgressIndicator();
      }

      if (state is ArticlesLoadFail) {
        return const Center(
          child: Text("Blogların yüklenmesinde hata oluştu"),
        );
      }

      if (state is ArticlesLoaded) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) =>
                    Text(state.blogs[index].title!),
              ),
            ),
          ],
        );
      }

      return const Text("Bilinmedik durum..");
    });
  }
}

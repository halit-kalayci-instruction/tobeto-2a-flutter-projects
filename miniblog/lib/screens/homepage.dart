import 'package:flutter/material.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/screens/blog_list.dart';
import 'package:miniblog/themes/dark_theme.dart';
import 'package:miniblog/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => AddBlog()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const BlogList(),
    );
  }
}

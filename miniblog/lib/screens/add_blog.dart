import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  String blogTitle = "";
  String blogContent = "";

  void submit() {
    print(blogTitle);
    print(blogContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Blog Ekle"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Blog Başlığı Giriniz"),
                ),
                onSaved: (newValue) {
                  blogTitle = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Blog başlığı boş olamaz.";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Blog İçeriği Giriniz"),
                ),
                onSaved: (newValue) {
                  blogContent = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Blog içeriği boş olamaz.";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      submit();
                    }
                  },
                  child: const Text("Kaydet"))
            ]),
          ),
        ));
  }
}

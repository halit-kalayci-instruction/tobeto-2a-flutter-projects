import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  String blogTitle = "";
  String blogContent = "";
  XFile? selectedImage;
  String author = "";

  // Business Logic
  void _submit() async {
    if (selectedImage != null) {
      // Veri Erişim
      Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");

      var request = http.MultipartRequest("POST", url);
      request.fields["Title"] = blogTitle;
      request.fields["Content"] = blogContent;
      request.fields["Author"] = author;

      final file =
          await http.MultipartFile.fromPath("File", selectedImage!.path);
      request.files.add(file);

      final response = await request.send();

      if (response.statusCode == 201) {
        // Başarılı
        Navigator.pop(context);
      }
    }
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = file;
    });
  }
  // Business Logic

  // UI
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
              if (selectedImage != null)
                Image.file(
                  File(selectedImage!.path),
                  height: 250,
                ),
              ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  child: const Text("Fotoğraf Seç")),
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
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Yazar İsmi Giriniz"),
                ),
                onSaved: (newValue) {
                  author = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Yazar ismi boş olamaz.";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _submit();
                    }
                  },
                  child: const Text("Kaydet"))
            ]),
          ),
        ));
  }
  // UI
}

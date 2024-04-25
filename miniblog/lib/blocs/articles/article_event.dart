import 'package:image_picker/image_picker.dart';

sealed class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class AddArticle extends ArticleEvent {
  XFile? file;
}
// Abstract => Soyut
// new() yasak.
// Bir grup sınıf tanımını ortak bir arayüzle sağlamak.
// Hem tam, hem soyut tanımlamalar bulunur.



// Sealed
// Altındaki class seti belirlidir ve bu set ile %100 uyumlu çalışmalıdır.
// new() ile instance oluşturulabilir.